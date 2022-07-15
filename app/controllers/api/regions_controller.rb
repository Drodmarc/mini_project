class Api::RegionsController < ApplicationController
  def index
    @regions = Region.all
    respond_to do |format|
      format.html
      format.json { render json: @regions.to_json(except: [:id])}
    end
  end
end
