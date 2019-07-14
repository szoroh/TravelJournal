class TripsController < ApplicationController
  def new
    @trip_form = TripForm.new
  end

  def index
    @users_trips = current_user.trips.includes(:city, :weather)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update(edit_params)
      redirect_to trips_path, notice: 'Trip successfully updated'
    else
      render :new
    end
  end

  def create
    weather_object = WeatherObtainer.new(params[:trip_form][:city_name]).call
    @trip_form = TripForm.new(trip_params.merge(temperature: weather_object))

    if @trip_form.save
      redirect_to trips_path, notice: 'Trip successfully created'
    else
      render :new
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path, notice: 'Trip successfully destroyed'
  end

  private

  def trip_params
    params.require(:trip_form).permit(:note, :city_name).merge(user_id: current_user.id)
  end

  def edit_params
    params.require(:trip).permit(:note)
  end
end
