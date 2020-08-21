# frozen_string_literal: true

Rails.application.routes.draw do
  get  '/teryt/:teryt/file_pdf', to: 'teryt#file_pdf'
  get  '/teryt/:teryt/file_xlsx', to: 'teryt#file_xlsx'

  get '/api_teryt/provinces_select2_index',          to: 'api_teryt#provinces_select2_index'
  get '/api_teryt/province_districts_select2_index', to: 'api_teryt#province_districts_select2_index'
  get '/api_teryt/district_communes_select2_index',  to: 'api_teryt#district_communes_select2_index'

  post '/areas/find_or_create', to: 'areas#find_or_create'
  get  '/areas/info', to: 'areas#info'

  # resources :areas, except: [:show, :create]
  resources :areas, only: [:index]

  root 'areas#index'
end
