Dir[File.dirname(__FILE__) + '/../Mechanics/*.rb'].each {|file| require file}

include Mechanics

module Games

class HiLow

	def self.real_game
		
	 	deck = Mechanics::Deck.new.cards.shuffle


	 	puts "Welcome to High/Low\nHow much would you like to wager?: "
	 	wager = gets.strip.to_i
	 	puts "Game beginning..."
	 	house_card = deck.pop
		puts "The house card shows #{house_card.rank} of #{house_card.suit}"
		puts "Will you show a higher or lower card? H/L"
		choice = gets.strip.downcase
		user_card = deck.pop
		puts "Your card shows #{user_card.rank} of #{user_card.suit}"

		house_value = Mechanics::Deck.find_card(house_card)
		user_value = Mechanics::Deck.find_card(user_card)
			case choice
			when "h"
				if house_value < user_value
					puts "Congratulations, you win #{wager}!"
					return wager
				elsif user_value < house_value
					"Sorry, you lose"
					return wager * -1
				else 
					puts "you pushed. let's play again"
					puts 0
				end
			when 'l' 
				if house_value > user_value
					puts "Congratulations, you win #{wager}!"
					return wager
				elsif user_value > house_value
					puts "Sorry, you lose"
					return wager * -1
				else 
					puts "push. play again"
					return 0
				end
			end	
		end
	end
end