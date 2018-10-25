require 'bookmark'

describe Bookmark do

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES (1,'http://www.askjeeves.com');")
    connection.exec("INSERT INTO bookmarks VALUES (2,'http://www.twitter.com');")
    connection.exec("INSERT INTO bookmarks VALUES (3,'http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.askjeeves.com')
    expect(bookmarks).to include('http://www.twitter.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end
end
