# Prerequisites

* install node.js http://nodejs.org/
* install grunt http://gruntjs.com/
* install bower http://bower.io/
* install coffeescript http://coffeescript.org/
* run `npm install && bower install` from the `frontend` folder

# Before building

* change the path to the backend in `frontend/app/scripts/config.coffee`
* change the authentication password hash in `backend/common.php` (generate using password_hash PGP function)
* change the mysql connection details in `backend/common.php`

# Building

run `grunt serve` command from the `frontend` folder to start a new development server

run `grunt build` command from the `frontend` folder to create a deployable build
the output of the build will be located in the `frontend/dist` folder
