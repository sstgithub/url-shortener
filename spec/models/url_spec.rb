require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'url is correctly formatted' do
    it 'adds an error if url is not valid' do
      url = Url.new(long_url: 'randomstring')
      url.url_is_correctly_formatted

      expect(url.errors.count).to eq(1)
    end

    it 'does not add an error if url is valid' do
      url = Url.new(long_url: 'https://gist.github.com/sstgithub/331d74b81493570001a3a849511a2b97')
      url.url_is_correctly_formatted

      expect(url.errors.count).to eq(0)
    end
  end

  describe 'generate short url' do
    it 'generates short url and adds to self' do
      url = Url.new(long_url: 'https://gist.github.com/sstgithub/331d74b81493570001a3a849511a2b97')
      url.generate_short_url

      expect(url.short_url).not_to be_nil
    end

    it 'generates another short url if generated short url already exists in db' do
      url_double = double('url')
      expect(SecureRandom).to receive(:hex).and_return('abc123')
      expect(Url).to receive(:find_by_short_url).with('abc123').and_return(url_double)
      expect(SecureRandom).to receive(:hex).and_return('321cba')
      expect(Url).to receive(:find_by_short_url).with('321cba').and_return(nil)

      url = Url.new(long_url: 'https://gist.github.com/sstgithub/331d74b81493570001a3a849511a2b97')
      url.generate_short_url
    end
  end
end
