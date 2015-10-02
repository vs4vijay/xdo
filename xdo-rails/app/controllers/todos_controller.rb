class TodosController < ApplicationController

  def index
    @todos = Todo.all
    todos = []
    @todos.each do |todo|
      todos << todo.attributes # {text: todo.text, name: todo.name, id: todo._id['$oid']}
    end
    render json: todos
  end

  def create
    @todo = Todo.create(params)
    render json: @todo.attributes
  end

  def update
    @todo = Todo.save_existing(params[:id], params[:todo])
    render json: @todo.attributes
  end

  def show
    render json: {}
  end

  private

  def todo_params
    params.permit(:name, :text, :done, {:_id => []}, :created_at, :updated_at)
  end

end
