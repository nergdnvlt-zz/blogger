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

    describe 'they link from the article index' do
      it 'displays information for one article' do
        article = Article.create!(title: 'New Title', body: 'New Body')
        comment_1 = article.comments.create(author_name: 'Me', body: 'Commenty comments')
        comment_2 = article.comments.create(author_name: 'You', body: 'So much to say')

        visit articles_path

        click_link article.title

        expect(page).to have_content(article.title)
        expect(page).to have_content(article.body)
        expect(page).to have_content(comment_1.author_name)
        expect(page).to have_content(comment_1.body)
        expect(page).to have_content(comment_2.author_name)
        expect(page).to have_content(comment_2.body)
      end
    end
  end
end
