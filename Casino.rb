require 'colorize'
Dir[File.dirname(__FILE__) + '/Mechanics/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/Games/*.rb'].each {|file| require file}

include Mechanics
include Games

class Casino
  
  attr_accessor :users

  def initialize
  	@users=[]
  end

  
# def user_change
# print "You have selected to change player. Which one would you like?: "
# puts "Press 1 for player 1 #{@users.first[1]}"
# player_change = gets.strip.to_i
# 	case player_change

# 	when 1 
# 		puts "You have selected player 1"
	
# 		game_menu
# 	when 2
# 		puts "You have selected player 2"
# 		game_menu
# 	end	

# end


	def play
    puts Mechanics::Dice.roll
    cards = Mechanics::Deck.new.cards.shuffle
    cards.each do |card| 
      puts "#{card.rank} of #{card.suit}"
  	end
	end

	def welcome_menu
		puts "***Welcome to DPL Casino***".colorize(:magenta)
		puts "You may choose to swap players at any time by pressing '9'".colorize(:blue)
		print "Please enter your player name: ".colorize(:blue)
		user_name = gets.strip
		print "How much money will we be playing with today?: ".colorize(:blue)
		money = gets.strip.to_i
			if money < 200
				puts "Get a job you cheap bastard: we only accept $200 or more to play".colorize(:red)
				welcome_menu
			else 
				@player = Person.new(user_name, money)
				@users << @player
				puts "Welcome #{user_name}!. Your balance is $#{'%.2f' % money}"
			end
	end	
	
	def game_menu
		puts "-" * 10
		puts "Which game would you like to play today?"
		puts "-" * 10
		puts "Your options are:" + "\n1:Slots\n2:High/Low\n3:Rock-Paper-Scissors\n4:Exit\n9:Enter new player name\n10:Change players".colorize(:yellow)
		case gets.strip.to_i
		
		when 1
			puts "-" * 10
			puts "You have selected 'Slots': enter 'yes' to continue?"
			slots = gets.strip.downcase
				if slots == 'yes'
					again = ""
					Games::Slots.slots_welcome
					while again != "n"
						@player.wallet += Games::Slots.slots_play
						puts "Your new balance is #{@users.last.wallet}"
						puts "Do you want to play again? Y/N"
						again = gets.strip.downcase 
					end
				end
		when 2
			puts "-" * 10
			puts "You have selected 'High/Low': enter 'yes' to continue"
			hiLow = gets.strip.downcase
				if hiLow == 'yes'
					again = ""
					while again != "n"
						@player.wallet += Games::HiLow.real_game
						puts "Your new balance is #{@users.last.wallet}"
						puts "Do you want to play again? Y/N"
						again = gets.strip.downcase 
					end
				end
		when 3
			puts "-" * 10
			puts "You have selected 'Rock Paper Scissors': enter 'yes' to continue"
			rock = gets.strip.downcase
				if rock == 'yes'
					again = ""
					while again != "n"
					@player.wallet += Games::Rps.rps
					puts "Your new balance is #{@users.last.wallet}"
					puts "Do you want to play again? Y/N"
					again = gets.strip.downcase 
					end
				end	
		when 4
			puts "Thank you for playing!"
			exit

		when 9 
			print "Please enter your player name: "
			user_name = gets.strip
			print "How much money will we be playing with today?: "
			money = gets.strip.to_i
			if money < 200
				puts "Get a job you cheap bastard: we only accept $200 or more to play"
				welcome_menu
			else 
				@player = Person.new(user_name, money)
				@users << @player
				puts "Welcome #{user_name}!. Your balance is $#{'%.2f' % money}"
			end
		
		# when 10
		# 	@users.each do |user|
		# 		puts user.name
		# 		user_change
		# end

		else	
			puts "Invalid response... Try again"	
		end
			game_menu
	end
end

class Person
	attr_accessor :name, :wallet
	 
	 def initialize(name, wallet)
     @name = name
     @wallet = wallet
   end

end

@game = Casino.new
@game.welcome_menu
@game.game_menu

