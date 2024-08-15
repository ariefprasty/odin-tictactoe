class Game
  attr_accessor :board, :players

  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player = @players[0]
  end

  def play
    loop do
      @board.display
      position = get_position
      if @board.update(position, @current_player.marker)
        if @board.winning_combination?(@current_player.marker)
          @board.display
          puts "#{@current_player.name} wins!"
          @current_player.increase_score
          break
        elsif @board.full?
          @board.display
          puts "It's a tie!"
          break
        else
          switch_players
        end
      else
        puts "Invalid move! Try again."
      end
    end
  end

  private

  def get_position
    puts "#{@current_player.name}, enter your move as 'row,col':"
    gets.chomp.split(',').map(&:to_i)
  end

  def switch_players
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end
end
