

class Game
	attr_accessor	:human_player, :enemies
		def initialize
			@human_player=HumanPlayer.new("Wolverine")
			enemy1=Player.new("José")
			enemy2=Player.new("Josiane")
			enemy3=Player.new("Joshua")
			enemy4=Player.new("Joséphine")
			@enemies = Array.new
			@enemies.push(enemy1,enemy2,enemy3,enemy4)
		end

		def kill_player(player)
			@enemies.delete(player)
			puts "Le joueur #{player.name} est mort. Paix à son âme.."
		end

		def is_still_ongoing?
			@human_player.life_points > 0 && @enemies != []
		end

		def show_players
			@human_player.show_state
			puts "Il reste encore #{@enemies.size} ennemis à combattre."
		end

		def menu
		  puts ""
		  puts "Tu as encore #{@human_player.life_points} points de vie"
 			puts "Quelle action veux-tu effectuer ?"
 	 		puts ""
  		puts "a - chercher une meilleure arme"
  		puts "s - chercher à te soigner"
  		puts ""
  		puts "Attaquer un joueur en vue :"
  
		for i in (0...@enemies.size)	
			if @enemies.include?(@enemies[i])	
			  print "#{i} - "
  			@enemies[i].show_state
			end	
		end
		end
			
	def menu_choice
	  puts "Indique ici ton choix :"
	  print "> "
  	user_choice = gets.chomp.to_s

  	case user_choice
  	when "a"
    	@human_player.search_weapon
  	when "s"
    	@human_player.search_health_pack
  	when "0"
    	@human_player.attacks(@enemies[0])
  	when "1"
    	@human_player.attacks(@enemies[1])
  	when "2"
    	@human_player.attacks(@enemies[2])
  	when "3"
    	@human_player.attacks(@enemies[3])
  	else
    	puts "Ce choix n'existe pas."
  	end

		for i in (0...@enemies.size)
			if @enemies[i].life_points <= 0
				kill_player(@enemies[i])
				break
			end
		end
	end

	def enemies_attack
	  puts "Les autres joueurs t'attaquent !"

	  @enemies.each do |enemy|
  	  if enemy.life_points > 0
    	  enemy.attacks(@human_player)
   		end
  	end
	end

	def end_game
		puts "La partie est finie."

		if @human_player.life_points > 0
  		puts "BRAVO ! TU AS REMPORTE LA PARTIE !"
		else
  		puts "Perdu.. Dommage, ce sera pour une prochaine fois !"
		end
	end
end
