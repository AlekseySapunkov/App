class CampingsController < ApplicationController
  before_action :get_country
  before_action :get_city
  before_action :get_region
  before_action :set_camping, only: %i[ show edit update destroy ]

  # GET /campings or /campings.json
  def index
    @campings = @city.campings
  end

  # GET /campings/1 or /campings/1.json
  def show
  end

  # GET /campings/new
  def new
    @camping = @city.campings.build
  end

  # GET /campings/1/edit
  def edit
  end

  # POST /campings or /campings.json
  def create
    @camping = @city.campings.build(camping_params)

    respond_to do |format|
      if @camping.save
        format.html { redirect_to country_region_city_campings_path(@region), notice: "Camping was successfully created." }
        format.json { render :show, status: :created, location: @camping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @camping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campings/1 or /campings/1.json
  def update
    respond_to do |format|
      if @camping.update(camping_params)
        format.html { redirect_to country_region_city_campings_path(@region), notice: "Camping was successfully updated." }
        format.json { render :show, status: :ok, location: @camping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @camping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campings/1 or /campings/1.json
  def destroy
    @camping.destroy

    respond_to do |format|
      format.html { redirect_to country_region_city_campings_path(@region), notice: "Camping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_country
      @country = Country.find(params[:country_id])
    end
    def get_city
      @city = City.find(params[:city_id])
    end
    def get_region
      @region = Region.find(params[:region_id])
    end
    def set_camping
      @camping = @city.campings.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camping_params
      params.require(:camping).permit(:name, :body, :country_id, :city_id, :region_id)
    end
end
