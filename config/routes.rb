Rails.application.routes.draw do
  get '/characters', to: 'character_class#show', defaults: { format: 'json' }
end
