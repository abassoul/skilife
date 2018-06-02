Rails.application.routes.draw do
  # Routes for the Mountain resource:
  # CREATE
  get "/mountains/new", :controller => "mountains", :action => "new"
  post "/create_mountain", :controller => "mountains", :action => "create"

  # READ
  get "/mountains", :controller => "mountains", :action => "index"
  get "/mountains/:id", :controller => "mountains", :action => "show"

  # UPDATE
  get "/mountains/:id/edit", :controller => "mountains", :action => "edit"
  post "/update_mountain/:id", :controller => "mountains", :action => "update"

  # DELETE
  get "/delete_mountain/:id", :controller => "mountains", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
