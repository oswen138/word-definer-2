require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    save_and_open_page
    click_on('Add a new word')
    fill_in('word_name', :with => 'Button')
    click_on('Go!')
    expect(page).to have_content('Button')
  end
end

#a user can add a definition

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the word page') do
    word = Word.new("Button", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'A round thing')
    click_on('Add a definition')
    expect(page).to have_content('A round thing')
  end
end

