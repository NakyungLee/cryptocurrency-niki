require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_ranking_coins
    html = "https://coinmarketcap.com/"
    doc = Nokogiri::HTML(open(html))
    i = 0
    while i < 10 do
      coin_name = doc.css(".currency-name a")[i].text

      c_name_for_id = coin_name.gsub(" ","-").downcase
      coin = Coin.new(coin_name)
      coin.rank = i+1
      coin.marketcap = doc.css("#id-#{c_name_for_id} .market-cap").attr("data-usd").text.to_i
      coin.price = doc.css("#id-#{c_name_for_id} .price").attr("data-usd").text
      coin.volume = doc.css("#id-#{c_name_for_id} .volume").attr("data-usd").text.to_i
      coin.change = doc.css("#id-#{c_name_for_id} .percent-24h").attr("data-usd").text
      coin.url = html+"/currencies/#{c_name_for_id}/"
      i += 1
    end
  end

  def self.scrape_details(coin)
    doc = Nokogiri::HTML(open(coin.url))
    coin.iso_code = doc.css("small.bold").text
    coin.website = doc.css(".row .bottom-margin-2x a").attr("href").text
  end

end
