require 'rails_helper'

describe 'Article New Form Page' do
  describe 'the user links from the articles index' do
    it 'displays forms for a create new article' do
      visit articles_path
      click_link 'Create a New Article'

      expect(current_path).to eq(new_article_path)

      fill_in 'article[title]', with: 'New Title!'
      fill_in 'article[body]',  with: 'New Body!'
      click_on 'Create Article'
      expect(page).to have_content("Article: 'New Title!' Created.")

      expect(page).to have_content('New Title!')
      expect(page).to have_content('New Body!')
    end
  end
end
