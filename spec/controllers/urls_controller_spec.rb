require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  #NOTE: basics covered by integration. test here that correct short url is returned
  describe 'create' do
    it 'will return validation error if invalid url' do

    end

    it 'will return short url if valid url' do

    end
  end

  describe 'redirect_to_long_url' do
    it 'can redirect to long url if one exists for short url entered' do

    end

    it 'will return standard error page if no long url exists for short url entered' do

    end
  end
end
