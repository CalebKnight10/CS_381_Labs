require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										                #
#  < Caleb Knight >					 	      #
#  < knightca@oregonstate.edu >	    #
#																		#
#########################################

<<-Doc
This is a simple program to enhance Rock Paper Scissors and add a Lizard and Spock.
This program is to demonstrate my understanding of ruby, as well as OOP.
As is, the program currently runs and passes all tests, but I am attempting to refactor to clean it up.
I don't want to have global variables everywhere but the functions I have set up are the design I imagine.
This refactoring may be done upon final submission but it may be left as is and finished at a later date.
Doc

class Game

# 	def initialize
# 		@@player_1 = 0
# 		@@player_2 = 0
# 		@@player1obj = 0
# 		@@player2obj = 0
# 	end

# # your code here

# def intro
# 	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
# 	puts "Please choose two players:"
# 	puts "(1) StupidBot\n(2) RandomBot\n(3) IterativeBot\n(4) LastPlayBot\n(5) Human\n"	
# end

# def choosePlayers
# 	@@player_1 = 0
# 	@@player_2 = 0
# 	players = ["StupidBot", "RandomBot", "IterativeBot", "LastPlayBot", "Human"]
# 	while true
# 		print "Select player 1:"
# 		@@player_1 = gets.to_i
# 		print "Select player 2:"
# 		@@player_2 = gets.to_i
# 		if (1..5).member?(@@player_1)
# 			if (1..5).member?(@@player_2)
# 				break
# 			else
# 				puts "Invalid choice(s) - start over "
# 			end
# 		else
# 			puts "Invalid choice(s) - start over "
# 		end
# 	end
# 	puts "%s vs. %s" % [players[@@player_1 - 1], players[@@player_2 - 1]]
# 	print "\n"
# end

# def decidePlayerObject(player_1, player_2)

# 	def initialize(player_1, player_2)
# 		@@player_1 = @@player_1
# 		@@player_2 = @@player_2
# 	end

# 	if player_1 == 1
# 		$player1obj = StupidBot.new("StupidBot", History.new)
# 	elsif player_1 == 2
# 		$player1obj = RandomBot.new("RandomBot", History.new)
# 	elsif player_1 == 3
# 		$player1obj = IterativeBot.new("IterativeBot", History.new)
# 	elsif player_1 == 4
# 		$player1obj = LastPlayBot.new("LastPlayBot", History.new)
# 	elsif player_1 == 5
# 		$player1obj = Human.new("Human", History.new)
# 	end
# 	if player_2 == 1
# 		$player2obj = StupidBot.new("StupidBot", History.new)
# 	elsif player_2 == 2
# 		$player2obj = RandomBot.new("RandomBot", History.new)
# 	elsif player_2 == 3
# 		$player2obj = IterativeBot.new("IterativeBot", History.new)
# 	elsif player_2 == 4
# 		$player2obj = LastPlayBot.new("LastPlayBot", History.new)
# 	elsif player_2 == 5
# 		$player2obj = Human.new("Human", History.new)
# 	end
# end

# def rounds(player_1, player_2)

# 	def initialize(player_1, player_2)
# 		@player1obj = player_1
# 		@player2obj = player_2
# 	end

# 	rounds.times do |i|
# 		move1 = 0
# 		move2 = 0
# 		round_number = i + 1
# 		puts "Round %d:" % round_number

# 		player1_move = player1obj.play()
# 		player2_move = player2obj.play()

# 		player1obj.instance_variable_get(:@history).log_opponent_play(player2_move.getName)
# 		player2obj.instance_variable_get(:@history).log_opponent_play(player1_move.getName)

# 		puts "Player 1 chose %s" % player1_move.getName
# 		puts "Player 2 chose %s" % player2_move.getName
# 		line, result = player1_move.compare_to(player2_move)
# 		puts line
# 		if result == "Win"
# 			puts "Player 1 won the round "
# 			player1obj.instance_variable_get(:@history).add_score
# 		elsif result == "Tie"
# 			puts "Round was a tie "
# 		elsif result == "Lose"
# 			puts "Player 2 won the round "
# 			player2obj.instance_variable_get(:@history).add_score
# 		end
# 		puts "\n"
# 	end
# end

# def scoreHandling(player1obj, player2obj)
# 	def initialize(player_1, player_2)
# 		@player1obj = $player_1
# 		@player2obj = $player_2
# 	end

# 	player1_score = player1obj.instance_variable_get(:@history).instance_variable_get(:@score)
# 	player2_score = player2obj.instance_variable_get(:@history).instance_variable_get(:@score)
# 	puts "Final score is %d to %d" % [player1_score, player2_score]
# 	if player1_score > player2_score
# 		puts "Player 1 wins "
# 	elsif player1_score == player2_score
# 		puts "Game was a draw "
# 	else
# 		puts "Player 2 wins "
# 	end
# end

	def game(rounds)

	# def initialize
	# 	@player_1 = $player_1
	# 	@player_2 = $player_2
	# 	@player1obj = $player1obj
	# 	@player2obj = $player2obj
	# end

	# intro
	# choosePlayers
	# decidePlayerObject(@@player_1, @@player_2)
	# rounds(@@player1obj, @@player2obj)
	# scoreHandling(@@player1obj, @@player2obj)

		#introduction to game
		puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
		puts "Please choose two players:"
		puts "(1) StupidBot\n(2) RandomBot\n(3) IterativeBot\n(4) LastPlayBot\n(5) Human\n"	

		<<-Doc
		Set up each player
		Give the 5 options of players and take input 
		Ensure that the numver given (that corresponds with a player) is within 1-5
		If not, print invalid and let them try again
		If so, print the two players vs each other
		Doc
		player_1 = 0
		player_2 = 0
		players = ["StupidBot", "RandomBot", "IterativeBot", "LastPlayBot", "Human"]
		while true
			print "Select player 1:"
			player_1 = gets.to_i
			print "Select player 2:"
			player_2 = gets.to_i
			if (1..5).member?(player_1)
				if (1..5).member?(player_2)
					break
				else
					puts "Invalid choice(s) - start over "
				end
			else
				puts "Invalid choice(s) - start over "
			end
		end
	
		puts "%s vs. %s" % [players[player_1 - 1], players[player_2 - 1]]
		print "\n"
	
		<<-Doc
		create objects of players based on choice from user input
		store the choices in the history 
		Doc
		if player_1 == 1
			player1obj = StupidBot.new("StupidBot", History.new)
		elsif player_1 == 2
			player1obj = RandomBot.new("RandomBot", History.new)
		elsif player_1 == 3
			player1obj = IterativeBot.new("IterativeBot", History.new)
		elsif player_1 == 4
			player1obj = LastPlayBot.new("LastPlayBot", History.new)
		elsif player_1 == 5
			player1obj = Human.new("Human", History.new)
		end
		if player_2 == 1
			player2obj = StupidBot.new("StupidBot", History.new)
		elsif player_2 == 2
			player2obj = RandomBot.new("RandomBot", History.new)
		elsif player_2 == 3
			player2obj = IterativeBot.new("IterativeBot", History.new)
		elsif player_2 == 4
			player2obj = LastPlayBot.new("LastPlayBot", History.new)
		elsif player_2 == 5
			player2obj = Human.new("Human", History.new)
		end
	
		<<-Doc
		plays each round
		calls the players play method then logs plays
		prints out players and results of each round
		then compares players moves and declares the winner of the round
		Doc
		rounds.times do |i|
			move1 = 0
			move2 = 0
			round_number = i + 1
			puts "Round %d:" % round_number
			
			player1_move = player1obj.play()
			player2_move = player2obj.play()
	
			player1obj.instance_variable_get(:@history).log_opponent_play(player2_move.getName)
			player2obj.instance_variable_get(:@history).log_opponent_play(player1_move.getName)
	
			puts "Player 1 chose %s" % player1_move.getName
			puts "Player 2 chose %s" % player2_move.getName
			line, result = player1_move.compare_to(player2_move)
			puts line
			if result == "Win"
				puts "Player 1 won the round "
				player1obj.instance_variable_get(:@history).add_score
			elsif result == "Tie"
				puts "Round was a tie "
			elsif result == "Lose"
				puts "Player 2 won the round "
				player2obj.instance_variable_get(:@history).add_score
			end
			puts "\n"
		end

		<<-Doc
		Saves the score of each player from each round
		Prints what the final score is for all rounds played
		Declares winner of the entire Game
		Doc
		player1_score = player1obj.instance_variable_get(:@history).instance_variable_get(:@score)
		player2_score = player2obj.instance_variable_get(:@history).instance_variable_get(:@score)

		puts "Final score is %d to %d" % [player1_score, player2_score]
		if player1_score > player2_score
			puts "Player 1 wins "
		elsif player1_score == player2_score
			puts "Game was a draw "
		else
			puts "Player 2 wins "
		end
	end
end

roshambo = Game.new

# Main Program (should be last)
n_rounds = 5
# call to kick off the game
roshambo.game(n_rounds)