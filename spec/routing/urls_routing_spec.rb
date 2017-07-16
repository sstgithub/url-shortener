require 'rails_helper'

RSpec.describe UrlsController, type: :routing do
  describe 'routing' do

    it 'routes root path to #new' do
      expect(:get => '/').to route_to('urls#new')
    end

    it 'routes to #redirect_to_long_url' do
      expect(:get => '/abc123').to route_to('urls#redirect_to_long_url', :short_url => 'abc123')
    end

    it 'routes to #show' do
      expect(:get => '/urls/1').to route_to('urls#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/urls').to route_to('urls#create')
    end

  end
end
