Rails.application.routes.draw do
  get 'students/index'
  get 'students/show'
  get 'students/create'
  get 'students/update'
  get 'students/destroy'
  resources :instructors 
  resources :students
  
end
