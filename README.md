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


```
Verb   URI Pattern                                                                              Controller#Action
GET    /song_covers                                                                   song_covers#index {:format=>:json}
POST   /song_covers                                                                   song_covers#create {:format=>:json}
GET    /song_covers/:id                                                               song_covers#show {:format=>:json}
PATCH  /song_covers/:id                                                               song_covers#update {:format=>:json}
PUT    /song_covers/:id                                                               song_covers#update {:format=>:json}
DELETE /song_covers/:id                                                               song_covers#destroy {:format=>:json}
GET    /songs                                                                         songs#index {:format=>:json}
POST   /songs                                                                         songs#create {:format=>:json}
GET    /songs/:id                                                                     songs#show {:format=>:json}
PATCH  /songs/:id                                                                     songs#update {:format=>:json}
PUT    /songs/:id                                                                     songs#update {:format=>:json}
DELETE /songs/:id                                                                     songs#destroy {:format=>:json}
GET    /participants                                                                  participants#index {:format=>:json}
POST   /participants                                                                  participants#create {:format=>:json}
GET    /participants/:id                                                              participants#show {:format=>:json}
PATCH  /participants/:id                                                              participants#update {:format=>:json}
PUT    /participants/:id                                                              participants#update {:format=>:json}
DELETE /participants/:id                                                              participants#destroy {:format=>:json}
GET    /music_contests                                                                music_contests#index {:format=>:json}
POST   /music_contests                                                                music_contests#create {:format=>:json}
GET    /music_contests/:id                                                            music_contests#show {:format=>:json}
PATCH  /music_contests/:id                                                            music_contests#update {:format=>:json}
PUT    /music_contests/:id                                                            music_contests#update {:format=>:json}
DELETE /music_contests/:id                                                            music_contests#destroy {:format=>:json}
GET    /contest_song_participant_votes                                                contest_song_participant_votes#index {:format=>:json}
POST   /contest_song_participant_votes                                                contest_song_participant_votes#create {:format=>:json}
GET    /contest_song_participant_votes/:id                                            contest_song_participant_votes#show {:format=>:json}
PATCH  /contest_song_participant_votes/:id                                            contest_song_participant_votes#update {:format=>:json}
PUT    /contest_song_participant_votes/:id                                            contest_song_participant_votes#update {:format=>:json}
DELETE /contest_song_participant_votes/:id                                            contest_song_participant_votes#destroy {:format=>:json}
GET    /current_contest                                                               music_contests#current_contest {:format=>:json}
GET    /current_contest_songs/:contest_id                                             songs#current_contest_songs {:format=>:json}
POST   /delete_song                                                                   songs#delete_submitted_song {:format=>:json}
POST   /submit_song                                                                   songs#submit_song {:format=>:json}
GET    /current_contest_ranking                                                       contest_song_participant_votes#current_contest_ranking {:format=>:json}
POST   /vote_song                                                                     contest_song_participant_votes#vote_song {:format=>:json}

```



## Design

The internal database structure design is as follows:


![Database diagram](https://raw.githubusercontent.com/romera94/MusicContest/master/docs/diagram.png "Database diagram")


## License

Registered under MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
