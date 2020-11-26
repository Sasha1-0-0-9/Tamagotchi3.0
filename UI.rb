class Ui #класс, отвечающий за внешний вид программы

  def banner
  	puts "\x1b[1;32m _______                                _       _     _ "
  	puts "|__   __|                              | |     | |   (_)"
  	puts "   | | __ _ _ __ ___   __ _  __ _  ___ | |_ ___| |__  _ "
  	puts "   | |/ _` | '_ ` _   / _` |/ _` |/ _  | __/ __| '_  | |"
  	puts "   | | (_| | | | | | | (_| | (_| | (_) | || (__| | | | |"
  	puts "   |_|___,_|_| |_| |_|___,_|___, |____/ ___ ___|_| |_|_|"
  	puts "                             __/ |                      "
  	puts "                            |___/                       \x1b[0m"
  	puts "			      \x1b[32mMade by Sasha Pysmenny\x1b[0m"
  	duck("Hey! My name is #{@name}")

  	puts "			\x1b[1;32mINSTRUCTION
  	Press 0 to exit
  	Press 1 to sleep
  	Press 2 to feed your pet
  	Press 3 to walk with your pet
  	Press 4 to take a shower
  	Press 5 to heal your pet
  	Press 6 to drink an energy drink
  	Press 7 to play board games with your pet
  	Press 8 to watch what's your pet doing without you
  	Press 9 to skip 1 day
  	Use 'help' to get menu with instruction\x1b[0m"
  end

  def duck(param)
			puts "\x1b[33m	            $$$$$$      /\x1b[5;1;33m#{param}\x1b[0m\x1b[33m
	           $$_____$$   /
	          $__(•)____$$/
	        $$__________$
	          $$_____$
	          $____$
	         $____$__$$$__$$______$
	        $$_____$_____$$__$$__$$$
	        $______$___________$$__$
	        $$_______$______$$_____$
	        $$________$$$$$$______$
	        $$$________________$
	          $$$$__________$$
	            $$$$$$$$$$$$ \x1b[0m"""

  end

  def duck_when_lost(param)
				puts "\x1b[33m	            $$$$$$      /\x1b[5;1;33m#{param}\x1b[0m\x1b[33m
	           $$_____$$   /
	          $__(\x1b[31mX\x1b[33m)____$$/
	        $$__________$
	          $$_____$
	          $____$
	         $____$__$$$__$$______$
	        $$_____$_____$$__$$__$$$
	        $______$___________$$__$
	        $$_______$______$$_____$
	        $$________$$$$$$______$
	        $$$________________$
	          $$$$__________$$
	            $$$$$$$$$$$$ \x1b[0m"""
  end
end
