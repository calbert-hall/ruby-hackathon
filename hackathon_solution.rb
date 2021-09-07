require 'eyes_selenium'
require 'webdrivers'

APPLIFASHIONV1 = "https://demo.applitools.com/gridHackathonV1.html"
APPLIFASHIONVDEV = "https://demo.applitools.com/tlcHackathonDev.html"
APPLIFASHIONV2 = "https://demo.applitools.com/gridHackathonV2.html"

# TODO set to true to enable dynamic content
DYNAMIC_CONTENT = false 
# TODO change the ENV_URL to change which environment is used
ENV_URL = APPLIFASHIONV1

#Useful Selectors: Use find ID for the first two, and xPath for the third ()
BLACKCOLOR_FILTER = "SPAN__checkmark__107" #ID
FILTERBUTTON ="filterBtn" #ID
BLACKSHOES_IMAGE = "/html/body/div[1]/main/div/div/div/div[4]/div[1]/div/figure/a/img" #XPATH

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Create a new chrome web driver
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless') if ENV['CI'] == 'true'
web_driver = Selenium::WebDriver.for :chrome, options: options

# Create a runner with concurrency of 1
visual_grid_runner = Applitools::Selenium::VisualGridRunner.new(1)

# Create Eyes object with the runner, meaning it'll be a Visual Grid eyes.
eyes = Applitools::Selenium::Eyes.new(runner: visual_grid_runner)

# Initialize eyes Configuration
eyes.configure do |conf|
  #  You can get your api key from the Applitools dashboard
  conf.api_key = ENV['APPLITOOLS_API_KEY']
  # create a new batch info instance and set it to the configuration
  conf.batch = Applitools::BatchInfo.new("Ruby Hackathon Solution")
  conf.app_name = 'Applifashion'
  conf.test_name = 'Shoe filter workflow - Solution'
  conf.viewport_size = Applitools::RectangleSize.new(1200, 800)
  # Add browsers with different viewports
  conf.add_browser(1200, 800, BrowserType::CHROME)
      .add_browser(700, 500, BrowserType::FIREFOX)
      .add_browser(800,600, BrowserType::SAFARI)
  #  Add mobile emulation devices in Portrait mode
  conf.add_device_emulation(Devices::IPhoneX, Orientation::PORTRAIT)
end

begin

  # Call Open on eyes to initialize a test session
  driver = eyes.open(driver: web_driver)

  driver.get(ENV_URL)

  if DYNAMIC_CONTENT
    driver.execute_script("document.querySelectorAll('h3').forEach(function(noFade) { noFade.innerHTML = Math.random().toString(36);})")
  end

  # check the login page with fluent api, see more info here
  # https://applitools.com/docs/topics/sdk/the-eyes-sdk-check-fluent-api.html
  eyes.check('Main page', Applitools::Selenium::Target.window.fully)

  driver.find_element(:id, BLACKCOLOR_FILTER).click
  driver.find_element(:id, FILTERBUTTON).click

  eyes.check('Black Shoes Filter', Applitools::Selenium::Target.window.fully)

  driver.find_element(:xpath, BLACKSHOES_IMAGE).click

  eyes.check('Air x Night', Applitools::Selenium::Target.window.fully)

  # Call Close on eyes to let the server know it should display the results
  eyes.close(false)
ensure
  # Close the browser
  driver.quit
  # If the test was aborted before eyes.close / eyes.close_async was called, ends the test as aborted.
  eyes.abort_async

  # we pass false to this method to suppress the exception that is thrown if we
  # find visual differences
  results = visual_grid_runner.get_all_test_results(false)
  puts results
end
