require_relative "element"
require_relative "history"
require 'pp'

class Player
  attr_reader :name, :history

  def initialize(name, history)
    @name = name
    @history = history
  end

  def play
    fail "This method should be overridden"
  end
end

class StupidBot < Player

  def play
    @history.log_play("Rock")
    return Rock.new("Rock")
  end
end

class RandomBot < Player

  def play
    move = $moves.sample
    # pp @move
    @history.log_play(move)
    return move
    # if move == "Rock"
    #   return Rock.new("Rock")
    # elsif move == "Paper"
    #   return Paper.new("Paper")      
    # elsif move == "Scissors"
    #   return Scissors.new("Scissors")
    # elsif move == "Lizard"
    #   return Lizard.new("Lizard")   
    # elsif move == "Spock"
    #   return Spock.new("Spock")  
    # end
  end
end

class IterativeBot

  @counter = 0
  end

  def play
    @counter = @counter + 1
    $moves.each do |i|
      puts i
      @history.log_play(i)
    end
    play until @counter == 5 #Just so it stops with out stack issue
  end
end

class LastBot
  def initialize(name, history)
    @name = name
    @history = history
  end

  def play
    opp_plays = @history.opponent_plays
    if opp_plays.size == 0 #First play always rock
      @history.log_play("Rock")
      return Rock.new("Rock")
    end
    element = opp_plays #get the last play
    @history.log_play(element)
    if element == "Rock"
      return Rock.new("Rock")
    elsif element == "Paper"
      return Paper.new("Paper")
    elsif element == "Scissors"
      return Scissors.new("Scissors")
    elsif element == "Lizard"
      return Lizard.new("Lizard")
    elsif element == "Spock"
      return Spock.new("Spock")
    end
  end
end

class Human
  def initialize(name, history)
    @name = name
    @history = history
  end

  def play
    puts "(1) Rock\n(2) Paper\n(3) Scissors\n(4) Lizard\n(5) Spock\n"
    puts "Enter your move: "
    user_move = gets.to_i
    #(1..5).member?(user_move)
    # if user_move != 1..5
    #   puts user_move
    #   fail "Invalide move - try again"
    #   puts user_move
    # end
    if (0..6).member?(user_move) == false
      puts "Invalide move - try again"
      play
    elsif user_move == 1
      return Rock.new("Rock")
      @history.log_play("Rock")
    elsif user_move == 2
      return Paper.new("Paper")
      @history.log_play("Paper")
    elsif user_move == 3
      return Scissors.new("Scissors")
      @history.log_play("Scissors")
    elsif user_move == 4
      return Lizard.new("Lizard")
      @history.log_play("Lizard")
    elsif user_move == 5
      return Spock.new("Spock")
      @history.log_play("Spock")
    end
  end
end


# p1 = StupidBot.new('StupidBot', History.new)
# p2 = RandomBot.new('RandomBot', History.new)
# p3 = IterativeBot.new('IterativeBot', History.new)
# p4 = LastBot.new('LastBot', History.new)
# p5 = Human.new('Human', History.new)

# p1move = p1.play()
# p2move = p2.play()
# p3move = p3.play()
# p4move = p4.play()
# p5move = p5.play()

# puts p1move
# puts p2move
# puts p3move
# puts p4move
# puts p5move
# puts p1move.compare_to(p2move) #test compare of first two
# puts p2move.compare_to(p4move) #test to make sure LastBot copies opponents plays