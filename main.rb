#here to play tictactoe
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

# Get player names and markers
puts "Enter Player 1's name:"
player1_name = gets.chomp

puts "Enter Player 1's marker (any single character):"
player1_marker = gets.chomp

# Ensure the marker is a single character
until player1_marker.length == 1
  puts "Invalid marker! Please enter a single character:"
  player1_marker = gets.chomp
end

puts "Enter Player 2's name:"
player2_name = gets.chomp

puts "Enter Player 2's marker (any single character):"
player2_marker = gets.chomp

# Ensure the marker is a single character and different from Player 1's marker
until player2_marker.length == 1 && player2_marker != player1_marker
  if player2_marker == player1_marker
    puts "Marker already taken by Player 1! Please choose a different marker:"
  else
    puts "Invalid marker! Please enter a single character:"
  end
  player2_marker = gets.chomp
end

# Create Player objects
player1 = Player.new(player1_name, player1_marker)
player2 = Player.new(player2_name, player2_marker)

# Start the game loop
game = Game.new(player1, player2)

loop do
  game.play
  puts "Play again? (y/n)"
  break if gets.chomp.downcase != 'y'
  game.board = Board.new # Reset the board
end

puts "Final Scores:"
puts "#{player1.name}: #{player1.score}"
puts "#{player2.name}: #{player2.score}"
