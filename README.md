# xdo
A simple ToDo application in Sinatra, Ruby on Rails, and MongoDB


## Technology used
  - Ruby
    - Sinatra - API Server
    - Rails - Frontend API Handler
    - her - ORM
    - gems used
      - `sinatra` and `sinatra-contrib`
      - `mongoid` - An ODM for MongoDB
      - `her` - A Restful Object Request mapper
      - `thin`
  - AngularJS
  - Bootstrap and jQuery
  - MongoDB


## Installation
  - Install gems using `gem install sinatra sinatra-contrib mongoid her`
  - For Sinatra API server
    - go to `xdo-sinatra` using `cd cdo-sinatra`
    - run `xdo.rb` using `ruby xdo.rb` or `rackup`
  - For Rails server
    - go to `xdo-rails` in different terminal using `cd xdo-rails`
    - run `rails server`
  - Start Mongodb server using `mongod` on another terminal
