# This prints the baord to the screen for users 
game_board = ["-", "-", "-",
             "-", "-", "-",
             "-", "-", "-"]

# Global Variable 
current_game = True

# Global Variable 
winner = None

# Global Variable 
player_right_now = "X"


# prints the baord to the screen and see each position on the baord 
def print_board_to_screnn():

  spacing = " | "
  
  print(game_board[0] + spacing + game_board[1] + spacing + game_board[2])
  print(game_board[3] + spacing + game_board[4] + spacing + game_board[5])
  print(game_board[6] + spacing + game_board[7] + spacing + game_board[8])

# Making all the functions for the rules of TicTacToe
def tic_tac_toe_game():

  print_board_to_screnn()

  while current_game:
    
    player_turn(player_right_now)
    game_over()
    switch_player ()
  
  # checks a set of conditions and see's which one is passed and which one isnt 
  if winner == "X" or winner == "O":
    print(winner + "won the game, congratulations!")
    
  elif winner == None:
    print("Its a tie game, play again!")



# checks whether its this players turn and if it is, checks a set of conditions to help play the game
def player_turn(user):

  print(user + "Turn")
  user_position = input("Please choose a position from 1-9: ")

  # checks if the player applies the correct index value otherwise it goes through this while loop
  valid = False
  while not valid:

    while user_position not in ["1", "2", "3", "4", "5", "6", "7", "8", "9"]:
      user_position = input("Invalid Choice. Please choose a position from 1-9: ")
 
    user_position = int(user_position) - 1

    # Makes sure that the user doesnt overlap players 
    if game_board[user_position] == "-":
      valid = True
    else:
      print("Can't overlap player. Choose agian.")

  game_board[user_position] = user

  print_board_to_screnn()


# Function to determine tie or the winner 
def game_over():
  winner_of_game()
  tie_game()



def winner_of_game():
  # Global Variable
  global winner

  row_player_winner = rows()
  column_player_winner = columns()
  diagonal_player_winner = diagonals()

  if row_player_winner:
    winner = row_player_winner
  elif column_player_winner:
    winner = column_player_winner
  elif diagonal_player_winner:
    winner = diagonal_player_winner
  else:
    winner = None


def rows():
  # Global Varibales 
  global current_game

  row_one = game_board[0] == game_board[1] == game_board[2] != "-"
  row_two = game_board[3] == game_board[4] == game_board[5] != "-"
  row_three = game_board[6] == game_board[7] == game_board[8] != "-"
  # If it deos not match then it will get flagged
  if row_one or row_two or row_three:
    current_game = False

  if row_one:
    return game_board[0] 
  elif row_two:
    return game_board[3] 
  elif row_three:
    return game_board[6] 

  else:
    return None


def columns():
  # Global Variables 
  global current_game

  column_one = game_board[0] == game_board[3] == game_board[6] != "-"
  column_two = game_board[1] == game_board[4] == game_board[7] != "-"
  column_three = game_board[2] == game_board[5] == game_board[8] != "-"

  if column_one or column_two or column_three:
    current_game = False

  if column_one:
    return game_board[0] 
  elif column_two:
    return game_board[1] 
  elif column_three:
    return game_board[2] 

  else:
    return None


def diagonals():
  # Global varsariables
  global current_game

  diagonal_one = game_board[0] == game_board[4] == game_board[8] != "-"
  diagonal_two = game_board[2] == game_board[4] == game_board[6] != "-"

  if diagonal_one or diagonal_two:
    current_game = False

  if diagonal_one:
    return game_board[0] 
  elif diagonal_two:
    return game_board[2]

  else:
    return None



def tie_game():
  # Global Variables 
  global current_game

  if "-" not in game_board:
    current_game = False
    return True

  else:
    return False

def switch_player ():
  # Global Variables
  global player_right_now
  # Once X goes, then you switch to O 
  if player_right_now == "X":
    player_right_now = "O"
  # Once O goes, then you switch to X
  elif player_right_now == "O":
    player_right_now = "X"

tic_tac_toe_game()
