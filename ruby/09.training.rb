require 'open-uri'
require 'nokogiri'
require 'csv'

urls = %w(https://qiita.com/search?q=ruby,
 https://qiita.com/search?utf8=%E2%9C%93&sort=&q=PHP,
 https://qiita.com/search?utf8=%E2%9C%93&sort=&q=PYTHON
 )

titles = []

user_agent = "User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36"
charset = nil
urls.each do |url|
  html = open(url, "User-Agent" => user_agent) do |f|
    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)
  doc.css("#main > div > div > div.searchResultContainer_main > div > div.searchResult_main > h1").each do |node|
    title = node.css('a').text
    titles.push(title)
  end
end

CSV.open('qiita.csv', 'w') do |csv|
  csv << titles
end
