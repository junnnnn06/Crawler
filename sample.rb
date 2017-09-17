require 'nokogiri'
require 'open-uri'
require 'robotex'

robotex = Robotex.new
puts robotex.allowed?('http://honz.jp/')

url = 'http://honz.jp/'
user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36'
charset = nil
html = open(url, 'User-Agent' => user_agent) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML(open('http://honz.jp/'))
puts doc.css('a').text
