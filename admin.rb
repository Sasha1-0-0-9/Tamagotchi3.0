class Admin < User

	def initialize(login, password)
		@login = login
		@password = password
		puts "You logged as admin"
		puts "You can use new commands:
		new_name to change your pet's name
		money to change pet's money balance"
	end

	def commands(pet)
		x = gets.chomp.to_s
		while x != "0"
			case x
			when "1"
				pet.go_to_sleep
				puts pet.show_stats
				x = gets.chomp.to_s
			when "2"
				pet.feed
				puts pet.show_stats
				x = gets.chomp.to_s
			when "3"
				pet.walk
				puts pet.show_stats
				x = gets.chomp.to_s
			when "4"
				pet.take_a_shower
				puts pet.show_stats
				x = gets.chomp.to_s
			when "5"
				pet.heal
				puts pet.show_stats
				x = gets.chomp.to_s
			when "6"
				pet.drink_an_energy_drink
				puts pet.show_stats
				x = gets.chomp.to_s
			when "7"
				pet.play_boardgames
				puts pet.show_stats
				x = gets.chomp.to_s
			when "8"
				pet.spectate
				puts pet.show_stats
				x = gets.chomp.to_s
			when "9"
				pet.skip_day
				puts pet.show_stats
				x = gets.chomp.to_s
			when "new_name"
				pet.change_name
				x = gets.chomp.to_s
			when "money"
				pet.add_money
				x = gets.chomp.to_s
			when  "help"
				puts pet.help
				x = gets.chomp.to_s
			else
				p "ERROR. Use 'help' command to get more info"
				x = gets.chomp.to_s
			end
		end
	end
end
