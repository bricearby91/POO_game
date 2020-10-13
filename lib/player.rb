

class Player
	attr_accessor :name, :life_points
		def initialize(name)
			@name = name
			@life_points = 10
		end

		def show_state
			puts "#{name} a #{life_points} points de vie"
		end

		def gets_damage(damage)
			@life_points -= damage
			if @life_points <= 0
				puts "Le joueur #{name} a été tué !"
			end
		end

		def attacks(attacked_player)
			puts "Le joueur #{name} attaque le joueur #{attacked_player.name}"
			damage_points = compute_damage
			puts "Il lui inflige #{damage_points} points de dommages."
			attacked_player.gets_damage(damage_points)
		end

		def compute_damage
			return rand(1..6)
		end

end

class HumanPlayer < Player
	attr_accessor :weapon_level, :life_points
	
	def initialize(name)
		@life_points = 100
		@weapon_level = 1
		@name = name
	end

	def show_state
		puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		found_weapon_level = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{found_weapon_level}"
		if found_weapon_level > @weapon_level
			puts "Youhou ! Elle est meilleure que ton arme actuelle ; tu la gardes"
			@weapon_level = found_weapon_level
		else
			puts "Dommage, elle n'est pas plus puissante que ton arme actuelle.."
		end
	end

	def search_health_pack
		random_nb = rand(1..6)
		case random_nb
		when 1
			puts "Tu n'as rien trouvé.."
		when 2..5
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			@life_points += 50
				if @life_points > 100
					@life_points = 100
				end
		when 6
			@life_points += 80
				if @life_points > 100
					@life_points = 100
				end
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
		end
		end

end
