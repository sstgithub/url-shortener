class UrlsController < ApplicationController
  def new
    @url = Url.new

    respond_to do |format|
      
    end
  end

  def show

  end

  def create
    @url = Url.new(params[:url])

    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: 'Url was successfully created.' }
        format.json { render json: @url, status: :created, location: @url }
      else
        format.html { render action: "new" }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def redirect_to_long_url
  end
end
