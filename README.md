# Weekly Music Contest ![Logo](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo")

## Rationale

MB Music Contest API. This Rails Application will serve all the logic to manage a employees's weekly music contest platform.

## Requirements

The application uses:

* ruby 2.6.3 (ruby manager like `rvm` is useful here)
* Rails 5.2
* bundler gem (`gem install bundler`)
* git (recommended)
* Postgres database 

## Setup

Once you meet the requirements in the previous section, 

### Download the code

- Download the repo (using `git`)

    $ git clone git@github.com:romera94/MusicContest.git

- Download the repo through browser (https://github.com/romera94/MusicContest/archive/master.zip) and unzip it.

### Environment variables

The configuration is performed through environment variables. 

To setup the environment variables so they can point to your (postgres) database account, run:

    $ export DB_NAME=your_database_name_here
    $ export DB_USER=your_db_user_here
    $ export DB_PASS=your_db_password_here


### Run the setup script

the setup script will, 

- check some requirements 
- install all the required gems
- install the database schema and a initial data dump
- run tests

to start, run:

    $ cd MusicContest
    $ bin/setup
    $ rails s

Now you can reach the API through your browser or an app like 'Postman' in

    http://localhost:3000

## Endpoint List

The list of endpoints, payloads and methos is:


T.B.C


## Design

The design of internal database structure is as follows:


![Database diagram](https://raw.githubusercontent.com/romera94/MusicContest/master/docs/diagram.png "Database diagram")


## License

Registered under MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
