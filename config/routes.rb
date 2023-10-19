Rails.application.routes.draw do

  get '/characters'           , to: 'character#read', defaults: { format: 'json' }
  post '/characters/create'   , to: 'character#create', defaults: { format: 'json' }
  put '/characters/update'    , to: 'character#update', defaults: { format: 'json' }
  delete '/characters/delete' , to: 'character#delete', defaults: { format: 'json' }

  get '/classes'              , to: 'character_class#read', defaults: { format: 'json' }

end
