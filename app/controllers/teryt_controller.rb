require 'net/http'

class TerytController < ApplicationController

  def provinces
    begin
      uri = URI("#{Rails.application.secrets[:teryt_api_url]}/Province")
      # SSL 
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode

      response = Net::HTTP.get_response(uri)

      render json: response.body, status: response.code 
    rescue => e
      puts '========================== API ERROR "street_data" =========================='
      puts "#{e}"
      puts '============================================================================='
    end
  end

  def province_districts
    begin
      uri = URI("#{Rails.application.secrets[:teryt_api_url]}/Province/#{params[:province_id]}/Districts")
      # SSL 
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode

      response = Net::HTTP.get_response(uri)

      render json: response.body, status: response.code 
    rescue => e
      puts '========================== API ERROR "street_data" =========================='
      puts "#{e}"
      puts '============================================================================='
    end
  end

  def district_communes
    begin
      uri = URI("#{Rails.application.secrets[:teryt_api_url]}/District/#{params[:district_id]}/Communes")
      # SSL 
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode
      response = Net::HTTP.get_response(uri)

      render json: response.body, status: response.code 
    rescue => e
      puts '========================== API ERROR "street_data" =========================='
      puts "#{e}"
      puts '============================================================================='
    end
  end

  def street_search
    begin
      uri = URI("#{Rails.application.secrets[:teryt_api_url]}/Street/Filter")
      query_params = { "terytEntryFilterByQuery.page" => params[:page], "terytEntryFilterByQuery.query" => params[:q] }
      uri.query = URI.encode_www_form(query_params)
      # SSL 
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode

      response = Net::HTTP.get_response(uri)
      # puts response.body if response.is_a?(Net::HTTPSuccess)

      respond_to do |format|
        format.json { 
          render status: response.code, json: response.body 
          #render json: JSON.parse(response.body) 
        }
      end
    rescue => e
      puts '========================= API ERROR "street_search" ========================='
      puts "#{e}"
      puts '============================================================================='
    end
  end

  def street_data
    begin
      uri = URI("#{Rails.application.secrets[:teryt_api_url]}/Street/#{params[:id]}")
      #query_params = { :id => params[:id] }
      #uri.query = URI.encode_www_form(query_params)
      # SSL 
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode

      response = Net::HTTP.get_response(uri)
      # puts response.body if response.is_a?(Net::HTTPSuccess)

      respond_to do |format|
        format.json { 
          render status: response.code, json: response.body 
          #render json: JSON.parse(response.body) 
        }
      end
    rescue => e
      puts '========================== API ERROR "street_data" =========================='
      puts "#{e}"
      puts '============================================================================='
    end
  end


  def file_pdf
    @area = Area.find_by(teryt: params[:teryt])
    #redirect_to @area.file_pdf.service_url
    #redirect_to @area.file_pdf.rails_blob_url
    redirect_to url_for(@area.file_pdf)

    #render plain:  "area_commune_file_pdf for: #{@area.commune_name}"
  end

  def file_xlsx
    @area = Area.find_by(teryt: params[:teryt])
    #redirect_to @area.file_pdf.service_url
    #redirect_to @area.file_pdf.rails_blob_url
    redirect_to url_for(@area.file_xlsx)

    #render plain:  "area_commune_file_pdf for: #{@area.commune_name}"
  end

end
