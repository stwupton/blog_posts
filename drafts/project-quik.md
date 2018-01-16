So it all started with a game called Brain Genius by the company Glu. It was one of those mobile flash games that my Mum let me play on her Nokia phone as a child while I waited for her and my friend's Mum to stop talking and finally take me home. It was a fairly typical brain training game with memory exercises and math puzzles. But there was this one puzzle that I always looked forward to when starting a new brain training session. I can't seem to find any resources online to illustrate the basic rules of the game, so I will attempt to draw it to the best of my ability.

![My awfull sketch][sketch]

You start with the spider at the top and move your eyes down the line. If you come to a horizontal line you simply move across to the connecting vertical line. Eventually you will come to a number at the bottom, which is the number that you press on the keypad.

Pretty simple mechanics. Now I started to think to myself, would it be a fun mobile game if I took these mechanics and had the player see how many they can get correct in a row before a timer runs out? Well I set out to do just that. I initialised a new [Dart][dartlang_site] app, ran `$ pub get` to fetch an excellent Canvas and WebGL library called [StageXL][stagexl_site] and got to work.

## Preparing for the Unknown

There were 3 configurations that I believed needed tweaking throughout the testing phase in order to hit that “sweet spot”. These were:

1. How many columns and rows each level should have.
2. How long the duration of the timer should be.
3. How much time (if any) should be added back to the timer if the player gets one correct.

So in order to change these values with minimum effort, I made the configurations global getters which first looks for the value in the URL query parameters, but then falls back onto a default value if the parameter does not exist.

```dart
String getProperty(String key) => Uri.base.queryParameters[key];

// Level properties.
int get columns => int.parse(getProperty('columns') ?? '3');
int get rows => int.parse(getProperty('rows') ?? '2');

// Timer properties.
num get totalSeconds => num.parse(getProperty('totalSeconds') ?? '6');
num get appendingSeconds => num.parse(getProperty('appendingSeconds') ?? '.6');
```

Now all I needed to do was to add the parameters to the end of the URL like so: `?columns=5&rows=4&totalSeconds=10` to modify the properties.

## The Result

There’s not much to say here. The game which I set out to make was made and it was done by overcoming a very small amount of hurdles.

![QUIK Screenshots][screenshots]

Try it out [here][quik_game]. Bear in mind that the target platform is mobile; it will work on desktop but it's much nicer to play on touch screen. Also, if you are interested, I have made the source code available on [Github][quik_source].

## Learning from My Mistakes

### Mistake #1

I believe feedback from people playing your prototype is very important and it was my intention to get feedback on this game. But do you know anyone who plays casual games in their smartphone’s browser? I don't, and I could not find any online portals that host such games either. So that was another one of my mistakes: building for a platform that has no audience. A game like this would have sat much more nicely in Google Play or the App Store. I did however, hand the game out to friends and family to see how they reacted. Their reaction was mostly positive and why wouldn’t it be? They’re my friends and family. It was interesting to see that some enjoyed figuring out the rules of the game while others got frustrated. But the best feedback I got from them was that nobody asked to continue playing.

By the way, I know some of you may be thinking to yourself; “why didn't he just use something like Phonegap and turn his browser game into a native-like application?” Well I thought of that too, but then I realised that I didn't want to. I wasn't willing to make the effort by downloading the Android SDK and learning how to use Phonegap because… well that leads me to my next mistake.

### Mistake #2

I didn't actually want to make this game. It was fun to develop, but in the end it's not the kind of game that I want to create for people; or probably more importantly: myself. I think I was too focused on “keeping the scope small” that I settled for an idea that I knew could be easily done rather than tackling an idea that excites me but at a smaller scale.

## Conclusion

Making this game was great fun, it just wasn’t fun to play it. I could not recognise myself getting better and faster at the game the more that I did play it, and I doubt others would either. Oh well, lesson learned. Next time, I will make sure that the project that I am going to start is something that I can’t wait to get in players’ hands… even if that means stretching out the scope of the development to a somewhat intimidating scale.

[dartlang_site]: https://dartlang.org
[stagexl_site]: http://www.stagexl.org/

[quik_game]: https://stwupton.github.io/quik/
[quik_source]: https://github.com/stwupton/quik

[sketch]: http://res.cloudinary.com/dyzej76ig/image/upload/v1516132682/project-quik/sketch.png
[screenshots]: http://res.cloudinary.com/dyzej76ig/image/upload/v1516131128/project-quik/quik_screengrab.png
