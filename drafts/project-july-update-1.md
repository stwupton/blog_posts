I have not spent as much time on the developing the core combat mechanics as I hoped. But, it is gradually getting there, and I am proud and impressed with what I have done so far. I haven't completely finished what I said I was going to be working on in my last post about Project July but I think that I have done enough that's worth an update on.

# Modelling and Animation

In my [previous post][project_july_post], I ended by saying that I will be working on executing a basic melee attack and for that, I would need a character mesh and some animations. Well, with the help of [Sebastian Lague][sebastian_yt_channel] and his [RPG Graphics playlist on YouTube][rpg_yt_playlist], I was able to do just that. It's ugly, animations look like they have been done by an amateur (because they have been) and the skin weights could be better, but it gets the job done. I have the walk, run and idle animation cycles and I'm currently working on the attack animation. 

![Run animation in Blender][blender_run_animation]

I learned a great deal using Blender and following Sebastian's tutorial. After, I was even confident enough to make a katana... without any outside help!

![Katana made in Blender][blender_katana]

# Implementation

I wasted no time in importing my newly created assets into the game; I was so glad to finally be rid of the placeholder capsules. 

![Character movement in-game][movement_example]

As you can probably tell, I didn't really think about the character holding a katana when making its run animation &#x1f602;.

I then spent some time on developing the foundations of the combat mechanics and integrated a basic melee attack. Again, I'm still working on the attack animation, but I did make it so the character navigates to the enemy and deducts some health.

![Melee attack example][attack_example]

It doesn't look like I will be getting the whole combat system finished by July like I planned. I knew it was stretch but at least I have gotten somewhere with it. Hopefully, my next update will be about a beautiful attack animation and the attack boost feature.

[project_july_post]: https://stwupton.com/2018/2/project-july
[sebastian_yt_channel]: https://www.youtube.com/user/Cercopithecan
[rpg_yt_playlist]: https://www.youtube.com/watch?v=NGn_gSfYwVw&list=PLFt_AvWsXl0f4c56CbvYi038zmCmoZ4CQ

[blender_run_animation]: https://res.cloudinary.com/dyzej76ig/image/upload/v1527089719/project-july-update-1/pj_blender_run.gif
[blender_katana]: https://res.cloudinary.com/dyzej76ig/image/upload/v1527089714/project-july-update-1/pj_katana.png
[movement_example]: https://res.cloudinary.com/dyzej76ig/image/upload/v1527089717/project-july-update-1/pj_godot_run.gif
[attack_example]: https://res.cloudinary.com/dyzej76ig/image/upload/v1527089726/project-july-update-1/pj_godot_attack.gif