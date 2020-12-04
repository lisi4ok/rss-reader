require 'rails_helper'

RSpec.feature "Feeds", type: :feature do

  context "create new feed" do
    scenario 'should be successfull' do
      visit new_feed_path
      within('form') do
        fill_in 'Title', with: 'Test Title'
        fill_in 'Link', with: 'Test Link'
        fill_in 'Description', with: 'Test Description'
      end
      click_button 'Create Feed'
      expect(page).to have_content('Feed was successfully created.')
    end

    scenario 'should fail' do
      visit new_feed_path
      within('form') do
        fill_in 'Link', with: 'Test Link'
        fill_in 'Description', with: 'Test Description'
      end
      click_button 'Create Feed'
      expect(page).to have_content('Title can\'t be blank')
    end
  end


  context "update feed" do
    let!(:feed) { Feed.create(link: 'Test Link', title: 'Test Title', description: 'Test Description') }
    scenario 'should be successfull' do
      visit edit_feed_path(feed)
      within('form') do
        fill_in 'Title', with: 'Test Title 2'
        fill_in 'Link', with: 'Test Link'
        fill_in 'Description', with: 'Test Description'
      end
      click_button 'Update Feed'
      expect(page).to have_content('Feed was successfully updated.')
      expect(page).to have_content('Test Title 2')
    end

    scenario 'should fail' do
      visit edit_feed_path(feed)
      within('form') do
        fill_in 'Title', with: ''
        fill_in 'Link', with: 'Test Link'
        fill_in 'Description', with: 'Test Description'
      end
      click_button 'Update Feed'
      expect(page).to have_content('Title can\'t be blank')
    end
  end


  context "delete feed" do
    scenario 'should be successfull' do
      feed = Feed.create(link: 'Test Link', title: 'Test Title', description: 'Test Description')
      visit feeds_path
      # Chrome driver
      # 
      # accept_confirm do
      #   expect { click_link 'Destroy' }.to change(Feed, :count).by(-1)
      # end
      # 
      expect { click_link 'Destroy' }.to change(Feed, :count).by(-1)
      expect(page).to have_content('Feed was successfully destroyed.')
    end
  end

end
