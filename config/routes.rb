Rails.application.routes.draw do

  get  '/teryt/:teryt/file_pdf', to: 'teryt#file_pdf'
  get  '/teryt/:teryt/file_xlsx', to: 'teryt#file_xlsx'

  get '/teryt/provinces_select2_index',          to: 'pit_teryt#provinces_select2_index'
  get '/teryt/province_districts_select2_index', to: 'pit_teryt#province_districts_select2_index'
  get '/teryt/district_communes_select2_index',  to: 'pit_teryt#district_communes_select2_index'

  post '/areas/find_or_create', to: 'areas#find_or_create'
  get  '/areas/info', to: 'areas#info'

  #resources :areas, except: [:show, :create]
  resources :areas, only: [:index]

  root 'areas#index'
end
