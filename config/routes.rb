Rails.application.routes.draw do
  
  namespace :api do
       
   

     get 'authors', to:'authors#index'
     post 'authors', to:'authors#create'
     get 'authors/:id', to:'authors#show'
     delete 'authors/:id', to:'authors#destroy'
     put 'authors/:id', to:'authors#update'

  
     
  end
end

