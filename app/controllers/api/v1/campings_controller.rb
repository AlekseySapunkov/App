class Api::V1::CampingsController < ApplicationController
    class Api::V1::BeersController < ApplicationController
        before_action :set_camping, only: [:show, :edit, :update, :destroy]
      
        # GET /campings
        # GET /campings.json
        def index
          @campings = Camping.all.order(name: :asc)
          render json: @campings
        end
      
        # GET /campings/1
        # GET /campings/1.json
        def show
          if @camping
            render json: @camping
          else
            render json: @camping.errors
          end
        end
      
        # GET /campings/new
        def new
          @camping = Camping.new
        end
      
        # GET /campings/1/edit
        def edit
        end
      
        # POST /beers
        # POST /beers.json
        def create
          @camping = Camping.new(camping_params)
      
      
          if @camping.save
            render json: @camping
          else
            render json: @camping.errors
          end
        end
      
        # PATCH/PUT /campings/1
        # PATCH/PUT /campings/1.json
        def update
        end
      
        # DELETE /campings/1
        # DELETE /campings/1.json
        def destroy
          @camping.destroy
      
          render json: { notice: 'Camping was successfully removed.' }
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_beer
            @camping = Camping.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def camping_params
            params.permit(:name, :name, :region, :country, :city)
          end
      end
end
