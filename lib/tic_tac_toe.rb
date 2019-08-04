class TicTacToe 
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  def input_to_index(users_input)
    users_input.to_i - 1 
  end 
  def move(board_index, character)
    return @board[board_index] = character
  end 
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end 
  def valid_move?(index_number)
    if index_number.between?(0, 8) == true && position_taken?(index_number) == false 
      return true 
    else
      return false
    end 
  end 
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    character = current_player
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end 
  end
  def turn_count 
    counter = 0 
    @board.each do |value|
      if value == "X" || value == "O"
        counter += 1 
      end 
    end 
    return counter
  end 
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else 
      return "O"
    end 
  end 
  def won?
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" &&  @board[combo[2]] == "X"
          return combo
        else if @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        else
          false 
        end 
      end 
    end 
    false 
  end 
  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end 
  def draw?
    if full? && !won?
      return true 
    else 
      return false 
    end 
  end 
  def over?
    if won? || draw? || full?
      return true 
    else
      return false 
    end 
  end 
  def winner
    index = []
    index = won?
    if index == false
      return nil
    else 
      if @board[index[0]] == "X"
        return "X"
      else 
        return "O"
      end 
    end 
  end
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end 
  end
end 

  
  
  