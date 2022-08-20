class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  post "/login" do 
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/tasks"
    else
      { message: "Your credentials are invalid!" }.to_json
      redirect to "/"
    end
  end

  get '/todos' do 
    todos = Todo.all
    todos.to_json
  end


  get '/todolist' do 
    todolist = TodoList.all
    todolist.to_json
  end

  post "/todo" do 
    todo = Todo.create(name: params[:name],description: params[:description])
    todo.to_json
  end

  post "/todolist" do 
    todolist = TodoList.create(text: params[:text],color: params[:color])
    todolist.to_json
  end


  patch "/todos/:id" do 
    todo = Todo.find(params[:id])
    todo.update(name: params[:name],description: params[:description])
    todo.to_json
  end

  patch "/todo/:id" do 
    todo = Todo.find(params[:id])
    todo.destroy
    todo.to_json
  end

end
