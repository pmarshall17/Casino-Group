#require_relative 'mencahnics/dice'
Dir[File.dirname(__FILE__) + '/Mechanics/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/Games/*.rb'].each {|file| require file}

include Mechanics
include Games

class Casino
  
  attr_accessor :users

  def initialize
  	@users=[]
  end

  def play
    puts Mechanics::Dice.roll
    cards = Mechanics::Deck.new.cards.shuffle
    cards.each do |card| 
      puts "#{card.rank} of #{card.suit}"
  	end
	end

	def welcome_menu
		puts "***Welcome to DPL Casino***"
		print "Please enter your name: "
		user_name = gets.strip
		print "How much money will we be wagering: "
		money = gets.strip.to_i
			if money < 200
				puts "Get a job you cheap bastard: we only accept $200 or more to play"
				welcome_menu
				# TODO loop this back to just the wager enter later
			else 
				@users << Person.new(user_name, money)
				puts "Welcome #{user_name}. Your balance is $#{'%.2f' % money}"
			end
	end	
	
	def game_menu
		puts "Which game would you like to play today?"
		puts "Your options are:\n1:Slots\n2:High/Low\n3:Exit"
		case gets.strip.to_i
		
		when 1
			puts "You have selected 'Slots': enter 'yes' to continue?"
			slots = gets.strip.downcase
				if slots == 'yes'
					again = ""
					Games::Slots.slots_welcome
					while again != "n"
						@users.last.wallet += Games::Slots.slots_play
						puts "Your new balance is #{@users.last.wallet}"
						puts "Do you want to play again? Y/N"
						again = gets.strip.downcase 
					end
				end
		when 2
			puts "You have selected 'High/Low': enter 'yes' to continue"
			hiLow = gets.strip.downcase
				if hiLow == 'yes'
					again = ""
					while again != "n"
						@users.last.wallet += Games::HiLow.real_game
						puts "Your new balance is #{@users.last.wallet}"
						puts "Do you want to play again? Y/N"
						again = gets.strip.downcase 
					end
				end
		when 3
			puts "Thank you for playing!"
			exit
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



# @game.play


# @game = Casino.new
# @game.pull
