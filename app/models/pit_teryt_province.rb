# frozen_string_literal: true

require 'net/http'

class PitTerytProvince
  include ActiveModel::Model

  attr_accessor :response, :q, :array_provinces, :array_query_provinces

  def initialize(params = {})
    @q = params.fetch(:q, '')
  end

  def run_request
    uri = URI("#{Rails.application.secrets[:teryt_api_url]}/Province")
    http = Net::HTTP.new(uri.host, uri.port)
    # SSL
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode
    # /SSL
    @response = Net::HTTP.get_response(uri)

    @array_provinces = JSON.parse(@response.body)
    if @q.blank? # for index with query
      @array_query_provinces = @array_provinces
    else
      provinces = @array_provinces.select { |row| row['name'].downcase.include?(@q.downcase.to_s) }.map { |row| row }
      @array_query_provinces = provinces
    end
    @response
  rescue StandardError => e
    puts '=========================== API ERROR "/Province" ==========================='
    puts e.to_s
    puts '============================================================================='
  end
end