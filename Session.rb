require_relative 'user.rb'
require_relative 'admin.rb'
require_relative 'superadmin.rb'

class Session

	def initialize(login, password)
		@login = login
		@password = password
	end

	def superadmin?
		@login == 'super' and @password == '111'
	end

	def admin?
		@login == 'admin' and @password == '111'
	end

	def log_in
		if superadmin?
			user = Superadmin.new(@login, @password)
		elsif admin?
			user = Admin.new(@login, @password)
		else
			user = User.new(@login, @password)
		end
	end
end
