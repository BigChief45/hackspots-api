module Api::V1
  class SpotsController < ApiController
    
    #before_action :authenticate_request!, only: [:create, :update, :destroy]
    before_action :set_spot, only: [:show, :update, :destroy]
  
    # GET /spots
    def index
      @spots = Spot.all
      render json: @spots
    end
  
    # GET /spots/1
    def show
      render json: @spot
    end
  
    # POST /spots
    def create
      @spot = Spot.new(spot_params)
  
      if @spot.save
        render json: @spot, status: :created
      else
        render json: @spot.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /spots/1
    def update
      if @spot.update(spot_params)
        render json: @spot
      else
        render json: @spot.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /spots/1
    def destroy
      @spot.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_spot
        @spot = Spot.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def spot_params
        # JSON API Specification format for Strong Parameters
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        #params.require(:data).require(:attributes).permit(:type, :name, :description, :country, :city, :address, :latitude, :longitude, :open_hours, :wifi, :power)
      end
      
  end
end