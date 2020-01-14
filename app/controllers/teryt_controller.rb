# frozen_string_literal: true

require 'net/http'

class TerytController < ApplicationController
  def file_pdf
    @area = Area.find_by(teryt: params[:teryt])
    # redirect_to @area.file_pdf.service_url
    # redirect_to @area.file_pdf.rails_blob_url
    redirect_to url_for(@area.file_pdf)

    # render plain:  "area_commune_file_pdf for: #{@area.commune_name}"
  end

  def file_xlsx
    @area = Area.find_by(teryt: params[:teryt])
    # redirect_to @area.file_pdf.service_url
    # redirect_to @area.file_pdf.rails_blob_url
    redirect_to url_for(@area.file_xlsx)

    # render plain:  "area_commune_file_pdf for: #{@area.commune_name}"
  end
end
