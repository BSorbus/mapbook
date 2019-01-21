class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  #caches_page :info, :gzip => true
  caches_page :info, :index, :gzip => :best_speed

  def info
  end

  # GET /areas
  # GET /areas.json
  def index
    @area ||= Area.new
  end

  def find_or_create
    @area = Area.find_or_create_by!(area_params)
    # authorize @comment, :create?
    respond_to do |format|
      format.js { render 'areas/find_or_create.js.erb', locals: {area: @area} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:teryt, :file_pdf, :file_xlsx)
    end
end
