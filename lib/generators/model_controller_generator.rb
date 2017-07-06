class ModelControllerGenerator < Rails::Generators::Base
  def create_initializer_file
    # generate "model", "note body:text user:references"
    # generate "controller", "notes index show new create edit update destroy"
    # route "resources :notes"

    # generate "model", "like user:references note:references"
    # generate "controller", "likes create destroy"
    # route "resources :likes, only: [:create, :destroy]"

    # generate "model", "relationship"
    generate "controller", "relationships create destroy"
    route "resources :relationships, only: [:create, :destroy]" 

    # rake "db:migrate"
  end
end