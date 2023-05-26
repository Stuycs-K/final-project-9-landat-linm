# Work Log

## Theodore Landa

### May 22

Updated UML and plan

### May 23

I added the pieces class, with fields pieceType and player, and the accessor methods. I also created the game class's toString and the highlight function to process the card inputs.

### May 24

I added display methods for Game and Pieces. I found images on the web for Pieces, cropped them, adjusted them, uploaded them, and implemented them in the display functions for the pieces. I used a hexcolor finder to adjust the in game colors to precisely match the images needed. In the display function for game, I created the game grid/board, and iterated through the board array to display the pieces. I was able to make several bugfixes to game, but unfortunately I ran into a nonullpointer error, and spent 40 minutes fighting it in vain. :(


## Mikayla Lin

### May 22

Finished writing the Cards class with a constructor, getValidMoves(), toString(), and isValid().

### May 23

I wrote a canMove method to determine if a certain movement was allowed. I also wrote the move method to actually move pieces within the array representing our board. I also started working on the game class. I added in the variables we needed and started on MouseClicked(). Finally, I made a display function inside Card in order to display a specific card.

### May 24

I fixed a couple of bugs in Game (highlight and the constructor). I also edited my card display function a bit to add 1. The name of the move card 2. Colors! Depending on the status of the card. I started working on the actual UI. I coded drawCards() which displays all the cards in the right position and setup now calls drawCards(), has a background, and for now it has rectangles where displays we haven't finished coding are.

### May 25

Fixed another bug inside the game constructor, and then I made a method to draw a pawn and king so that we could have transparent backgrounds. I also made some minor changes to the colors of certain elements, and some other purely aesthetic changes (like making rectangle corners rounded).
