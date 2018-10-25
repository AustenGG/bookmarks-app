require 'pg'
class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url

  result = connection.exec("SELECT * FROM bookmarks")
  result.map do |bookmark|
   Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
end

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
       bookmarks = connection.exec('SELECT * FROM bookmarks;')
       bookmarks.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:, title:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'bookmark_manager')
  end

  connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
end
end
end
