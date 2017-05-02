#cli controller : business logic
class CLI

  def call
    list_top10
    sleep 0.5
    select_coin
  end

  def list_top10
    puts "\nToday's Top 10 coins:"
    puts "(The values change instantly.)"
    puts "rank - name - price - volume - change"
    Coin.reset
    Scraper.scrape_ranking_coins
    Coin.all.each.with_index(1) do |coin,index|
      puts "#{index} -  #{coin.name} - $#{coin.price} - $#{coin.volume} -  #{coin.change}%"
    end
  end

  def select_coin
    input = nil
    while input != "exit"
      print "\nEnter the number of coin you'd like more info or type list to see the coins again or type exit: "
      input = gets.chomp
      if input.to_i.between?(1, Coin.all.size)
        the_coin = Coin.find_by_index(input.to_i - 1)
        print_details(the_coin)
      elsif input == "list"
        self.call
      elsif input == "exit"
        goodbye
      else
        puts "Please enter right input."
        select_coin
      end
    end
  end

  def print_details(coin)
    Scraper.scrape_details(coin)
    puts <<~HEREDOC
    \n
    ==============================
    Name       : #{coin.name}
    Rank       : #{coin.rank}
    ISO        : #{coin.iso_code}
    Market Cap : $#{coin.marketcap}
    Price      : $#{coin.price}
    Volume     : $#{coin.volume}
    Change     : #{coin.change}%
    Website    : #{coin.website}
    ==============================
    HEREDOC
  end

  def goodbye
    puts "See you soon."
    exit
  end

end
