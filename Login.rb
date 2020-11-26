require_relative 'Session'

class Login

  def initialize_user
    puts "Enter your login"
    login = gets.chomp.to_s
    puts "Enter your password"
    password = gets.chomp.to_s
    @user  = Session.new(login, password)
  end
end
