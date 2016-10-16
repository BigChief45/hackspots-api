module Api::V1
  class SpeedTestsController < ApiController
    
    before_action :set_spot
    before_action :set_speed_test, only: [:show, :update, :destroy]
    
    # GET /v1/spots/1/speed_tests
    def index
      @speed_tests = @spot.speed_tests
      render json: @speed_tests
    end
    
    # GET /v1/spots/1/speed_tests/1
    def show
      render json: @speed_test
    end
    
    # POST /v1/spots/1/speed_tests
    def create
      @speed_test = SpeedTest.new(speed_test_params)
      
      if @speed_test.save
        render json: @speed_test, status: :created
      else
        render json: @speed_test.errors, status: :unprocessable_entity
      end
    end
    
    # PUT/PATCH /v1/spots/1/speed_tests/1
    def update
      if @speed_test.update(speed_test_params)
        render json: @speed_test
      else
        render json: @speed_test.errors, status: :unprocessable_entity
      end
    end
    
    # DELETE /v1/spots/1/speed_tests/1
    def destroy
      @speed_test.destroy
    end
    
    private
    
    def set_spot
      @spot = Spot.find(params[:spot_id])
    end
    
    def set_speed_test
      @speed_test = SpeedTest.find(params[:id])
    end
    
    def speed_test_params
      params.require(:data).require(:attributes).permit(:download_speed, :upload_speed, :ping, :grade, :isp, :spot_id)
    end
  end
end
