class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def show
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url, notice: 'Url was successfully created.'
    else
      render action: 'new'
    end
  end

  def redirect_to_long_url
    @url = Url.find_by_short_url(params[:short_url])
    if @url
      redirect_to @url.long_url
    else
      redirect_to root_path, alert: 'Invalid short url!'
    end
  end

  private
    def url_params
      params.require(:url).permit(:short_url, :long_url)
    end
end
