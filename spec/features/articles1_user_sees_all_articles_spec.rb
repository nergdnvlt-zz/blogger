require 'rails_helper'

describe 'Article Index Page' do
  context 'a user visits /articles' do
    before(:each) do
      @article1 = Article.create!(title: 'The Dead',
                                  body: 'They come back to life.')
      @article2 = Article.create!(title: 'The Dead 2',
                                  body: 'They come back to life again.')
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    it 'and the page displays all the articles' do
      visit '/articles'

      expect(page).to have_content(@article1.title)
      expect(page).to have_content(@article1.body)
      expect(page).to have_content(@article2.title)
      expect(page).to have_content(@article2.body)
    end

    it 'and the page displays article titles as links' do
      visit '/articles'

      expect(page).to have_link(@article1.title)
      expect(page).to have_link(@article2.title)
    end

    it 'and the page has a new article link' do
      visit '/articles'

      expect(page).to have_link('Create a New Article')
      expect(page).to have_link(@article2.title)
    end
  end
end
