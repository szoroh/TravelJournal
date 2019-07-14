class TripsController < ApplicationController
  def new
    # index view is separate with new - in order to avoid using ajax

    @trip_form = TripForm.new
  end

  def index
    # includes method allows for performance improvement during reder of index view

    @users_trips = current_user.trips.includes(:city, :weather)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    # update methods handles single attribute :note of a Trip record. It is limited due to
    # problem with obtaining past weather data from Open Weather Map as it remitted.
    # Though in case of eventual improvement of the app it is possible to update more
    # arguments - such as temperature or city.

    @trip = Trip.find(params[:id])

    if @trip.update(edit_params)
      redirect_to trips_path, notice: 'Trip successfully updated'
    else
      render :new
    end
  end

  def create
    # one can assign city name param from :trip_form key hash and pass it to WetherObtainer
    # service object and use call on it to obtain temperature for a given city and merge it
    # to trip params so it can be passed to Form Object which will thus create 3 separate records.

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
    # parameters required to pass to Trip Form in order to properly create 3 separate records -
    # Trip, City and Weather.
    params.require(:trip_form).permit(:note, :city_name).merge(user_id: current_user.id)
  end

  def edit_params
    # parameters required to update single attribute - :note of Trip record.
    params.require(:trip).permit(:note)
  end
end
