I could laugh off my habit of procrastination as me being lazy, but deep down I know it’s a bit more complex than that. The number of times I had opened Blender, fiddled around with the attack animation and closed the window remaining unsatisfied with the result, left me dreading opening it again in the following weeks. Eventually (yesterday), I said to myself; “wait a minute, this is a prototype, you’re not a 3D animator and you’re dragging this on for way too long. Stop being such a perfectionist and get the feature done!” 

The feature was complete within the hour of me saying that. If only I had recognised that I was putting off the work, sat down and thought through ways to overcome it, I would have posted an update much sooner. 

So if you find yourself putting off work and procrastinating, think carefully about what could be causing you to do so. It's probably not because you are "just lazy". Maybe doing a certain task will change a certain aspect of your life and that scares you (we are all scared of change). Maybe you are a perfectionist like me and the very thought about doing the task stresses you out as you know that you will worry over the smallest details that probably don't even matter. Once you have the reason, you can begin to see the task in a new frame of mind and start working to resolve it.

I hope that someone who may be reading this post finds this reflection of mine helpful.

Anyway, let’s move on with the update.

# What have I done?

The first thing I needed to get done was the attack animation. Like I said, I spent weeks stopping myself from getting this finished due to how much of a perfectionist I am. I finally finished it because I realised that what I have is good enough for this prototype.

![Character attack animation][blender_attack_animation]

Getting the attack feature complete was now a breeze. I created a new `ActionSpec` node to attach to combatants in order to define the low, medium and high attack boost ranges. It also contained the frame time in which the attack’s effect should be applied to the target.

![ActionSpec Godot node][actionspec_godot_node]

So now when the player clicks the left mouse button in a certain time window of the attack animation, the damage is multiplied like so;

<table border style="width: 100%; border-collapse: collapse;">
  <tr>
    <th>Boost</th>
    <th>Multiplier</th>
  </tr>
  <tr>
    <td>None</td>
    <td>x1</td>
  </tr>
  <tr>
    <td>Low</td>
    <td>x1.2</td>
  </tr>
  <tr>
    <td>Medium</td>
    <td>x1.4</td>
  </tr>
  <tr>
    <td>High</td>
    <td>x1.7</td>
  </tr>
</table>

I needed a way for the player to know what critical hit was achieved so I changed the colour of the damage value based on which multiplier was applied.

![Attack values colours][attack_value_colours]

That’s all there was to the attack feature. I’m pleased with the results... just not happy about how long it took to complete. Next, I will be working on enemy AI and having them choose a combatant to attack. 

# The Future of Project July

Project July will be a much more of a long-term project than I initially thought and it will likely just be me working on the core mechanics whenever I have the spare time for quite a while. On the other hand, though, I have started work on a smaller, mobile game in Unity that will hopefully be a much more lucrative project in the short-term. I will probably write a post about that project very soon.

# The Future of This Blog

When starting this blog I thought I would turn into a writing powerhouse that could get two or three posts out a month at least. That hasn’t happened. Writing has not become a habit, but I’m now getting serious about turning it into one. I’m also looking to create more content on different online platforms so that I can create and grow a personal brand while I’m on this game-creating journey.

Until next time. Hopefully within a months time.

[blender_attack_animation]: https://res.cloudinary.com/dyzej76ig/image/upload/v1532616927/project-july-update-2/pj_attack.gif
[actionspec_godot_node]: https://res.cloudinary.com/dyzej76ig/image/upload/v1532616947/project-july-update-2/pj_actionspec_node.png
[attack_value_colours]: https://res.cloudinary.com/dyzej76ig/image/upload/v1532616938/project-july-update-2/pj_atk_values.png