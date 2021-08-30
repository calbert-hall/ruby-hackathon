# Applitools Hackathon: Ruby 

### READ FIRST: Hackathon Structure 
1. At least **one week before the hackathon**, complete the pre-requisites as well as run the first example to ensure that everything has been installed correctly. 
2. On the day of the hackathon, follow the instructions in the hackathon section. 
3. If you finish the hackathon exercises with extra time available (or want to experiment more after the event), 
   see the "Additional Exercises" below. 


## Prerequisites:

1. Ruby is installed on your machine.
   
   * [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
   
3. Chrome Webdriver is on your machine and is in the PATH. Here are some resources from the internet that'll help you.

   * https://splinter.readthedocs.io/en/0.1/setup-chrome.html
   * https://stackoverflow.com/questions/38081021/using-selenium-on-mac-chrome
   * https://www.youtube.com/watch?time_continue=182&v=dz59GsdvUF8

4. (Optional) VS Code, Rubymine or another IDE is installed on your machine.

   * [Install VS Code](https://code.visualstudio.com/) or [RubyMine](https://www.jetbrains.com/ruby/)


### Running the first example

1. Git clone this repo 
   
   * `git clone https://github.com/calbert-hall/ruby-hackathon`, or download as a Zip file and unzip. 
   
2. Navigate to just cloned folder ruby_hackathon.

3. Get an API key by logging into Applitools > Person Icon > My API Key.

4. Open in any editor file `simple_test_script.rb`  and set your ApiKey in string `conf.ApiKey("...")` (or comment the string and set APPLITOOLS_API_KEY environment variable). 

5. Install dependencies `gem install bundler && bundle install`.

6. Run `bundle exec ruby simple_test_script.rb`.

# Hackathon Exercise!

* In this exercise, you'll be a Test Engineer looking to run tests on an e-commerce site, "Applifashion". 
  You'll be using Applitools to find and report bugs and handle dynamic content using Applitools' visual AI.
  You'll be working in the `hackathon_activity.rb` file. An example solution is available in the `hackathon_solution.rb` file, but don't look unless you're stuck! If you want to see view the expected results, you can run  `bundle exec ruby hackathon_solution.rb`.

1. Open up the `hackathon_activity` ruby file. Put your name (or team name) as the Batch name, and be sure to set your API key as you did in the first example. You can run this using bundle exec ruby `hackathon_activity.rb`.


2. We'll start with a test on [Applifashion V1](https://demo.applitools.com/gridHackathonV1.html). Create an Applitools test that navigates to the main page and takes a full page screenshot. See the first example on how to do this.

   
3. Next, we'll use Selenium webdriver to click the "black" filter button, and then click the filter button. The needed CSS selectors are provided for your use. After filtering, take another screenshot with Applitools. 
   Both of these eyes.check calls should be within the same test.
   

4. Now, you'll use the Selenium webdriver to click the "Appli Air x Night" shoes and take another full page Applitools check. You should have a test with 3 checks. 
 

5. Set the `dynamicContent` boolean to `true`. Re-run your test, and notice that your initial test will fail due to dynamic content. 
Draw a layout region over the area, or set the match level to "Layout" from within the SDK. Once you see that your test now passes, you can delete the region and turn off `dynamicContent`. 
   
 
6. Next, run the same test on the [Applifashion dev site](https://demo.applitools.com/tlcHackathonDev.html). To do this, change the `ENV_URL` to `APPLIFASHION_DEV`. Note that the main page doesn't have a shoe in the main area. 
   See that the black shoes filtering has a functional bug! Also notice how the "Appli Air x night" has a visual bug. 
   Place a bug region on each of the areas and accept the differences. Snooze failures on the bug regions for 2 weeks.
   

7. Development has made the changes to the bug region, which are on [Applifashion V2](https://demo.applitools.com/gridHackathonV2.html). 
Run your test suite on Applifashion V2 (Set `ENV_URL` to `APPLIFASHIONV2)
and accept the now-fixed change and delete the bug region. 
You'll see several unresolved tests; accept them and add or remove regions as needed!
  
 
8. You now want to test your site on multiple browsers and viewport sizes, including mobile viewports. Set the browser configurations in the eyes.configure "do" block. 
Add `iPhone_X` in portrait mode, and FireFox 1200 x 800 as browsers for the Ultrafast test cloud. Run the test to see your test 
   on these configurations!

### Additional Challenges
* Add another check that clicks the "Applifashion" home link in the upper left. What happens on v1 vs the dev environment? 


* Find a selector and apply a [coded region](https://help.applitools.com/hc/en-us/articles/360007188211-Coded-Ignore-Regions) to it. 


* Try testing a different site of your choice. Look for ways to handle dynamic content and get stable tests.  

* If you need more challenges, ask your hackathon administrator!

## Resources
- [Applitools SDK Documentation](https://github.com/applitools/eyes.sdk.ruby)
- [Applitools Best Practices](https://applitools.com/docs/topics/general-concepts/visual-test-best-practices.html)