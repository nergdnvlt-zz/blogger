require 'rails_helper'

describe 'Article Index Page' do
  context 'a user visits /articles' do
    it 'and the page displays all the articles' do
      article1 = Article.create!(title: 'The Dead', body: 'They come back to life.')
      article2 = Article.create!(title: 'The Dead 2', body: 'They come back to life again.')

      visit '/articles'

      expect(page).to have_content(article1.title)
      expect(page).to have_content(article1.body)
      expect(page).to have_content(article2.title)
      expect(page).to have_content(article2.body)
    end
  end
end
