
class Superadmin < User

  def initialize(login, password)
  	@login = login
  	@password = password
  	puts "You logged as super admin"
  	puts "You can use new commands:
  	new_name to change your pet's name
  	kill to kill your pet
  	change_state to change parameters of your pet
  	reset to reset all points to default
  	new_login to change login
  	HESOYAM to add 250000$" # минутка ностальгии :D
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
      when "change_state"
        pet.change_values
        x = gets.chomp.to_s
      when "kill"
        pet.kill
        x = gets.chomp.to_s
      when "reset"
        pet.reset
        puts pet.show_stats
        x = gets.chomp.to_s
      when "new_login"
        pet.change_login
        x = gets.chomp.to_s
      when "HESOYAM"
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
