#cli controller : business logic
class CLI

  def call
    list_top10
    select_coin
  end

  def list_top10
    puts "\nToday's Top 10 coins:"
    puts "(The values change instantly.)"
    puts "rank - name - price - volume - change"
    Coin.print_top10
  end

  def select_coin
    input = nil
    while input != "exit"
      print "\nEnter the number of coin you'd like more info or type list to see the coins again or type exit: "
      input = gets.chomp
      if input.to_i > 0 && input.to_i < 11
        the_coin = Coin.all.detect {|coin| coin.rank == input.to_i}
        the_coin.print_details
      elsif input == "list"
        self.list_top10
        sleep 0.5
        select_coin
      elsif input == "exit"
        goodbye
      else
        puts "Please enter right input."
        select_coin
      end
    end
  end

  def goodbye
    puts "See you soon."
    exit
  end

end
