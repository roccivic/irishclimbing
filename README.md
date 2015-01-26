# Prerequisites

* install node.js http://nodejs.org/
* install grunt http://gruntjs.com/
* install bower http://bower.io/
* install coffeescript http://coffeescript.org/
* run `npm install && bower install` from the `frontend` folder

# Before building

* change the path to the backend in `frontend/app/scripts/config.coffee`
* change required directives in `backend/config.php` (useg password_hash PHP function to generate your admin hash)

# Building

run `grunt serve` command from the `frontend` folder to start a new development server

run `grunt build` command from the `frontend` folder to create a deployable build
the output of the build will be located in the `frontend/dist` folder
