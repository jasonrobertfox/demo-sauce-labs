##Dependencies
Normally this package would be assembled with some form of one line install to manage the depencencies, however for the sake of clarity we require some basics to get things up and running:

- Composer
- Apache Ant

##Setting Up the Package
Install the dependencies with `composer install`

Ensure you have made a copy of the `config/behat.properties.dist` file to something like `local.behat.properties` and add in your Sauce Labs user name and API Key.

Then run `ant behat:config -Denv=local` to configure your behat and sauce connect. (`local` is whatever prefix you put in front of `behat.properties`)

##Runngng the Tests

###Local Testing
In a situation where you are developing the tests along side the application undertest, it would make sense to automate the start up of the local application/web server. In this case we should assume it's running.

For this demo, you will need to start the app first before running local tests:

    cd ../application
    rake start

####Basic Behat
Run `ant behat` to run all the tests "headlessly" but not those tagged with the `@javascript` tag.

####Phantom Headless
First start an instance of the phantomjs headless browser:

    phantomjs --webdriver=8643

Then run the full test suite in the phantomjs browser:

    ant behat:headless

####Selenium
First start an instance of the [selenium server](http://docs.seleniumhq.org/download/):

    java -jar selenium-server-standalone-2.32.0.jar

Next run the full test suite using automation of the firefox browser:

####Sauce Labs
Start by running `bin/sauce_connect` to start the connection

Next run `ant behat:sauce` to run the tests on Sauce Labs as you had configured them in the `behat.yml` file.
