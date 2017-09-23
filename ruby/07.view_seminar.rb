require 'sinatra'
require 'sinatra/reloader'

get '/view_seminar' do
  html = '<h1>foodfindセミナー一覧</h1>'
  html << "<ul>"
  open('output_seminar.txt', 'r') do |file|
    file.each do |line|
      html << "<li>#{line}<br></li>"
    end
  end

  html << "</ul>"

  return html
end
