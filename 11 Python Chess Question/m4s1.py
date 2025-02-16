def main():
    white_input = get_white_input()
    w_piece,w_position = white_input.split()
    print(f"\n You placed {w_piece} at {w_position}. \n")
    black_input = get_black_input(w_position)
    print(f"\n You placed the following black piece/s at: ")
    for pieces, positions in black_input:
        print(f" - {pieces} in {positions}")
    print()
    if w_piece == "pawn":
        possible_moves = get_possible_moves_pawn(white_input)
        check_capture_pawn(white_input, black_input, possible_moves)
    else:
        pos_move_h, pos_move_v = get_possible_moves_rook(white_input)
        check_capture_rook(white_input,black_input,pos_move_h, pos_move_v)

def get_white_input():
    while True:
        white_input = input("Choose your white piece rook or pawn and enter in format: piece_type position (rook a4):  ").lower()
        if is_w_valid(white_input):
            return white_input
        print("Invalid input. Please choose either 'rook' or 'pawn' and a valid position!")
    
def get_black_input(w_position):
    print("Please enter the black piece and position. You can enter atmost 16 positions. When finished, enter done! ")
    black_input = []
    while len(black_input) < 16:
        black_figure = input("Choose your black piece and position:  ").lower()
        if black_figure == "done" and black_input:
            break
        #ensure that user doesn't input duplicate positions and enter in the form piece and position
        parts = black_figure.split()
        if len(parts) == 2:
            piece, position = parts
            if is_b_valid(piece, position, w_position, black_input):
                black_input.append((piece,position))
            else:
                print("Invalid input or position already occupied. Please try again.")
        else:
            print("Invalid input or position already occupied. Please try again.")
    return(black_input)

def is_w_valid(white_input):
    #ensure the user inputs both piece type and position.
    parts = white_input.split()
    if len(parts) == 2:
        piece, position = parts
        #valid input when piece is either pawn or rook and position inside a to h and 1 to 8. 
        if piece in ("rook","pawn") and len(position) == 2 and position[0] in "abcdefgh" and position[1] in "12345678":
            return True

def is_b_valid(piece, black_position, w_position, black_input):
    if black_position not in black_input and black_position != w_position and piece in ("pawn", "knight", "bishop", "rook", "king", "queen") and len(black_position) == 2 and black_position[0] in "abcdefgh" and black_position[1] in "12345678":
        return True

 #possible moves for pawn as it moves diagonally to win the black piece  
def get_possible_moves_pawn(white_input):
    white_piece, white_position = white_input.split()
    possible_move_alpha1 = ord(white_position[0]) + 1
    possible_move_alpha2 = ord(white_position[0]) - 1
    possible_move_num = int(white_position[1])+1
    possible_moves = [chr(possible_move_alpha1) + str(possible_move_num), chr(possible_move_alpha2) + str(possible_move_num)]
    return (possible_moves)

#possible moves for rook list whole row and whole column where white rook is.
def get_possible_moves_rook(white_input):
    white_piece, white_position = white_input.split()
    possible_moves_vertical = [] 
    for i in range(1, 9):
        #appending all the possible positions except the one occupied by white.
        if i != int(white_position[1]):
            possible_moves_vertical.append(white_position[0]+str(i))
        i+=1
    possible_moves_horizontal = []
    for j in "abcdefgh":
        #appending all the possible positions except the one occupied by white.
        if j!= white_position[0]:
            possible_moves_horizontal.append(j+white_position[1])
    return (possible_moves_horizontal, possible_moves_vertical)

def check_capture_pawn(wput,bput,pos_move_p):
    white_piece, white_position = wput.split()
    captured_piece = []
    for piece,position in bput:
        if position in pos_move_p:
            captured_piece.append((piece, position))
    if captured_piece:
        print(f"Your possible black capture piece/s are: ")
        for piece, position in captured_piece:
            print(f" - {piece} in {position}")
    else:
        print("No possible black pieces to capture! \n")

def check_capture_rook(wput, bput, pos_move_h, pos_move_v):
    white_piece, white_position = wput.split()
    captureh = []
    capturev = []
    for piece, position in bput:
        if position in pos_move_h:
            captureh.append((position))
        if position in pos_move_v:
            capturev.append((position))
    final_capture = []
    if len(captureh) >0:
        captureh.append((white_position))
        captureh.sort()
        j = captureh.index(white_position)
        if j == len(captureh)-1:
            final_capture.append(captureh[j-1])
        elif j == 0:
            final_capture.append(captureh[j+1])
        else:
            final_capture.extend([captureh[j+1], captureh[j-1]])
    if len(capturev) >0:
        capturev.append(white_position)
        capturev.sort()
        k = capturev.index(white_position)
        if k == len(capturev)-1:
            final_capture.append(capturev[k-1])
        elif k == 0:
            final_capture.append(capturev[k+1])
        else:
            final_capture.extend([capturev[k+1], capturev[k-1]])
    if len(final_capture) >0:
        print("Your possible black capture piece/s are: ") 
        for each in final_capture:
            for piece, position in bput:
                if each == position: 
                    print(f" - {piece} in {position}")
        print()
    else:
        print("No possible black pieces to capture! \n")
        
    
main()


#Assumptions
#follows a standard chess board with columns represented by alphabets and rows by numbers.
#direction starts from row 1 at the bottom and moves up to row 8 at the top.
#possible captures after only 1 move from white piece is considered
#Users can choose standard black pieces i.e pawn, rook, bishop, knight, king and queen, however the black pieces don't move.
