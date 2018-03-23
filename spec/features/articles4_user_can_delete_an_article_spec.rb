# require 'rails_helper'

describe 'Article Delete Page' do
  describe 'the user links from the articles index' do
    it 'displays all the articles without the deleted one' do
      article1 = Article.create!(title: 'Billy Bob', body: 'BLAH BLAH BLAH')
      article2 = Article.create!(title: 'Kabachi', body: 'HOOAH')

      visit article_path(article1)
      click_link 'Delete'

      expect(current_path).to eq(articles_path)
      expect(page).to have_content("Article: '#{article1.title}' Deleted.")
      expect(page).to_not have_content(article1.body)
      expect(page).to_not have_content(article1.body)
      expect(page).to have_content(article2.title)
      expect(page).to have_content(article2.body)
    end
  end
end
