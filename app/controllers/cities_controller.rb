class CitiesController < ApplicationController
  before_action :get_region
  before_action :get_country
  before_action :set_city, only: %i[ show edit update destroy ]

  # GET /cities or /cities.json
  def index
    @cities = @region.cities
  end

  # GET /cities/1 or /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = @region.cities.build
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities or /cities.json
  def create
    @city = @region.cities.build(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to country_region_cities_path(@region), notice: "City was successfully created." }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to country_region_cities_path(@region), notice: "City was successfully updated." }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city.destroy

    respond_to do |format|
      format.html { redirect_to country_region_cities_path(@region), notice: "City was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def get_region

    @region = Region.find(params[:region_id])
    
    end
    def get_country

      @country = Country.find(params[:country_id])
      
      end
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = @region.cities.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:name, :region.name, :country_id)
    end
end
