Rails.application.routes.draw do
  get '/characters'           , to: 'character_class#show', defaults: { format: 'json' }
  get '/classes'              , to: 'character_class#classes', defaults: { format: 'json' }
  post '/characters/create'   , to: 'character_class#create', defaults: { format: 'json' }

end
