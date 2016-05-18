
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file}


module Games

	class Slots

		def self.organizer(results, wager)
	  	if results.uniq.length == 1
	  		puts "Congratulations! Big Winner with 3-across!".colorize(:purple)
				return wager * 2   	
	  	elsif results.uniq.length == 2
	  		puts "Winner with two matches!".colorize(:purple)
	  		return wager * 1
	  	else
	  		puts "You are a loser. Cut your losses and head home now".colorize(:red)
	  	  return wager * -1 
	  	end
	  end	
		
		def self.slots_welcome
			puts '-' * 10 
			puts "Welcome to Slots!"
			puts '-' * 10 
			puts "Here's how it works:\nYou may spin as many times as you want...\nyou will be prompted to place a wager..."
			puts "Three matches across the board will triple your winnings. Any two matches across will pay out double. The rest will stay with the house!"
			puts "Good luck!"
		end
	  
	  def self.slots_play 
	  	slot_symbols = %w[Diamond Spade Orange Cherry Bar Seven]
	  	puts "What's your wager?"
	  	wager = gets.strip.to_i
	  	puts "Ok...#{wager} it will be then."

	  	puts "-" * 10
	  	result1 = slot_symbols.sample
	  	result2 = slot_symbols.sample
	  	result3 = slot_symbols.sample
	  	puts "-" * 10

	  	puts "#{result1} ** #{result2} ** #{result3}"
	  	organizer([result1, result2, result3], wager) 
	  end
	end
end