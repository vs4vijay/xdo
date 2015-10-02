class Todo
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Attributes::Dynamic
  #include Her::Model

  #field :_id, type: String, default: ->{ name }
  field :name, type: String
  field :text, type: String
  field :done, type: Boolean, default: false
end
