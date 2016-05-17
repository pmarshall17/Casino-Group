# module Games
# # 

class Rps

@user_arr = []
@options = %w[Rock Paper Scissors]

	def self.choices_menu
		puts "Press\n1:Rock\n2:Paper\n3:Scissors\n4:Exit Program"
		user = gets.strip.to_i
			case user
			when 1
				puts "You have selected Rock"
				puts '-' * 10
				@user_arr << "Rock" 
				house_response
			when 2
				puts "You have selected Paper" 
				puts '-' * 10
				@user_arr << "Paper" 
				house_response
			when 3
				puts "You have selected Scissors"
				puts '-' * 10 
				@user_arr << "Scissors" 
				house_response
			when 4
				puts "Thanks for playing."
				exit 
			when 5
				puts "Congratulations! You found the bomb. Your amount is tripled"
				# return wager * 3
			else
				puts "Invalid selection. Try again"
				self.choices_menu
			end
	end

	def self.house_reponse
		house_choice = @options.sample
		puts "House played #{house_choice}"
			if @user_arr == house_choice
				puts "It's a tie!"
				# return 0
			elsif @user_arr == @options[0] && house_choice == @options[2] || 
				@user_arr == @options[1] && house_choice == @options[0] || 
				@user_arr == @options[2] && house_choice == @options[1]
				puts 'Congratulations! You win!'
				# return wager * 1
			else
				puts "House wins, you lose!"
				# return wager * -1
			end
	end

	def self.rps
		puts "Welcome to Rock, Paper, Scissors. A test of a real coders strength and stamina"
		puts "How much you like to wager?"
		wager = gets.strip.to_i
		puts "Ok, #{wager} it is. Good Luck!"
		self.choices_menu
	end

	rps
	choices_menu

end










# end







# puts "Welcome to Paper Rock Scissors"

# CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

# loop do
 
#  # player picks
#  begin 
#    puts "Pick one: (p/r/s)"
#    player_choice = gets.chomp.downcase
#  end until CHOICES.keys.include?(player_choice)

#  # computer picks
#  computer_choice = CHOICES.keys.sample

# def display_winning_message(winning_choice)
#  case winning_choice
#  when 'p'
#    puts "Paper wraps Rock!"
#  when 'r'
#    puts "Rock smashes Scissors!"
#  when 's'
#    puts "Scissors cuts Paper!"
#  end
# end

# if player_choice == computer_choice
#  puts "It's a tie!"
# elsif (player_choice == 'p' && computer_choice == 'r') || 
# (player_choice == 'r' && computer_choice == 's') || 
# (player_choice == 's' && computer_choice == 'p')
#  display_winning_message(player_choice)
#  puts "YOU WIN!!"
# else
#  display_winning_message(computer_choice)
#  puts "Computer won!"
# end

# puts "Play again? (y/n)"
# break if gets.chomp.downcase != 'y'

# end

# puts "Good Bye o/"