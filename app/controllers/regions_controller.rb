class RegionsController < ApplicationController
  before_action :get_country
  before_action :set_region, only: %i[ show edit update destroy ]

  # GET /regions or /regions.json
  def index
    @regions = @country.regions
  end

  # GET /regions/1 or /regions/1.json
  def show
  end

  # GET /regions/new
  def new
    @region = @country.regions.build
  end

  # GET /regions/1/edit
  def edit
  end

  # POST /regions or /regions.json
  def create
    @region = @country.regions.build(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to country_regions_path(@country), notice: "Region was successfully created." }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1 or /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to country_regions_path(@country), notice: "Region was successfully updated." }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1 or /regions/1.json
  def destroy
    @region.destroy

    respond_to do |format|
      format.html { redirect_to country_regions_path(@country), notice: "Region was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def get_country

    @country = Country.find(params[:country_id])
    
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = @country.regions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def region_params
      params.require(:region).permit(:name, :country_id)
    end
end
