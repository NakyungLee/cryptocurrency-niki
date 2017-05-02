class Coin
  attr_accessor :name, :rank, :marketcap, :price, :volume, :change, :all, :url, :website, :iso_code
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.reset
    @@all.clear
  end

  def self.find_by_index(index)
    self.all[index]
  end
end
