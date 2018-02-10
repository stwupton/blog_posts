In my [last post][last_post_link] I concluded that the project I decided to work on was too small in scope and too small in ambition. So much so that I was not in any way enthusiastic about showing it off to the wider world. I’m happy to announce that I am now doing the opposite; I have started a project that is way beyond the scope of just one developer and I think that it’s a good thing. Let me explain…

A good friend of mine, Tom Gill, once said: “aim for the ceiling and you will at least reach the window seal. But aim for the stars and you will surely find yourself above the clouds.” So, if I aim for completing a project that seems well beyond my knowledge and skill level, then I will surely develop my skills much further than if I was to aim for something that seems within reach. Though, with this mindset, I believe that expecting failures (and learning from them) is extremely important.

What then, is Project July? If you know me then you most likely know that story-driven games are my favourite type of game. Therefore, it only makes for me to make a grand, story-driven JRPG with turn-based combat mechanics &#x1f913;. Like I said, I am expecting plenty of hurdles and failures, but I am extremely excited for what I’m going to learn along the way. The story is written down and I’m always churning new ideas and plot points in the back of my mind, but for now, story is not important. I have watched enough [Extra Credits][extra_credits_channel] and [GDC talks][gdc_talks_channel] on Youtube to know that it’s probably best to always start by prototyping the core mechanics of the game, and the core mechanics of this game is the combat.

## Designing the Combat Mechanics

The combat mechanics I have in mind have some elements that are inspired by other great turn-based RPGs:

The first element is the ability to move around the battle arena to strategically position yourself for future turns ahead. Get behind an enemy for a stronger attack, keep close to an ally who has healing magic or move behind a pillar to remain out of a turret’s fire. There are many more possibilities with this mechanic and I’m sure they will reveal themselves later down the line.

The second is being able to trade places in battle with an party member that’s on the bench. Only three party members will be allowed in the arena at one time, so the player will need to swap places with another party member when necessary. Say one member specialises in dealing with flying monsters, then the player would switch to that party member in order to get the job done. I really admire this feature Final Fantasy X. It gave each party member a purpose and left no one on the bench, gradually becoming more and more useless the further into the game you played.

Finally, conditional quick time events. For example, when a player does a basic melee attack, a cue will show for them to react to a quick time event in order to boost the damage outcome. Also, the player could get a cue to dodge or block an incoming attack. This added skill challenge should give the players a sense of having more control over the actions they choose. I suspect that (some?) enemies will also be given this privilege.

So, I sat down and and drafted a flow diagram to show the core combat loop from the player’s perspective...

![Full game loop][full_game_loop]

...and I instantly see something troubling:

![Problem block][problem_block]

There is so much that the player has to decide on in this part that they may become overwhelmed; breaking the flow of the game. Pausing and thinking about your next move is not something fans of turn-based RPGs are unfamiliar with, but it’s the addition of movement that causes complications. Currently, not only will each part member have a limited distance that they can move to, but the attack range is also limited and that range also varies depending on what weapon or what ability is being used. That sentence alone was confusing enough... now imagine playing it. This will have to be something I test with others and work on an elegant solution for it does come to be too complex. Of course removing the movement feature altogether is still an option… but that would make me sad &#x2639;.

## Current Progress

I have only been working on it for a week but so far it’s going quite smoothly. I’m using the basic 3D geometry that the [Godot Engine][godot_link] provides as placeholder assets for now, but the player movement and target lock on is working! I really can’t tell you how happy I was seeing the lock on icon work. Thirteen year old me would be very proud.

![Lock on preview][lock_on]

I did run into an interesting problem when making the movement area: how was I going to restrict player to the area? I first tried to stop the player from moving any further outwards once reaching the edge, but this results in the player coming to a full stop; no longer able to side along the edge. I needed an invisible collision “wall” that moved around the area to continuously block the player from leaving. So using the `atan2` mathematical function to calculate the angle between the player’s starting position and current position. Using that angle, I could then rotate the collision wall accordingly. Here’s a GIF with the collision wall visible.

![Wall rotate][wall_rotate]

I confess that I did amuse myself for a while trying to escape the area but math always won.

Next I will be working on executing a basic attack, then the attack’s quick time event (I don’t like the term “quick time event”. I have a negative association with it because of AAA games using them poorly during cutscenes. I think I will call them “action boosters” from now on). This may require me to create a basic character mesh and some animations for a run cycle and attack. I wonder how that will turn out.

[last_post_link]: https://stwupton.com/2018/1/project-quik
[extra_credits_channel]: https://www.youtube.com/user/ExtraCreditz
[gdc_talks_channel]: https://www.youtube.com/channel/UC0JB7TSe49lg56u6qH8y_MQ
[godot_link]: https://godotengine.org/

[lock_on]: https://res.cloudinary.com/dyzej76ig/image/upload/v1518289022/project-july/gd_lock_on.gif
[wall_rotate]: https://res.cloudinary.com/dyzej76ig/image/upload/v1518289010/project-july/gd_block.gif
[full_game_loop]: https://res.cloudinary.com/dyzej76ig/image/upload/v1518288836/project-july/full_loop.png
[problem_block]: https://res.cloudinary.com/dyzej76ig/image/upload/v1518288910/project-july/problem_block.png
