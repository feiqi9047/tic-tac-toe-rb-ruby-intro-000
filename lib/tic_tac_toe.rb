WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

board = [" ", " ", " ", " ", " ", " "," ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.int_i - 1 
  return index
end

def move(board, index, token)
  board[index]=token
end

def position_taken?(board, index)
  if board[index] = " " || board[index] = "" || board[index] =nil
    return false 
  else 
    return true 
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index)==false 
    return true
  else 
    return false 
  end 
end 

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)==true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end 

def turn_count(board)
  count=0 
  board.each do |turn| 
    if turn == "X" || turn == "O"
      count += 1
    else
      return count
    end
  end
end

def current_player(board)
  board.each do |turn|
    if turn_count(board)%2==0 
      return "X"
else
  return "O"
end
end
end
   
def won?(board)
  WIN_COMBINATIONS.detect do 
    |combo| 
    if combo.all? {|index| board[index]=="X"} || combo.all? {|index| board[index]=="O"}
  end
end

def full(board)
  board.all? {|index| index== "X" || index =="O"}
end 

def draw(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true 
  else
    false 
  end 
end 

def winner(board)
  if won?(board)
    return board[won?(board).first]
  else
    return nil 
  end
end

def play(board)
  turn = 0 
  until turn ==9 
  turn (board)
  turn +=1
end
end 