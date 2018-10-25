feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end
require 'pg'

feature 'viewing bookmarks' do
  scenario 'bookmarks are visible' do
    Bookmark.create(url: 'http://www.askjeeves.com', title: 'Ask Jeeves')
    Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')

    visit '/bookmarks'

    expect(page).to have_link(' Ask Jeeves', href: 'http://www.askjeeves.com')
    expect(page).to have_link('Twitter',  href: 'http://www.twitter.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    end
  end
