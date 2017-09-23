require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'robotex'

get '/scraping_news' do
  robotex = Robotex.new
  puts robotex.allowed?("https://www.yahoo.co.jp/")

  url = 'https://www.yahoo.co.jp/'
  user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
  charset = nil
  html = open(url, "User-Agent" => user_agent) do |f|
    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)

  html = "<h1>ヤフーニュース一覧</h1>"

  doc.css('#topicsfb > div.topicsindex > ul.emphasis > li > a').each do |node|
    html << "<p><a href = #{node.attr('href')}>#{node.text}</a></p>"
  end

  return html

end
