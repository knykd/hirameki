# URLにアクセス用
require 'open-uri'
require 'natto'
require 'nokogiri'
require 'sanitize'

namespace :scrape do
  desc 'NaverまとめのTechページからタイトルを取得'
  task :naver_title => :environment do
    texts = []
    # スクレイピングURL
    urls = ['http://matome.naver.jp/tech', 'https://news.yahoo.co.jp/']

    urls.each do |url|
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      # htmlを解析後オブジェクト作成
      doc = Nokogiri::HTML.parse(html, nil, charset)

      doc1 = Sanitize.clean(doc)
      texts << doc1.delete("\n").delete(" ")
    end

    text = texts.join(", ")

    natto = Natto::MeCab.new
    natto.parse(text) do |n|
      puts "#{n.surface}: #{n.feature}"
    end
  end
end
