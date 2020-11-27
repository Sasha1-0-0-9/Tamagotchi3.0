require_relative 'UI'
require 'content_to_html'
require_relative 'Login'
require_relative 'Session'
require 'yaml'

class Duck < Ui

  def initialize (name, login, password, role, money)
    @login = login
    @password = password
    @role = role
    @name = name
    @money = money
    @asleep = 0
    @happiness = 100
    @satiety = 100
    @cleanliness = 100
    @health = 100
    @energy = 100
    @emoji = '&#128515;'
    banner()
    @html = ShowHTML.new
    puts @name + ' was born!'
  end

  def feed
    @emoji = '&#128523;'
  	puts "You feed #{@name}"
  	after_period_of_time(@asleep, @happiness, 0 , @cleanliness, @health, @energy)
  	@satiety = 100
  	@cleanliness -= rand(10..30)
  	@happiness += rand(20..40)
  	@energy += rand(5..10)
    checking
    save_db
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def walk
    @emoji = '&#128541;'
  	puts "You walked with #{@name}"
  	after_period_of_time(@asleep, 0, @satiety, @cleanliness, @health, @energy)
  	@happiness += rand(20..40)
  	@asleep -= rand(5..15)
  	@cleanliness -= rand(10..30)
  	@energy -= rand(20..50)
    checking
    save_db
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def take_a_shower
    @emoji = '&#128704;'
  	puts "#{@name} goes to have a shower"
  	after_period_of_time(@asleep, @happiness, @satiety, 0, @health, @energy)
  	@cleanliness = 100
  	@energy -= 5
    checking
    save_db
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def go_to_sleep
    @emoji = '&#128164;'
  	after_period_of_time(0, @happiness,@satiety, @cleanliness, @health, @energy)
  	@asleep = rand(0..30)
  	@happiness += rand(5..30)
  	@energy += rand(10..30)
  	puts "#{@name} sleeping sweety"
  	puts "Zzz"
    checking
    save_db
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def heal
    @emoji = '&#128138;'
  	puts "#{@name} took a pill"
  	@health += rand(30..50)
    @html.html_for_pet(@name, return_array, @emoji)
    save_db
  	if @health >= 100
      @emoji = '&#128565;'
      @health = 100
      @html.html_for_pet(@name, return_array, @emoji)
  	  puts "#{@name} died of drug overdose =(" #drug в смысле лакарства=)
  	  duck_when_lost("=(")
  	  puts "Press F to pay respect"
  	  gets.chomp
      exit
  	end
  end

  def drink_an_energy_drink
    @emoji = '&#128527;' '&#9889;'
  	puts "#{@name} drinked energy drink"
  	after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, 0)
  	@energy += 30
  	@health -= 15
  	@asleep -= 5
    checking
    save_db
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def play_boardgames
    @emoji = '&#129303;'
  	puts "You playing board games with #{@name}"
  	after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, @energy)
  	@happiness += rand(10..30)
  	@asleep -= rand(5..10)
  	@energy -= rand(0..10)
    checking
    save_db
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def spectate #случайное действие которое будет выполнять наша уточка при вызове этого метода
  	if rand(0..1).zero?
  		puts "You saw how your pet eats junk food"
  		random_action1_eat_junk_food
  	else
  		puts "You saw how your pet do sports"
  		random_action2_do_sports
  	end
  end

  def random_action1_eat_junk_food
    @emoji = '  &#128523;' '&#127828;'
  	after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, @energy)
  	@satiety += rand(5..10)
  	@health -= rand(5..15)
  	@cleanliness -= 5
    checking
    save_db
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def random_action2_do_sports
    @emoji = '&#9917;'
  	after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, @energy)
  	@satiety -= rand(5..10)
  	@health += rand(5..14)
  	@cleanliness -= 10
  	@energy -= rand(5..10)
    checking
    save_db
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def change_name
    new_name = gets.chomp.to_s
    @name = new_name
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def checking # проверка состояния питомца
  	if @satiety <= 0
  		@satiety = 0
  		puts "#{@name} died of hunger"
  		@emoji = '&#128565;'
  		duck_when_lost("Goodbye, my bro =(")
      @html.html_for_pet(@name, return_array, @emoji)
      exit

  	elsif @satiety < 50 and @satiety > 0
  		puts "#{@name} is hungry"
  		@emoji = '&#129396;'
  		duck("Bro, I'm hungry. Give me some food")
    elsif @satiety > 100
      @satiety = 100
  	end

  	if @happiness < 50 and @happiness > 0
  		@emoji = '&#128543;'
  		puts"#{@name} is sad"
  		duck("I'm sad. Play with me")

  	elsif @happiness > 100
  		@happiness = 100

  	elsif @happiness <= 0
  		@happiness = 0
  		@emoji = '&#128148;'
  		puts "#{@name} flew away to have fun"
      @html.html_for_pet(@name, return_array, @emoji)
      exit
  	end

  	if @asleep > 60
  		@emoji = '&#128564;'
  		p "#{@name} want to sleep"
  		duck("I want to sleep...Zzz")
  		@health -= rand(1..15)

  	elsif @asleep < 0
  		@asleep = 0

  	elsif @asleep >= 100
      @emoji = '&#128534;'
  		puts "#{@name} died of lack of sleep"
  		duck_when_lost("I just wanted to sleep...")
  		puts "Press F to pay respect"
      @html.html_for_pet(@name, return_array, @emoji)
  		gets.chomp
      exit
  	end

  	if @cleanliness < 0
  		@cleanliness = 0
      @health -= 10
    elsif @cleanliness >100
      @cleanliness = 100
  	elsif @cleanliness < 50
  		puts "#{@name} smells bad"
  		duck("OMG, I smell really bad")
  	end

  	if @health > 100
  		@health = 100
    elsif @health <= 0
  	 	@health = 0
      @emoji = '&#128565;'
      @html.html_for_pet(@name, return_array, @emoji)
  		puts "#{@name} died of illness"
  		duck_when_lost("Goodbye, my bro =(")
  		puts "Press F to pay respect"
  		gets.chomp
      exit
    elsif @health < 50
      puts "#{@name} feeling bad"
      duck("I got sick. I need a pill")
  	end

  	if @energy > 100
  		@energy = 100

  	elsif @energy < 30 and @energy > 0
  		puts "#{@name} is tired"
  		duck("I am tired")

  	elsif @energy < 0
  		@energy = 0
      @emoji = '&#128565;'
      @html.html_for_pet(@name, return_array, @emoji)
  		puts "#{@name} died of lack of energy"
  		puts "Press F to pay respect"
  		gets.chomp
      exit
  	end
  end

  def skip_day #чтобы вызывать private метод за пределами класса
  	after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, @energy)
  	checking
  end

  def kill
    @health = 0
    checking

  end

  def reset
    @asleep = 0
    @happiness = 100
    @satiety = 100
    @cleanliness = 100
    @health = 100
    @energy = 100
    @emoji = '&#128515;'
    @html.html_for_pet(@name, return_array, @emoji)
  end

  def change_login
    puts "Enter new login"
    new_login = gets.chomp.to_s
    @login = new_login
    puts "Login successfully changed. Don't forget about #{@name}, use 'help to see a list of commands'"
  end

  def save_db # запись сессии в базу (файл Session_login.yml)
    yaml = YAML.dump(self)
    File.open("./databases/Session_#{@login}.yml", "a") { |file| file.puts(yaml) }
  end


    def show_stats
  	return "
    #{@name}'s happiness: #{@happiness}
    #{@name}'s satiety: #{@satiety}
    #{@name}'s sleepiness: #{@asleep}
    #{@name}'s cleanliness: #{@cleanliness}
    #{@name}'s health: #{@health}
    #{@name}'s energy: #{@energy}
    #{@name}'s money: #{@money}$"
  end

  def change_values
    p "**Use hap to change happiness"
    p "**Use sat to change satiety"
    p"**Use slp to change sleepiness"
    p"**Use cln to change cleanliness"
    p"**Use hlth to change health"
    p"**Use enrg to change energy"
    command = gets.chomp.to_s
    while command != 'exit'
      case command
      when "hap"
        puts "Enter new value"
        value = gets.chomp.to_i
        @happiness = value
        checking
        save_db
        @html.html_for_pet(@name, return_array, @emoji)
        puts show_stats
        puts "If you want to change something else use commands for superadmin
        else use command 'exit'"
        command = gets.chomp.to_s

      when "sat"
        puts "Enter new value"
        value = gets.chomp.to_i
        @satiety = value
        checking
        save_db
        @html.html_for_pet(@name, return_array, @emoji)
        puts show_stats
        puts "If you want to change something else use commands for superadmin
        else use command 'exit'"
        command = gets.chomp.to_s

      when "cln"
        puts "Enter new value"
        value = gets.chomp.to_i
        @cleanliness = value
        checking
        save_db
        @html.html_for_pet(@name, return_array, @emoji)
        puts show_stats
        puts "If you want to change something else use commands for superadmin
        else use command 'exit'"
        command = gets.chomp.to_s

      when "hlth"
        puts "Enter new value"
        value = gets.chomp.to_i
        @health = value
        checking
        save_db
        @html.html_for_pet(@name, return_array, @emoji)
        puts show_stats
        puts "If you want to change something else use commands for superadmin
        else use command 'exit'"
        command = gets.chomp.to_s

      when "slp"
        puts "Enter new value"
        value = gets.chomp.to_i
        @sleepiness = value
        checking
        save_db
        @html.html_for_pet(@name, return_array, @emoji)
        puts show_stats
        puts "If you want to change something else use commands for superadmin
        else use command 'exit'"
        command = gets.chomp.to_s

      when "energ"
        puts "Enter new value"
        value = gets.chomp.to_i
        @energy = value
        checking
        save_db
        @html.html_for_pet(@name, return_array, @emoji)
        puts show_stats
        puts "If you want to change something else use commands for superadmin
        else use command 'exit'"
        command = gets.chomp.to_s
      else
        puts "TRY AGAIN"
        command = gets.chomp.to_s
      end
    end
  end

  def add_money # Так как в моей реализации можно играть только за утку, то вместо задания изменять
    #             тип питомца, буду изменять количество денег
    puts "Cheat code activated"
    @money += 250000
    puts show_stats
  end

  def return_array
  	state = ["happiness: #{@happiness}" , "satiety: #{@satiety} ", "sleepiness: #{@asleep} ",
  	"cleanliness: #{@cleanliness}" , "health: #{@health}", "energy: #{@energy}", "#{@emoji}"]
  	return state
  end

  def help
    return "
      *Press 0 to exit
      *Press 1 to sleep
      *Press 2 to feed your pet
      *Press 3 to walk with your pet
      *Press 4 to take a shower
      *Press 5 to heal your pet
      *Press 6 to drink an energy drink
      *Press 7 to play board games with your pet
      *Press 8 to watch what's your pet doing without you
      *Press 9 to skip 1 day
      \x1b[31m *Use new_name to change pet's name(Requires admin/superadmin rights)
      * Use change_state to change state of your pet (Only for superadmin)
      *Use kill to kill your pet (Only for superadmin)
      *Use reset to reset your pet to default (Only for superadmin)
      *Use new_login to change login (Only for superadmin)
      *Use HESOYAM to change money balance(only for super admin)\x1b[0m
      *Use 'help' to get menu with instruction"
    end

  private

  def after_period_of_time(asleep, happiness, satiety, cleanliness, health, energy) #метод имитирующий прохождение времени
  	puts "A few moments later..."
  	sleep 3
  	@asleep += rand(5..20)
  	@happiness -= rand(10..20)
  	@satiety -= rand(10..40)
  	@cleanliness -= rand(1..10)
  	@health -= rand(1..5)
  	@energy -= rand(1..10)
  end
end


user = Login.new.initialize_user.log_in
user.save
puts "Enter your pet's name"
name = gets.chomp
puts "Enter your pet's age money balance(max 100$)"
money = gets.chomp.to_i
money = 100 if money > 100
pet = Duck.new(name, user.login, user.password, user.class.to_s, money)
pet.save_db
html = ShowHTML.new
html.html_for_pet(name, pet.return_array, pet.help)
pet.show_stats
user.commands(pet)
