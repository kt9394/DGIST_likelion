
Rails.application.routes.draw do

  get 'analysis/q1'



  get 'analysis/q2'



  get 'analysis/q3'



  get 'analysis/q4'



  get 'analysis/q5'



  get 'analysis/result_page'


  get 'analysis/information_page'



  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end