WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (user_input)
  user_input.to_i - 1 
end 

def move (board, index, player)
  board[index] = player
end 

def position_taken?(board, index)
  board[index]== "X" || board[index] == "O"
end 

def valid_move? (board, index)
  index.between?(0,8) && !position_taken?(board, index)
end   

def turn (board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index (user_input)
  if valid_move?(board,index)
    move(board, index, current_player(board))
    display_board(board)
  else 
    puts "That move is invalid"
    turn (board)
  end 
end 

def turn_count(board)
  turns = 0 
    board.each do |token| 
    if token == "X" || token == "O"
      turn += 1
    end 
  end
  turns
end

def current_player(board)
  current_player = "X"
  if turn_count(board) % 2 == 0 
    current_player = "X"
  else 
    current_player = "O"
  end
end 

