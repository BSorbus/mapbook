require 'net/http'

class PitTerytDistrictCommune
	include ActiveModel::Model

  attr_accessor :response, :q, :array_communes, :array_query_communes, :district_id

  def initialize(params = {})
    @district_id = params.fetch(:district_id, '0').to_i
    @q = params.fetch(:q, '')
  end

  def run_request
    begin
      uri = URI("#{Rails.application.secrets[:teryt_api_url]}/District/#{@district_id}/Communes")
      http = Net::HTTP.new(uri.host, uri.port)
      # SSL 
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode
      # /SSL 
      @response = Net::HTTP.get_response(uri)

      @array_communes = JSON.parse(@response.body)
      if @q.blank? #for index with query
        @array_query_communes = @array_communes
      else
        communes = @array_communes.select{ |row| row['name'].downcase.include?("#{@q.downcase}") }.map{ |row| row }
        @array_query_communes = communes
      end
      return @response
    rescue => e
      puts '================= API ERROR "/District/district_id/Communes" ================'
      puts "#{e}"
      puts '============================================================================='
    end
  end

end
