require 'open-uri'

#スクレイピング先のURL
url = 'https://www.yahoo.co.jp/'
#user_agentの偽装
user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36'
charset = nil
html = open(url, "User-Agent" => user_agent) do |f|
  charset = f.charset #文字種別を取得
  f.read
end

puts html
