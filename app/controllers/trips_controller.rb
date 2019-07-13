class TripsController < ApplicationController
  before_action :authenticate_user!

  def new
    @trip_form = TripForm.new
  end

  def index
    @trips = Trip.all
  end

  def create
    @trip_form = TripForm.new(trip_params)

    if @trip_form.save
      redirect_to root_path, notice: 'Trip successfully created'
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip_form).permit(:note, :city_name).merge(user_id: current_user.id)
  end
end
