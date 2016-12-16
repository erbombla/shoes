# _Shoe Distribution_

#### Web app for an online shoe store

#### By Eric Bomblatus
#### Dec. 15, 2016

**User Stories**

_As a user, I want to:_

* Add, update, delete and list shoe stores
* Add and list new shoe brands
* Add shoe brands in the application
* Add existing shoe brands to a store to show where they are sold
* Associate the same brand of shoes with multiple stores
* See all of the brands a store sells on the individual store page
* Save names and shoe brands with a capital letter
* _I do not want_ stores and shoe brands to be saved if I enter a blank name

## Setup/Installation Requirements

* Clone this repo: `git clone https://github.com/erbombla/shoes.git`
* Change to the repo directory: `cd {repo}`
* Install gems: `bundle install --path vendor/bundle`
* Install the database: *instruction below*
* Run the app: `ruby app.rb`

## Database Setup Instructions

* install and start postgres
* run: `bundle exec rake db:create`
* run: `bundle exec rake db:migrate`
* run: `bundle exec rake db:test:prepare`

## Technologies Used

* Ruby
* Sinatra
* SQL
* Postgres

### License

*MIT License*

Copyright (c) 2016 **Eric Bomblatus**
