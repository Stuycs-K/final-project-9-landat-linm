# Work Log

## Theodore Landa

### May 22

Updated UML and plan

### May 23

I added the pieces class, with fields pieceType and player, and the accessor methods. I also created the game class's toString and the highlight function to process the card inputs.

### May 24

I added display methods for Game and Pieces. I found images on the web for Pieces, cropped them, adjusted them, uploaded them, and implemented them in the display functions for the pieces. I used a hexcolor finder to adjust the in game colors to precisely match the images needed. In the display function for game, I created the game grid/board, and iterated through the board array to display the pieces. I was able to make several bugfixes to game, but unfortunately I ran into a nonullpointer error, and spent 40 minutes fighting it in vain. :(

### May 25

I added the MouseClicked() method, which allows the players to manipulate the board, select cards, pieces, and destinations, and move, take turns, and win. I also made minor edits to the other files, such as making bounds for the board in the isValid() function. Then I made some bugfixes in MouseClicked(), and added whichTile() to the Game class.

### May 26

I added the rest of the game cards to the possible pool of cards for the deck. I tried to get the game constructor to choose cards without choosing the same card twice, using an arraylist implementation, but Mikayla had a better idea to implement (thx Mikayla!!).

### May 27

Thinking about how to implement a bot to take player 2's place (in my notebook and on a whiteboard). Also trying to keep up with Mikayla's aesthetic changes !!

### May 30

Decided to create a bot that first checks win conditions, then checks possible captures of player 1 pieces, and otherwise resorts to a greedy method to move across the board closer to the winning square. Also planned how to integrate this with existing setup, draw, and ifmouseclick methods.

### May 31

I added the oneplayer mode condition to draw(). Then I added another condition to ifMouseClicked(), which allows player 1 to select cards, pieces, and destinations, and move, capture, and win, but calls  the botmove() method when player == 2. I also started work on botmove(): I iterated through the gameboard to find player 2's pieces, then iterated through player 2's cards, and then through the possible moves for those pieces with those cards, and wrote the conditions for when player 2 wins.

### June 1

Continued working on botmove(), but didn't save :skull:.

### June 2

Unfortunately past 7 AM, finished botmove() by finishing the capture conditions by using a similar strategy to may 31, then added the greedy alternative algorithm.

### June 6

Today I changed the highlight method in Onitama.pde to make the highlight more easily visible.

### June 10

Today I worked on fixing the card rotation in the single player mode. The botmove() method had a bug in it, which I fixed, and player 2 was selecting the wrong cards and wasn't flipping properly, so I fixed that as well. Then I found a bug in Onitama.pde.

### June 11

I fixed the bug. Then I wrote the arrows method, which takes an input of the row and column values in the board of the initial position and final position of a piece in the previous move, converts those values to x and y values in processing, and draws an arrow from the initial position to the final position. Then I edited the MouseClicked() and botmove() methods to include the selectedStart and selectedEnd array variables which I was using for arrow(), and called arrow() in the draw() method.

## Mikayla Lin

### May 22

Finished writing the Cards class with a constructor, getValidMoves(), toString(), and isValid().

### May 23

I wrote a canMove method to determine if a certain movement was allowed. I also wrote the move method to actually move pieces within the array representing our board. I also started working on the game class. I added in the variables we needed and started on MouseClicked(). Finally, I made a display function inside Card in order to display a specific card.

### May 24

I fixed a couple of bugs in Game (highlight and the constructor). I also edited my card display function a bit to add 1. The name of the move card 2. Colors! Depending on the status of the card. I started working on the actual UI. I coded drawCards() which displays all the cards in the right position and setup now calls drawCards(), has a background, and for now it has rectangles where displays we haven't finished coding are.

### May 25

Fixed another bug inside the game constructor, and then I made a method to draw a pawn and king so that we could have transparent backgrounds. I also made some minor changes to the colors of certain elements, and some other purely aesthetic changes (like making rectangle corners rounded).

### May 26

Today was a mostly graphics based day. I changed some colorings in the board and fixed some bugs so that our game logic would work out, but after that it was all visual. I finished draw() so that the screen would reflect the moves made by players. I also made a debug method to display information that isn't shown on screen. Then I designed a start, win, and lose screen on canva and imported it here so that things look very fancy and glow-y. The start screen has three buttons, only one of which works right now as we haven't coded the other two. The win/lose has two buttons, rematch and menu, but neither work right now.

### May 27

I changed the background of our game and also made the buttons when the game is over work. I also fixed our win condition so that it would work correctly.

### May 30

Added in a few more images so that when you hover your mouse over the buttons, it changes colors. I started working on a dropdown menu, but for now thats just on Canva, so no code for it yet.

### May 31

Mostly worked on the cards today. I wrote a flip method for the cards so that player 1 and player will have the same moves (from their respective points of view) rather than a flipped version of each other. I also wrote rand5() to produce a list of 5 different values, so that there would be no duplicates in our starting deck. And finally, I added in the rotation of cards. I also added in a dropdown menu during the game that allows you to return to the menu, restart the game, go to the red/blue win screen, skip to a position where you can capture the king, and skip to a position where you can reach the temple.

### June 6

I fixed some bugs in class today. Mostly, with how the one player mode worked with the buttons. I changed some booleans to make the dropdown work in one player mode and also changed rematch a little. Previously, rematch would go immediately to two player, but I changed it so that it went to the last played mode.

### June 8

I edited the capture cheat so that you can test out capturing a pawn as well. After that, I mostly worked on the tutorial. I designed the first six pages on Canvas and added them to the code. Currently the first three are complete and they just describe how to play. I have left right arrows that you can click to cycle through the pages. I'm still working on pages 4-6, which will be a limited version of our actual game. The actual game will be overlayed over the text, so we can have guided gameplay.

### June 10

I finished the tutorial page today. I added in the interactive elements that guides you through how to make a move. I also changed the colors from purple to blue and added in some indicators for where your mouse is. If you hover over a button or one of the arrows, it will change to purple. Finally, I added in a page on the win conditions.
