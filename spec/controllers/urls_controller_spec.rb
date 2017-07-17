require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe 'redirect_to_long_url' do
    it 'can redirect to long url if one exists for short url entered' do
      Url.create!(long_url: 'https://gist.github.com/sstgithub/331d74b81493570001a3a849511a2b97', short_url: 'abc123')
      get :redirect_to_long_url, params: {short_url: 'abc123'}
      expect(response).to redirect_to('https://gist.github.com/sstgithub/331d74b81493570001a3a849511a2b97')
    end

    it 'will return standard error page if no long url exists for short url entered' do
      get :redirect_to_long_url, params: {short_url: 'abc123'}
      expect(response).to redirect_to root_path
    end
  end

  #NOTE: covered by feature test
  # describe 'create' do
  #   it 'will return validation error if invalid url' do
  #
  #   end
  #
  #   it 'will return short url if valid url' do
  #
  #   end
  # end
end
