# frozen_string_literal: true
class PitTerytController < ApplicationController

  def provinces_select2_index
    provinces_obj = PitTerytProvince.new(q: params[:q])
    provinces_obj.run_request

    array_list = params[:q].blank? ? provinces_obj.array_provinces : provinces_obj.array_query_provinces
    render json: { provinces: array_list, meta: { total_count: array_list.size } }, status: provinces_obj.response.code
  end

  def province_districts_select2_index
    districts_obj = PitTerytProvinceDistrict.new(province_id: params[:province_id], q: params[:q])
    districts_obj.run_request

    array_list = params[:q].blank? ? districts_obj.array_districts : districts_obj.array_query_districts
    array_list_on_page = Kaminari.paginate_array(array_list).page(params[:page]).per(params[:page_limit])

    render json: { districts: array_list_on_page, meta: { total_count: array_list.size } }, status: districts_obj.response.code
  end

  def district_communes_select2_index
    communes_obj = PitTerytDistrictCommune.new(district_id: params[:district_id], q: params[:q])
    communes_obj.run_request

    array_list = params[:q].blank? ? communes_obj.array_communes : communes_obj.array_query_communes
    array_list_on_page = Kaminari.paginate_array(array_list).page(params[:page]).per(params[:page_limit])

    render json: { communes: array_list_on_page, meta: { total_count: array_list.size } }, status: communes_obj.response.code
  end

end
