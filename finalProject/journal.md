# Final Project - Basketball Simulation - Journal

[Day 1](#day-1-(4/20)); [Day 2](#day-2-(4/23)); [Day 3](journal.md#day-3-(4/24)); [Day 4](journal.md#day-4-(4/29)); [Day 5](journal.md#day-5-(5/1)); [Day 6](journal.md#day-6-(5/2))

## Plans before start coding / concept
Since I play basketball a lot, I thought of making a basketball game simulation. The simulation will be in bird view where 5 people on each team have different team colors. The team that has the ball will be set into a flow field of going towards the rim on the other side of the court, while trying to avoid the other team players. On the other hand, the defending team will be attracted to the closest opponent player and follow that player. But all of the five defending player will be attracted the most to the player that currently has the ball (I probably change it to how players are strongly attracted to the ball directly). When the defender and the attacker with the ball collides, the defender steals the ball and will attack towards the other side of the court with the same rules applied.

So in other words, it will be like a total simulation of a basketball game between two teams.

### Day 1 (4/20)
Before making anytypes of vehicles (like players), I decided to make the flowfield first. I had no idea how I am supposed to make a flow field all point towards a certain point, so decided to first make a flow field for the left team. The function for this flowfield was to help the left team players move towards the other side of the court, but I gave random angles of the vector between -PI/4, PI/4 so that the flowfield will eventually send the players to the right, but will give a shaky movement. I wanted to put this effect because, first of all it would be too boring if the players went straight towards the rim, and second, the shaky effect will look like as if the players are dribbling the ball from left to right and right to left. I made a similar flowfield for the right team as well.

![](media/twoFlowFields.png)

The next thing i did was to make a two different PVectors as lookups so that the vehicles(players) made later will be able to follow their corrresponding flowfields. 

Except for the fact that I had trouble thinking of making more than one flowfields, I was pretty okay with my project so far.

### Day 2 (4/23)
After making the flow field, I moved on to make the vehicles. I remember professor giving me an advice to make just two vehicles, one for each team at first, and build more after everything works fine.

So I started of with making the left team. I wanted to place the players on the right position so I decided to get two floats, for the location of the vehicle's initial location. Then I made two functions that returns the location of the vehicle's x and y position. I also updated the the players, and also made the players follow the flowfield in the follow() function. Lastly, I made a display function. I copied the whole code and pasted it on to the class for right team as well.

Finishing the codes, I needed to check if they actually work. So before putting a background, I made my two flowfields visible with the display function and set the initial location of two players in the middle of the canvas on each sides. And because I will make more players, I've created two arraylists one for the players on the right team and another for the left team. Since I don't have to change the flowfield, I decided to create the two flowfields on setup, and in the draw function, I made a for loop for both left and right teams, made the vehicles follow the flowfield that was made in the setup, update it, and display it. They worked fine, but i showed all of the tracks of the players, which meant I needed a background that will be uploaded constantly to make the vehicles look like as if it is moving with out their tracks.

So I downloaded a basketball court illustration and called it inside the draw function. It looked way cleaner than before.

Most of the work today was already done in previous assignments, so although I had some errors, it was easy for me to just compare it with one of my previous works and find out what the problem was.

### Day 3 (4/24)
Now what I needed was a ball. I made another class named 'Ball' to create the ball. I first had to think of what functions the ball should have. I needed two functions (each one for each team) for checking whether if the ball has touched a player or not. In order to check it a ball collides/touches another obstacle, I had to get it's location as well, so I made functions that return its x and y location.

After making the basic code of the ball's location, velovity and acceleration, I copied the function of getting the location from the 'leftTeam' class.
The problem was with checking if the ball touched the player. I made two booleans each for checking whether the ball touches a left team or a right team player. Then made a function of touchRT() (to check if the ball touches the right team) and used the for loop to check all players from the right team. Next, I got the absolute difference between the x location of the ball and the player and set it less than 40. I set it as less than 40 because 40 was the distance that seemed to be the most accurate for the player to touch the ball. I also had to check the difference in y position of the ball and the player so I did that as well. If these two statements where true, I changed the boolean 'ifTouchRT to true. And as always, I copied the code and just changed the boolean and the right team to left team.

Then in the update, I updated the velocity, location and acceleration, and also checked both functions 'touchRT()', and 'touchLT()'. If any of the functions returns true, it meant that the ball had touched either team's player. When it returns true, I coded it to make the ball follow the according player's location, so it can look like as it the player is carrying the ball.

Lastly, I displayed the ball with adding another jpg of a basketball illustration.
Since I decided to make only one ball, I added the ball vehicle to the arraylist in the setup where the location is exactly in the middle of the canvas. Then in the draw function, I displayed the ball, and updated it.

However, for some reason this code did not help me to indicate if whether the player touched the ball or not when I played it. It made this error where if the player goes just a little up or down from the initial position, the ball will just follow the player. I went back to my code and noticed that my code was like this :
```
      if (abs(location.x - lt.getLocationX()) <= 40 || abs(location.y - lt.getLocationY()) <= 40) 
```
Because of the or statement, the ball had just followed the player who was less than 40 distance away in the y position. I fixed it to && and then it worked fine. I was too tired to work on more codes so I called it a day.

### Day 4 (4/29)
The next thing I had to do was to make the team without the ball try to steal the opponent's ball. This is where I kind of felt that my project might just be too hard for me.

First I needed to check whether the team is defendind or attacking. I set this the team to be defending by checking if their own team is not touching the ball while the opponent is touching the ball. At first I thought of just checking whether the team is touching the ball or not, but then I noticed that both teams do not touch the ball at the beggining of the simulation (where they run across the court to grab the ball). So I included some codes on to the update() function to check if the team is defending or not with the code below and changed the boolean of 'ifDefend'
```
for (Ball b : ball) {
      if (b.touchRT() && !b.touchLT()) {
        ifDefend = true;
      } else {
        ifDefend = false;
      }
    }
```

The next thing I did was to change the follow() function.
So when the ifDefend boolean is not true, which means that the team is not in the position of defending, it will follow the according flowfield to attack towards the rim.
On the other hand, if the team was in the defending position, I made it follow the ball directly instead of the flowfield.
Below is the updated version of follow() function.
```
void follow(FlowField flow) {
    if (!ifDefend) {
      //println("blue follows flowfield");
      PVector desired1 = flow.lookupL(location);
      desired1.mult(2);

      PVector steer1 = PVector.sub(desired1, velocity);
      steer1.limit(3);
      applyForce(steer1);
    }

    //towards the ball -> but then this happens when they are defending
    if (ifDefend) {
      //println("blue follows ball");
      float help = 1000;
      PVector sum = new PVector(0, 0);

      for (Ball b : ball) {
        float distance = abs(PVector.dist(b.location, location));

        if ((distance > 0) && (distance < help)) {
          PVector difference = PVector.sub(b.location, location);
          difference.normalize();
          sum.add(difference);
          sum.setMag(maxspeed);

          PVector steer2 = PVector.sub(sum, velocity);
          steer2.limit(maxforce);
          applyForce(steer2);
        }
      }
    }
  }
```
I also had to reset the player's velocity as well as its acceleration whenever the player changes from a defender to an attacker. This is because when it changes from following the flowfield to a ball or vice versa, it should reset the values to follow only the flowfield or the ball.

I wrote the same code, just chaged the team from left to right on the RightTeam class.

After running the program, I have checked that the players move towards/chase the ball when it is in a defending position, I needed to make the defending player able to steal the ball from the other team.



steal ball
make towards rim

### Day 5 (5/1)
next game

### Day 6 (5/2)
score board
