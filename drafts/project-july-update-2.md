I could laugh off my habit of procrastination as me being lazy, but deep down I know it’s a bit more complex than that. The number of times I had opened up Blender, fiddled around with the attack animation and closed the window remaining unsatisfied with the result, left me dreading opening Blender again in the following weeks. Eventually, yesterday, I said to myself; “wait a minute, this is a prototype, you’re not a 3D animator and you’re dragging this on for way too long. Stop being such a perfectionist and get the feature done!” 

Within the hour of me saying that, the feature was complete. If only I had recognised that I was putting off the work, sat down and thought through ways to overcome it, I would have posted an update much sooner. 

So if you find yourself putting off work and procrastinating, think carefully about what could be causing you to do so. Very rarely will it be the case that you are just lazy. Maybe doing a certain task will change a certain aspect of your life and that makes you fearful (we are all scared of change). Maybe you are a perfectionist like me, and the very thought about doing the task stresses you out as you know that you will worry over the smallest of details. Once you have the reason, you can begin to view the task in a new frame of mind and start working to resolve it.

It’s something that sounds like common sense, I know. But sometimes, you find yourself just needing to be reminded. I hope that someone who may be reading this finds this reflection of mine helpful.

Anyway, let’s move on with the update.

# What have I done?

The first thing I needed to get done was the attack animation. Like I said, I spent weeks stopping myself from getting this finished due to how much of a perfectionist I am. I finally finished it because I realised that what I have is good enough for this prototype.

![Character attack animation][blender_attack_animation]

Getting the attack feature complete was now a breeze. I created a new `ActionSpec` node to attach to combatants in order to define the low, medium and high attack boost ranges. It also contained the frame time in which the attack’s effect should be applied to the target.

![ActionSpec Godot node][actionspec_godot_node]

So now,  when the player clicks the left mouse button in a certain time window of the attack animation, the damage is multiplied like so;

Boost | Multiplier
--- | ---
None | x1
Low | x1.2
Medium | x1.4
High | x1.7

I needed a way for the player to know what critical hit was achieved, so I changed the colour of the damage value based on which multiplier was applied.

![Attack values colours][attack_value_colours]

That’s all there was to the attack feature. I’m pleased with the results... just not happy that it took so long. Next, I will be working on enemy AI and have them choose an enemy to attack. 

# The Future of Project July

Project July will be a much more long-term project that I initially thought, and it will likely just be me working on the core mechanics whenever I have the spare time, for quite a while. On the other hand, though, I have started work on a smaller mobile RPG in Unity that will hopefully be much more lucrative in the short-term. I will probably write a post about that project very soon.

I would just like to end by saying that, when starting this blog I thought I could turn into this writing powerhouse, and that I could probably get two or three posts out a month at least. That hasn’t happened. Writing has not become a habit, but I’m now getting serious about making it one. On top of that, I’m looking to expand my content creation across different online platforms so that I can create and grow a personal brand while I’m on this game-creating journey.

Until next time (definitely within a month).

[blender_attack_animation]: https://res.cloudinary.com/dyzej76ig/image/upload/v1532616927/project-july-update-2/pj_attack.gif
[actionspec_godot_node]: https://res.cloudinary.com/dyzej76ig/image/upload/v1532616947/project-july-update-2/pj_actionspec_node.png
[attack_value_colours]: https://res.cloudinary.com/dyzej76ig/image/upload/v1532616938/project-july-update-2/pj_atk_values.png