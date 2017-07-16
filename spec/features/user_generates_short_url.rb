require 'rails_helper'

feature 'User inputs long url on root page and gets a short url or validation error' do
  scenario 'valid url' do
    visit root_path

    #enter long url: https://github.com/cassandra-migrations.........
    expect(page).to have_content 'Short url: '
  end

  scenario 'invalid url' do
    visit root_path

    #enter long url: https://asdoifjaoisjgdoiasdjfiasjdf/soidfjodsijfg
    expect(page).to have_content 'Invalid url! Please try again.'
  end
end
