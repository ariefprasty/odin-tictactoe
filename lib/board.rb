class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    @grid.each do |row|
      puts row.join(" | ")
      puts "---------"
    end
  end

  def update(position, marker)
    row, col = position
    if @grid[row][col] == ' '
      @grid[row][col] = marker
      true
    else
      false
    end
  end

  def full?
    @grid.flatten.none? { |cell| cell == ' ' }
  end

  def winning_combination?(marker)
    winning_positions.any? do |combo|
      combo.all? { |position| @grid[position[0]][position[1]] == marker }
    end
  end

  private

  def winning_positions
    [
      # Rows
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      # Columns
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      # Diagonals
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]]
    ]
  end
end
