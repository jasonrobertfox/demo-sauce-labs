##Dependencies
Normally this package would be assembled with some form of one line install to manage the depencencies, however for the sake of clarity we require some basics to get things up and running:

- Bundler

##Setting up the Application
1. Install the dependencies with `bundle install`

##Testing
###Local Testing
In a situation where you are developing the tests along side the application undertest, it would make sense to automate the start up of the local application/web server. In this case we should assume it's running.

For this demo, you will need to start the app first before running local tests:

    cd ../application
    rake start

####Phantom Headless
The `poltergeist` gem makes it quite simple to run the cucumber tests via phantom:

    rake cucumber

####Sauce Labs
Ensure you have created a `ondemand.yml` in the following format to configure the sacuce connect:

    access_key: <yourkeyhere>
    username: <yourusernamehere>

Run the sauce labs tests with the rake task `rake selenium`

