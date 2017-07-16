require 'rails_helper'

feature 'User inputs long url on root page and gets a short url or validation error' do
  scenario 'valid url' do
    visit root_path

    fill_in 'Long url', with: 'https://gist.github.com/sstgithub/331d74b81493570001a3a849511a2b97'
    click_button 'Create Url'

    expect(page).to have_text 'Url was successfully created'
    expect(page).to have_text 'Short url: '
    expect(page).not_to have_text 'Long url has to be a valid url'
  end

  scenario 'invalid url' do
    visit root_path

    fill_in 'Long url', with: 'randomstring'
    click_button 'Create Url'

    expect(page).not_to have_text 'Url was successfully created'
    expect(page).not_to have_text 'Short url: '
    expect(page).to have_text 'Long url has to be a valid url'
  end
end
