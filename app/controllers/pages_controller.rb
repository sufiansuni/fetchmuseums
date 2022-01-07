# frozen_string_literal: true

# Page Controller
class PagesController < ApplicationController
  def home; end

  def search
    uri = URI("https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?types=poi&proximity=#{params[:longitude]},#{params[:latitude]}&access_token=#{ENV['MAPBOX_API_KEY']}")
    res = Net::HTTP.get_response(uri)
    res_hash = JSON.parse(res.body)
    if res.code == '200'
      new_hash = process_features(res_hash)
      render json: new_hash
    else
      render json: res_hash, status: res.code
      # redirect_to root_path
    end
  end

  private

  def process_features(res_hash)
    new_hash = {}
    res_hash['features'].each do |feature|
      postal_code = feature['context'][0]['text']
      new_hash[postal_code] = [] unless new_hash.keys.include?(postal_code)
      new_hash[postal_code] << feature['text']
    end
    new_hash
  end
end
