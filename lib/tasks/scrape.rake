# URLにアクセス用
require 'open-uri'

namespace :scrape do
    desc 'NaverまとめのTechページからタイトルを取得'
  task :naver_title => :environment do
    # スクレイピングURL
    url = 'http://matome.naver.jp/tech'

    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別取得
      f.read # htmlを読み変数htmlへ
    end

    # htmlを解析後オブジェクト作成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
      # タイトル取得
      puts node.css('h3').inner_text
    end
  end
end
