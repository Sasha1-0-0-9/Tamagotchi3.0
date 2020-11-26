require 'yaml'

class User
	attr_accessor :login, :password
	def initialize(login, password)
		@login = login
		@password = password
		puts "You logged as user"
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
				pet.heal()
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
			when  "help"
				puts pet.help
				x = gets.chomp.to_s
			else
				p "ERROR. Use 'help' command to get more info"
				x = gets.chomp.to_s
			end
		end
	end

	def save
		user = {
      login: @login,
      password: @password,
      role: self.class.to_s
    }
      File.open('./databases/users.yml', 'a') { |file| file.puts(user.to_yaml) }
  end
end
