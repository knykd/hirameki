 URLにアクセス用
 require 'open-uri'
 require 'natto'
 require 'nokogiri'
 require 'sanitize'

namespace :scrape do
  desc 'webページから単語取得'
  task get_words: :environment do
    texts = []
    # スクレイピングURL
    urls = ['http://matome.naver.jp/tech', 'https://news.yahoo.co.jp/']

    urls.each do |url|
      charset = nil
      html = URI.parse(url).open do |f|
        charset = f.charset
        f.read
      end

      # html解析後オブジェクト作成
      doc = Nokogiri::HTML.parse(html, nil, charset)

      doc1 = Sanitize.clean(doc)
      texts << doc1.delete('\n').delete(' ')
    end

    text = texts.join(', ')

    natto = Natto::MeCab.new
    natto.parse(text) do |n|
      part_of_speech_first = n.feature.split(',').first
      part_of_speech_second = n.feature.split(',').second
      if part_of_speech_first == '名詞' && part_of_speech_second == '一般'
        Word.find_or_create_by(name: n.surface)
      end
    end
  end
end
