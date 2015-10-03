# xDo
A simple ToDo application in Sinatra, Ruby on Rails, and MongoDB.
Deployed at http://xdo.mybluemix.net/


## Technology used
  - Ruby
    - Sinatra - API Server
    - Rails - Frontend API Handler
    - her - ORM
    - gems used
      - `sinatra` and `sinatra-contrib`
      - `mongoid` - An ODM for MongoDB
      - `her` - A Restful Object Request mapper
        - `faraday_middleware`
      - `thin`
  - AngularJS
  - Bootstrap and jQuery
  - MongoDB


## Functionality
  - User can add ToDo Task
  - Mark task as done
  - Edit task on double click of task description
  - Search task


## Installation
  - Install gems using `gem install sinatra sinatra-contrib mongoid her faraday_middleware`
  - For Sinatra API server
    - go to `xdo-sinatra` using `cd cdo-sinatra`
    - run `xdo.rb` using `ruby xdo.rb` or `rackup`
  - For Rails server
    - go to `xdo-rails` in different terminal using `cd xdo-rails`
    - do a `bundle install` to make sure all the dependencies installed
    - run `rails server`
  - Start Mongodb server using `mongod` on another terminal
  - Now open rails server `localhost:3000` on browser.
