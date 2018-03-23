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

    describe 'in order to add a comment' do
      it 'displays article and comments for an article.' do
        article = Article.create!(title: 'New Title', body: 'New Body')
        comment1 = article.comments.create(author_name: 'Me', body: 'Blah blah blah')
        comment2 = article.comments.create(author_name: 'You', body: 'Rah rah rah')

        visit articles_path

        click_link article.title

        expect(page).to have_content(article.title)
        expect(page).to have_content(article.body)
        expect(page).to have_content(comment1.author_name)
        expect(page).to have_content(comment1.body)
        expect(page).to have_content(comment2.author_name)
        expect(page).to have_content(comment2.body)
      end
    end
  end
end
