class ApplicationController < ActionController::Base
  require 'open_weather'
  before_action :authenticate_user!
  before_action :set_weather

  def set_weather
    options = {APPID: '1794205c35eef477c61d11bf1479361a', units: 'imperial'}
    open_weather = OpenWeather::Current.geocode(25.920829, -80.408731, options)
    @temp = open_weather['main']['temp']
    @humidity = open_weather['main']['humidity']
  end
end
