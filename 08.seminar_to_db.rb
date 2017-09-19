require 'open-uri'
require 'nokogiri'
require 'robotex'
require 'sqlite3'

robotex = Robotex.new
puts robotex.allowed?("https://www.goodfind.jp/2018/seminar/date/")

db = SQLite3::Database.new('scraping.db')
#varchar(n)・・・・nはマルチバイトに対応した文字数
db.execute('CREATE TABLE IF NOT EXISTS seminars (title varchar(100), sub_title varchar(200));')

url = "https://www.goodfind.jp/2018/seminar/date/"
user_agent = "ser-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36"
charset = nil
html = open(url, "User-Agent" => user_agent) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.css("#l-seminar-schedule_3 > div.l-seminar-schedule_list > div > div > div > a > div.media-content").each do |title|
  puts title.css('h3').text
  puts title.css('div.media-catch').text
  db.execute 'INSERT INTO seminars values (?, ?);',["#{title.css("h3").text}", "#{title.css('div.media-catch').text}"]
end
