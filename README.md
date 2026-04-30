# GDIM 33 In-Class Activities
## W1
### Activity 1
<img width="2142" height="1198" alt="c0d990d4-9914-4d6b-9359-085f1fd73009" src="https://github.com/user-attachments/assets/00a081af-ca9c-4d96-8d2b-01b9ba43f158" />
1. So, Everything I got is sort of related to a game that gives strong feedback(visually)to the player, scenes like falling, going through a black hole, or cutting stuff, so I am really thinking about having these elements combined and making a rhythm game that gives the player a sense of achievement, so I might just have a 3d scene with player FALLING and CUTTING/SHOOTING BOXES/MONSTERS as MUSIC goes.
2. One of my groupmates is also thinking about a 3d game with Main Player, Dialogue, and Interaction with NPCs; however, he used the word STATIONARY, which opposes my idea for my game. I personally like actions, high tension, and strong feedback; his style is much slower and calmer than mine.
3. Our LA Josh loves competitive games(OW, League, APEX, RainbowSix Seige...)Which is quite similar to my tastes(I play these competitive games as well), and they are full of action and allow players to earn a sense of achievement through hard grinding.


### Activity 2
<img width="1474" height="1106" alt="3a363354-0926-478f-aa87-2463e4e60dcc" src="https://github.com/user-attachments/assets/4fd457cd-4817-49c5-8b51-1d5e8208b880" />



## W2
###Activity 1
<img width="1842" height="1114" alt="fa93cb6a-8f97-49e7-8a8a-ccfbe8758762" src="https://github.com/user-attachments/assets/80158077-79ea-4f08-aa11-aa9c40b25cde" />

###Activity 2
1. Using a Scene variable keeps the event name consistent across graphs and avoids typos. It also makes it easier to change the event name later.
2. Debug.Log helped me check whether each step was working, such as whether the walrus click was detected and whether the state transition was triggered. It made debugging much easier.
3. Yeah, because gameplay and UI require different input styles. Locking the cursor is useful during gameplay, while unlocking it is needed for UI interaction.
4. Yes, because my game has different phases that require different behaviors. Using states helps manage these transitions more clearly.


## W4

###Activity 1
1. What is playable in your build right now?
     You can press 6 buttons to hit, and when you tap one, it changes color to indicate a hit.
2. Playtesting goal(s).
    I don't have much for playtest because I was working on the framework and didn't do much on gameplay(the framework was bigger than I expected), I am just gonna see if my buttons works :)
3. Play Testers
   Names: Leo Sydney Abe, Han Yang
4. Playtest Notes
   Leo: The buttons were gooooooooooood, but it's better to have some gameplay.
   Han Yang: Love the buttons, yeah, but probably grind more this week.
   
###Activity 2
1.Yes. After the programmer builds the system, a writer can add new DialogueNodeW4 ScriptableObjects, write dialogue lines, and connect replies without coding.
2.There is no strict limit. A writer can keep making nodes, but the practical limits are organization, time, and project size.
3.The Regenerate Nodes button refreshes the Visual Scripting library so new scripts, methods, and custom classes appear as nodes.


## W5

###Activity 1
Feature Goal:
I want to add a player hit animation system using Unity’s Animator. When the player presses the hit key, the character will play a different attack animation instead of staying idle. 
This makes the rhythm action feel more responsive and gives the player visual feedback.

Big Step 1: Set up the simplest Animator
Add an Animator component to the player.
Create an Animator Controller and assign it to the player.
Add one idle animation as the default state.
Test: Run the game and check if the player plays idle animation.

Big Step 2: Add one hit animation
Import one hit/attack animation from the asset pack.
Add it into the Animator Controller.
Create a Trigger parameter called Hit.
Add transition: Idle -> Hit, using the Hit trigger.
Add transition: Hit -> Idle, with Has Exit Time on.
Test: Manually press the trigger in Animator or call it from code and check if the animation plays.

Big Step 3: Connect animation to rhythm input
In the player input script, detect the hit key.
When the player presses the hit key, call:
animator.SetTrigger("Hit");
Test in Play Mode by pressing the hit key.
Later, connect different hit animations to different lanes or note types.

###Activity 2
I worked on adding a player hit animation system with Unity Animator. I imported my animation asset pack, added an Animator Controller to the player, 
and set up an idle animation plus a hit animation. Then I connected the hit animation to player input, so when the player presses the hit key, the character plays a hit animation. 
This gives the player clearer visual feedback and makes the rhythm gameplay feel more responsive.