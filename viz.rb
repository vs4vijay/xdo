require "mongo"
require "mongoid"

Mongoid.configure do |config|
    config.master = Mongo::Connection.new("localhost",27017).db("viz")
end

class Viz
    include Mongoid::Document
    field :name, type: String
end

a = Viz.create(name: "viz")
