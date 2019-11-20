# ![Logo](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo") Weekly Music Contest 

## Rationale

MB Music Contest API. This Rails Application will serve all the logic to manage a employees's weekly music contest platform.

## Requirements

The application uses:

* ruby 2.6.3 (a ruby manager like `rvm` is useful here)
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

The list of endpoints, payloads and methods is:

`(W.I.P.)`


Application Endpoints:

```
GET        /current_contest
GET        /current_contest_songs/:contest_id
POST       /delete_song
POST       /submit_song
GET        /current_contest_ranking
POST       /vote_song
```

Default REST-API endpoints

```
Verb       URI Pattern
GET        /song_covers
POST       /song_covers
GET        /song_covers/:id
PATCH      /song_covers/:id
PUT        /song_covers/:id
DELETE     /song_covers/:id
GET        /songs
POST       /songs
GET        /songs/:id
PATCH      /songs/:id
PUT        /songs/:id
DELETE     /songs/:id
GET        /participants
POST       /participants
GET        /participants/:id
PATCH      /participants/:id
PUT        /participants/:id
DELETE     /participants/:id
GET        /music_contests
POST       /music_contests
GET        /music_contests/:id
PATCH      /music_contests/:id
PUT        /music_contests/:id
DELETE     /music_contests/:id
GET        /contest_song_participant_votes
POST       /contest_song_participant_votes
GET        /contest_song_participant_votes/:id
PATCH      /contest_song_participant_votes/:id
PUT        /contest_song_participant_votes/:id
DELETE     /contest_song_participant_votes/:id
```



## Design

The internal database structure design is as follows:


![Database diagram](https://raw.githubusercontent.com/romera94/MusicContest/master/docs/er_diagram.png "Database diagram")


## License

Registered under MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
