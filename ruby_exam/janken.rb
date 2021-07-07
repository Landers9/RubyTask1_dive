# Debut du programme et creation de la classe Player
class Player
  def hand
    puts "Veuillez saisir un nombre."
    puts "0: Goo\n1: Choki\n2: Par"

    input_hand = gets.to_i

    while input_hand != 0 && input_hand !=1 && input_hand != 2
      puts "Veuillez saisir un nombre entier entre 0 et 2"
      puts "0: Goo\n1: Choki\n2: Par"

      input_hand = gets.to_i
    end
    return input_hand
  end
end

# creation de la classe Enemy
class Enemy
  def hand
    return Random.new.rand(0..2)
  end
end

class Janken
  def pon (player_hand, enemy_hand)
    # Remplacez ["goo", "choki", "par"] la variable "janken".

    janken = ["Goo", "Choki", "Par"]

    result = (player_hand - enemy_hand + 3) % 3

    if result == 0
        puts "La main de l'adversaire est #{janken[enemy_hand]}.Vous etes a égalité"
        return true

    elsif result == 1
      puts "La main de l'adversaire est #{janken[enemy_hand]}.Vous aviez perdu"
      return false

    else
      puts "La main de l'adversaire est #{janken[enemy_hand]}.Vous aviez gagné"
      return false
    end
  end
end

# variable restart global
$next_game = true

# Écrivez la logique pour exécuter le jeu roche-papier-ciseaux.
class GameStart

    def self.jankenpon

      # Remplacez le Player instancié par la variable "player".
      player = Player.new
      player_hand = player.hand

      #Assignez une instanciation d'Enemy à la variable "ennemi".
      enemy = Enemy.new
      enemy_hand = enemy.hand

      #Assignez une instanciation de Janken à la variable "janken".
      janken = Janken.new

      $next_game = janken.pon(player_hand, enemy_hand)
   end
end

# Appelez la méthode jankenpon avec le nom de la classe.

while $next_game
  GameStart.jankenpon
end
