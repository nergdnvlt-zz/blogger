require 'rails_helper'

describe 'Article Edit Page' do
  describe 'the user edits from the articles show page' do
    it 'edits the article and shows it after' do
      article1 = Article.create!(title: 'Billy Bob', body: 'BLAH BLAH BLAH')

      visit article_path(article1)
      click_link 'Edit'

      fill_in 'article[title]', with: 'Edited Title!'
      fill_in 'article[body]',  with: 'Edited Body!'

      click_on 'Update Article'

      expect(current_path).to eq(article_path(article1))
      article1 = Article.find(article1.id)

      expect(page).to have_content("Article: '#{article1.title}' Updated.")
      expect(page).to_not have_content('Billy Bob')
      expect(page).to_not have_content('BLAH BLAH BLAH')
      expect(page).to have_content(article1.title)
      expect(page).to have_content(article1.body)
    end
  end
end
