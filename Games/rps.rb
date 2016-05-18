module Games


	class Rps

	@user_arr = []
	@options = %w[Rock Paper Scissors]
		def self.rps
			puts "Welcome to Rock, Paper, Scissors. A test of a real coders strength and stamina"
			puts "The rules are normal: Rock beats Scissors. Scissors beats Paper. Paper beats Rock."
			puts "However, we have hidden a magic number b/w 4-500 that will take you to the bomb to beat all..."
			puts "Guess right and we double your wager. Guess wrong and we take double your initial wager. Good luck!" 			
			self.choices_menu
		end
		
		def self.choices_menu
			puts "How much you like to wager?"
			wager = gets.strip.to_i
			puts "-" * 10
			puts "Ok, #{wager} it is. Good Luck!"
			puts "Press\n1:Rock\n2:Paper\n3:Scissors\n4:Exit Program"
			user = gets.strip.to_i
				case user
				when 1
					puts "You have selected Rock"
					puts '-' * 10
					@user_arr << "Rock" 
					house_response(wager)
				when 2
					puts "You have selected Paper" 
					puts '-' * 10
					@user_arr << "Paper" 
					house_response(wager)
				when 3
					puts "You have selected Scissors"
					puts '-' * 10 
					@user_arr << "Scissors" 
					house_response(wager)
				when 4
					puts "Thanks for playing!"
					exit 
				when 69
					puts "Congratulations! You found the bomb. Your wager is doubled".colorize(:purple)
					return wager * 2
				when 420
					puts "You done fucked and fell asleep high"
					`say Sleep Well!`
					self.choices_menu
				else
					puts "You guessed wrong. Now your money is ours".colorize(:red)
					`say ha ha ha`
					return wager * -2
					self.choices_menu
				end
		end

		def self.house_response(wager)
			house_choice = @options.sample
			puts "House played #{house_choice}"
				if @user_arr[0] == house_choice
					puts "It's a tie!".colorize(:blue)
					return 0
				elsif @user_arr[0] == @options[0] && house_choice == @options[2] || 
					@user_arr[0] == @options[1] && house_choice == @options[0] || 
					@user_arr[0] == @options[2] && house_choice == @options[1]
					puts 'Congratulations! You win!'.colorize(:green)
					return wager * 1
				else
					puts "You lose! House wins".colorize(:red)
					return wager * -1
				end
		end

	
	end
end
