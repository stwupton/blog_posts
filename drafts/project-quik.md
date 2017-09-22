So it all started with a game called Brain Genius by the company Glu. It was one of those mobile flash games that my Mum let me play on her Nokia phone as a child while I waited for her and my friend's Mum to stop talking and finally take me home. It was a fairly typical brain training game with memory exercises and math puzzles. But there was this one puzzle that I always looked forward to when starting a new brain training session. I can't seem to find any resources online to illustrate the basic rules of the game, so I will attempt to draw it to the best of my ability.

# BRAIN GENIUS SPIDER GAME IMAGE

You start with the spider at the top and move your eyes down the line. If you come to a horizontal line you simply move across to the connecting vertical line. Eventually you will come to a number at the bottom, which is the number that you press on the keypad.

Pretty simple mechanics. Now I started to think to myself, would it be a fun mobile game if I took these mechanics and had the player see how many they can get correct in a row before a timer runs out? Well I set out to do just that. I initialised a new [Dart][dartlang_site] app, ran `$ pub get` to fetch an exellent Canvas and WebGL library called [StageXL][stagexl_site] and got to work.

## Preparing for the Unknown

There were 3 configurations that I beleived needed tweaking throughout the testing phase in order to hit that sweet spot. These were:

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

Now all I needed to do was to add the paramters to the end of the URL like so: `?columns=5&rows=4&totalSeconds=10` to modify the properties.

## The Result

The game which I set out to make was made, and to my surprise it was done by overcoming a very small amount of hurdles.

## SHOWREEL OF QUIK

Try it out [here][quik_game]. Bear in mind that the target platform is mobile; it will work on desktop but it's much nicer to play on touch screen.

## Learning from My Mistakes
