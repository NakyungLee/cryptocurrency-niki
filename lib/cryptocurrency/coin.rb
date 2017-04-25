class Coin
  attr_accessor :name, :rank, :marketcap, :price, :volume, :change, :all, :url, :website, :iso_code
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.print_top10
    self.reset
    Scraper.scrape_ranking_coins
    all.each.with_index(1) do |coin,index|
      puts "#{index} -  #{coin.name} - $#{coin.price} - $#{coin.volume} -  #{coin.change}%"
    end
  end

  def print_details
    Scraper.scrape_details(self)
    puts <<~HEREDOC
    \n
    ==============================
    Name       : #{self.name}
    Rank       : #{self.rank}
    ISO        : #{self.iso_code}
    Market Cap : $#{self.marketcap}
    Price      : $#{self.price}
    Volume     : $#{self.volume}
    Change     : #{self.change}%
    Website    : #{self.website}
    ==============================
    HEREDOC
  end

  def self.all
    @@all
  end

  def self.reset
    @@all.clear
  end
end
