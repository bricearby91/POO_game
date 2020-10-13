require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "----------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "----------------------------------------------------"

puts "Quel est votre prénom ?"
print "> "

name_user = gets.chomp

user=HumanPlayer.new(name_user)

enemy1=Player.new("Josiane")
enemy2=Player.new("José")

enemies = Array.new
enemies.push(enemy1)
enemies.push(enemy2)

while user.life_points >0 && (enemy1.life_points > 0 || enemy2.life_points >0)
	puts ""
	puts "Tu as encore #{user.life_points} points de vie"
	puts "Quelle action veux-tu effectuer ?"
	puts ""
	puts "a - chercher une meilleure arme"
	puts "s - chercher à te soigner"
	puts ""
	puts "Attaquer un joueur en vue :"
	print "0 - "
	enemy1.show_state
	print "1 - "
	enemy2.show_state

	puts "Indique ici ton choix :"
	print "> "
	user_choice = gets.chomp.to_s

	case user_choice
	when "a"
		user.search_weapon
	when "s"
		user.search_health_pack
	when "0"
		user.attacks(enemy1)
	when "1"
		user.attacks(enemy2)
	else
		puts "Ce choix n'existe pas."
	end

	puts ""
	if enemy1.life_points > 0 && enemy2.life_points > 0 
	puts "Les autres joueurs t'attaquent !"
	end
	enemies.each do |enemy|
		if enemy.life_points > 0
			enemy.attacks(user)
		end
	end

	

end

puts ""
puts "La partie est finie."

if user.life_points > 0
	puts "BRAVO ! TU AS REMPORTE LA PARTIE !"
else
	puts "Perdu.. Dommage, ce sera pour une prochaine fois !"
end
