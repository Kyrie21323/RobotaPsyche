# Final Project Proposal
## Basketball Simulation
Since I play basketball a lot, I thought of making a basketball game simulation. The simulation will be in bird view where 5 people on each team have different team colors. The team that has the ball will be set into a flow field of going towards the rim on the other side of the court, while trying to avoid the other team players. On the other hand, the defending team will be attracted to the closest opponent player and follow that player. But all of the five defending player will be attracted the most to the player that currently has the ball (I probably change it to how players are strongly attracted to the ball directly). When the defender and the attacker with the ball collides, the defender steals the ball and will attack towards the other side of the court with the same rules applied.

## Problems
After starting to code, although I did expect the work to be hard, but it was harder than i expected.
These are some of the problems that I had.

### 1) The number of FlowFields / making flowfields
First i thought that I won't be able to have a single flowfield that players from each team will follow. This is because a single flowfield will not be able to make two different teams go towards the rim on the other side of the court. So first, I came up with making two different flowfields, one for the left team and one for the right. The left team's flowfield will basically have vectors heading towards to the right side, and for the right team, vice versa. But I wanted to give a wobbly flowfield so that it shows how the basketball players kind of dribble from left to right while heading towards the rim. So i decided to get random values of angle between PI*3/4, PI*5/4 for the right team, and -PI/4, PI/4 for the left team. Here i noticed that I had to make two functions for lookup so that it makes the vehicles(players) to follow the according flowfield. I just had a hard time figuring out whether I can fit just one flowfield to make players from both teams move in the direction I wanted to, but it turns out that it is easier to just make seperate flowfields.

### 2) Checking individual vehicles (basketball players) that are in an array list
I wanted all ten of the players to acts as seperate players, but I noticed that this was beyonf my limit of coding, because I could find how to each each and every one of the object in an array list. I've tried using the for loop to check all of the players, but what it did was just check them all at once, and the codes would affect only the first object(player). For example, I wanted to simulate when a player3 from the red team steals the ball from player 2 from the blue team, the player 3 from the red team should be holding the basketball. But instead, it was player 1 from the red team who automatically holds the ball because it is the first object in the arraylist. I kind of gave up on this part, and that is why my finalized version of this simulation hold only one player on each teams.

### 3) Distance error
I think i have coded correctly (i believe) to steal a a ball from one team. The right team was able to successfully steal the ball from the left team whenever the red team player collided with the blue team player who holds the ball. However, although it was coded exactly the same for both players, some how the blue team just couldn't steal the ball from the red team. It correctly prints out that the steal was succesfull, but from some reason the ball decides to stick with the red team. I came to a conclusion that the red team is just way better than the blue team.

## Results
[This is a video of how the simulation is played.](https://youtu.be/uhQkmItaR0g)

## As I finish this semester
It was another great semester to have a class with Prof. Michael and eventough i haven't met him in person, i culd just tell how great he is not only as a professor but also as in person! I learned a lot of new aspect on robots, that they are not just tools, but some day in the future that they could be considered as a race or something else.

[Thank you all for a wonderful semester!](https://youtu.be/BJxbZxNtT5s)
