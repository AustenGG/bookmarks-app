require 'bookmark'

describe Bookmark do

  describe '.all' do
   it 'returns a list of bookmarks' do
     connection = PG.connect(dbname: 'bookmark_manager')

     # Add the test data
     bookmark = Bookmark.create(url: "http://www.askjeeves.com", title: "Ask jeeves")
     Bookmark.create(url: "http://www.twitter.com", title: "Twitter")
     Bookmark.create(url: "http://www.google.com", title: "Google")

     bookmarks = Bookmark.all

     expect(bookmarks.length).to eq 3
     expect(bookmarks.first).to be_a Bookmark
     expect(bookmarks.first.id).to eq bookmark.first['id']
     expect(bookmarks.first.title).to eq 'Ask jeeves'
     expect(bookmarks.first.url).to eq 'http://www.askjeeves.com'
    end
  end


describe '.create' do
  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark').first

    expect(bookmark['url']).to eq 'http://www.testbookmark.com'
    expect(bookmark['title']).to eq 'Test Bookmark'
  end
end
end
