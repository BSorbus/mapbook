# frozen_string_literal: true
class ApiTerytController < ApplicationController

  def provinces_select2_index
    items_obj = ApiTerytProvince.new(q: "#{params[:q]}", page: "#{params[:page]}", page_limit: "#{params[:page_limit]}")
    if items_obj.request_for_collection # return true
      render json: JSON.parse(items_obj.response.body), status: items_obj.response.code
    else
      if items_obj.response.present?
         render json: { error: items_obj.response.message }, status: items_obj.response.code 
      else 
         render json: { error: items_obj.errors.messages }, status: :unprocessable_entity
      end
    end
  end

  def province_districts_select2_index
    items_obj = ApiTerytProvinceDistricts.new(id: params[:province_id], q: "#{params[:q]}", page: "#{params[:page]}", page_limit: "#{params[:page_limit]}")
    if items_obj.request_for_collection # return true
      render json: JSON.parse(items_obj.response.body), status: items_obj.response.code
    else
      if items_obj.response.present?
         render json: { error: items_obj.response.message }, status: items_obj.response.code 
      else 
         render json: { error: items_obj.errors.messages }, status: :unprocessable_entity
      end
    end
  end

  def district_communes_select2_index
    items_obj = ApiTerytDistrictCommunes.new(id: params[:district_id], q: "#{params[:q]}", page: "#{params[:page]}", page_limit: "#{params[:page_limit]}")
    if items_obj.request_for_collection # return true
      render json: JSON.parse(items_obj.response.body), status: items_obj.response.code
    else
      if items_obj.response.present?
         render json: { error: items_obj.response.message }, status: items_obj.response.code 
      else 
         render json: { error: items_obj.errors.messages }, status: :unprocessable_entity
      end
    end
  end


end
