require 'rails_helper'

describe 'Article Show Page' do
  describe 'the user links from the articles index' do
    it 'displays the info for one article' do
      article1 = Article.create!(title: 'The Dead',
                                  body: 'They come back to life.')
      visit articles_path

      click_link article1.title

      expect(page).to have_content(article1.title)
      expect(page).to have_content(article1.body)
    end
  end
end
