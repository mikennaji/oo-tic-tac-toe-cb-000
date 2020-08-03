class TicTacToe
  attr_accessor :board


def initialize
  @board= [" "," "," "," "," "," "," "," "," "]
end

def display_board
    puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
    puts "-----------"
    puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
    puts "-----------"
    puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
  end

  def input_to_index(user_input)
  number= user_input.to_i
  index = number-1


 end

  def position_taken?(index)
    if self.board[index] == " " || self.board[index] == "" || self.board[index] == nil
       return false
    elsif board[index] == "X" || board[index] =="O"
       return true
    end
  end

  def  valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
      return true
    elsif position_taken?(index) == true && index.between?(0,8)
      return false
    end
  end

  def turn_count
    counter = 0
    self.board.each do |play|
      if play == "X" || play == "O"
        counter += 1
      end
    end
    return  counter
  end

  def current_player
    count = turn_count
    if count%2 ==0 || count == 0
      return "X"
    else
      return "O"
    end
  end

  def update_array_at_with(index, value)
    self.board[index] = value
  end

  def move(index, character)
    self.board[index] = character
  end

  def turn
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
    display_board
  else
    turn(index)
  end
end


 def play

   until over?
       turn
   end




  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
   puts "Cat's Game!"
  end


 end


 WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def full?
  self.board.all? { |x| x=="O" || x == "X"  }


end

def draw?
  full?
  set = won?
    if set.nil?
      return true
    end
  if set== WIN_COMBINATIONS[0]
    return false
  end



end

def won?


  WIN_COMBINATIONS.each do |win_combination|

    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    position_1= self.board[win_index_1]
    position_2= self.board[win_index_2]
    position_3= self.board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end


  end

  if self.board.empty?
    return false
  end




end

def over?
  set = won?
  if set.nil? && full?
    return true
  end
  draw?
  won?
end


def winner

  set = won?
  if set.nil?
    return nil
  end
  win_set =self.board[set[0]]
  if win_set == "O"
    return "O"
  end
  if win_set == "X"
    return "X"
  else
    return nil
  end



end



end
