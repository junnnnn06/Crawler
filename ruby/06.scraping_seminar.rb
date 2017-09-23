require 'open-uri'
require 'nokogiri'
require 'robotex'

robotex = Robotex.new
puts robotex.allowed?("https://www.goodfind.jp/2018/seminar/date/")

url = "https://www.goodfind.jp/2018/seminar/date/"
user_agent = "user-agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36"

open('output_seminar.txt', 'w') do |file|
  charset = nil
  html = open(url, "User-Agent" => user_agent) do |f|
    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)

  doc.css("#l-seminar-schedule_0 > div.l-seminar-schedule_list > div > div > div > a > div.media-content > h3").each do |title|
    puts title.text
    file.write "#{title.text}, \n"
  end
end

