class CarparksController < ApplicationController
  def index
    if params[:location]
      @carparks = Carpark.joins(:carpark_lot).location(params[:location].upcase)
        .limit(5)
      render json: @carparks, each_serializer: CarparkSerializer
    else
      render json: {
               error: "Bad Request",
               status: 400,
             }, status: :bad_request
    end
  end
end
