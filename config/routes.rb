Rails.application.routes.draw do

  get  '/teryt/street_data/:id', to: 'teryt#street_data'
  get  '/teryt/street_search', to: 'teryt#street_search'
  get  '/teryt/provinces', to: 'teryt#provinces'
  get  '/teryt/province_districts', to: 'teryt#province_districts'
  get  '/teryt/district_communes', to: 'teryt#district_communes'
  get  '/teryt/:teryt/file_pdf', to: 'teryt#file_pdf'
  get  '/teryt/:teryt/file_xlsx', to: 'teryt#file_xlsx'

  post '/areas/find_or_create', to: 'areas#find_or_create'
  get  '/areas/info', to: 'areas#info'

  #resources :areas, except: [:show, :create]
  resources :areas, except: [:show, :new, :create, :edit, :update, :destroy]

  root 'areas#index'
end
