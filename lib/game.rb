

class Game
	attr_accessor	:human_player, :enemies_in_sight, :players_left
		def initialize
			@human_player=HumanPlayer.new("Wolverine")
			enemy1=Player.new("José")
			enemy2=Player.new("Josiane")
			enemy3=Player.new("Joshua")
			enemy4=Player.new("Joséphine")
			@enemies_in_sight = Array.new
			@enemies_in_sight.push(enemy1,enemy2,enemy3,enemy4)
			@players_left = 20
		end

		def kill_player(player)
			@enemies_in_sight.delete(player)
			puts "Le joueur #{player.name} est mort. Paix à son âme.."
			@players_left -= 1	
		end

		def is_still_ongoing?
			@human_player.life_points > 0 && @players_left != 0
		end
		
		def new_players_in_sight
			if @enemies_in_sight.size >= @players_left
				puts "Tous les joueurs sont déjà en vue"
				return
			end
			random_nb = rand(1..6)
			case random_nb
			when 1
				puts ""
				puts "Aucun nouveau joueur ne rejoint la partie."
			when 2..4
				puts ""
				puts "Un nouveau joueur rejoint la partie !"
				new_player_creation
			else
				puts ""
				puts "Deux joueurs rejoignent la partie ! Ca se corse !"
				new_player_creation
				new_player_creation
			end
		end

		def new_player_creation
				new_player_name = "enemy_" + rand(1000..9999).to_s
				new_player = Player.new(new_player_name)
				@enemies_in_sight.push(new_player)	
		end

		def show_players
			@human_player.show_state
			puts "Il reste encore #{@enemies_in_sight.size} ennemis à combattre."
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
  
		for i in (0...@enemies_in_sight.size)	
			if @enemies_in_sight.include?(@enemies_in_sight[i])	
			  print "#{i} - "
  			@enemies_in_sight[i].show_state
			end	
		end
		puts ""
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
  	end
		

		for i in 0...@enemies_in_sight.size
			if user_choice == i.to_s 
    		@human_player.attacks(@enemies_in_sight[i])
			end
		end

		for i in (0...@enemies_in_sight.size)
			if @enemies_in_sight[i].life_points <= 0
				kill_player(@enemies_in_sight[i])
				break
			end
		end
	end

	def enemies_attack
	  puts "Les autres joueurs t'attaquent !"
		puts ""
	  @enemies_in_sight.each do |enemy|
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
