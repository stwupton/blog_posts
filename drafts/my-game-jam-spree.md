I originally began writing this blog post about the PIZZA JAM game I made in February. But I have done two more since then and I’d thought it’d be nice to touch on them all briefly in one post. 

# Being a Square (PIZZA JAM)

![Being a Square][being_a_square_img]

While browsing the [itch.io game jam calendar][itch_game_jams], an event aptly named “PIZZA JAM” caught my eye. Make a game in 48 hours for a chance to win a pizza… what maniac would not take part?! 

The theme, Movement, was announced on a Friday evening. I spent the night sketching and brainstorming ideas until I came up with an idea for a simple platformer which uses speed and jump boosting platforms, as well as anti-gravity waves, in order to complete a small number of obstacles. I was excited to build the movement mechanics, I had recently watched a YouTube video about how Mario’s jump mechanic works and I was eager to put it into practice. If you don’t know, in a Mario game, the longer you hold down the jump button, the longer he is sustained in the air. Of course, it’s not realistic physics but it perfectly matches the tone of Mario and other platforming games like it.

I spent the first day developing and tweaking the movement, and then that night on the level switching and checkpoint system which took longer than expected. On the last day I made the levels, which was much harder than anticipated. This was my first go at designing levels, and let's just say I have a newfound respect for those who do it. It was difficult coming up with levels which challenged the player while gradually introducing them to the mechanics. As difficult as it was though, playing and watching others play it was incredibly rewarding. 

Download the game [here][being_a_square_download].

I got some really helpful feedback on the submission page and on Facebook, one of which being “the controls feel floaty” 😮. They was probably right, I was tweaking the controls for such a long time that I probably became so used the floaty controls so I didn't see it as a problem. The game also got a featured in a YouTube video which showed gameplay for all the game jam submissions…

<iframe width="560" height="315" src="https://www.youtube.com/embed/8qAf432IaXI?rel=0&amp;start=333" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

She didn't see the game through to the end sadly (probably because of the floaty controls), but I was extremely grateful for the experience of having a game that I have made being featured in a YouTube video.

# Joe Hound (Why Not Game Jam)

![Joe Hound][joe_hound_img]

After having such a fun time with the PIZZA JAM, I was raving to a couple of my friends about how great of an experience it was and how we should do one together. Unfortunately there wasn't a planned game jam on the horizon that fit our busy schedule, so we decided just to do one ourselves. So we set up a discord channel and dubbed it the “Why Not Game Jam”. We used a random theme generator and ran with the first theme that we landed on: “Anachronism”. After googling what that actually meant (_a thing belonging or appropriate to a period other than that in which it exists, especially a thing that is conspicuously old-fashioned_ -  definition from Google) we began brainstorming ideas. We ran with the idea of something being “out of place” and eventually ended up with the idea of an interdimensional being (Joe Hound) with a mustache, running around a city, stealing coffee from people while avoiding being run over by police cars in pursuit. We do come up with some strange stuff when all three of us are together.

The development went okay, I thought. I took on the task of developing the police car AI. I spent the whole first day and night trying to get it to how I pictured it behaving in my head. Frustratingly, I never could and reverted back to the old, dummer AI that I first made. It didn’t reverse when getting stuck, nor patrol the streets when it lost sight of Joe like I imagined, but it done its job. One day, when time is on my side, I will probably have another crack at it. 

Download the game [here][joe_hound_download].

# don’t disappear (40 Hours Game Jam)

![don’t disappear][dont_disappear_img]

On a Saturday at 7AM me and my friend Tom woke up to find out the theme (10 Seconds) and to come up with a simple idea. It had to be simple, as the next day was Mother's day and we both wasn't able to fully commit that day. The idea is a platformer where the player (white stick man) runs in front of a black background, jumping onto platforms while avoiding being submerged by the white areas and racing to get to a safe spot for when all the colours invert every 10 seconds.

The platforming mechanics was simply done. I took what I learned from Being a Square and made the movement less “floaty”. In order to make the colour inversion work I had to make a shader. I have never touched shaders before so this was my first experience making one. It’s probably not the best idea to learn a new technology whilst in the middle of the game jam, but what I wanted to do was so simple that I easily hacked my way through by looking up examples online. Shaders greatly interest me though, so I will be learning much more about them very soon.

For what little time I had on the next day, it was time dedicating to making the platforming levels. This time though, I had a secret weapon that I didn’t know I had when making Being a Square; Tile Maps. Godot’s Tile Maps made it much easier to create and edit levels, so they were done in no time. 

Download the game [here][dont_disappear_download].

All in all, we finished and uploaded the game with a whopping 7 hours left on the clock! On top of that, I think “don’t disappear” was out best game yet… [it ranked in at #4][40_hours_results]! We came in at #2 for the music, which is unfortunate as we didn’t actually make the music ourselves and there didn’t seem to be a way for us to opt-out of that category. But out of 37 entries, coming in at #4 was a huge achievement for us. 

I like to think that it was the experience and learning curve of the previous two jams that contributed to the success of this one, but then again, maybe we just got lucky with a great idea… who knows. But what I do know is that me and my friends found these game jams to be hugely beneficial to our learning and our motivation to continue making games. If you are an aspiring game developer/designer, then participating in game jams is a must. I wish I had participated in them much earlier in my life.

[being_a_square_img]: https://res.cloudinary.com/dyzej76ig/image/upload/v1521733324/project-july/my-game-jam-spree/DrEomc.png
[joe_hound_img]: https://res.cloudinary.com/dyzej76ig/image/upload/v1521733217/project-july/my-game-jam-spree/left_2.png
[dont_disappear_img]: https://res.cloudinary.com/dyzej76ig/image/upload/v1521733156/project-july/my-game-jam-spree/dontdisppear.gif

[being_a_square_download]: https://stwupton.itch.io/being-a-square
[joe_hound_download]: https://stwupton.itch.io/joe-hound
[dont_disappear_download]: https://stwupton.itch.io/dont-disappear

[40_hours_results]: https://itch.io/jam/40-hours/results

[itch_game_jams]: https://itch.io/jams
