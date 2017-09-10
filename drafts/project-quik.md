So it all started with a game called Brain Genius by the company Glu. It was one of those mobile flash games that my Mum let me play on her Nokia phone as a child while I waited for her and my friend's Mum to stop talking and finally take me home. It was a fairly typical brain training game with memory exercises and math puzzles. But there was this one puzzle that I always looked forward to when starting a new brain training session. I can't seem to find any resources online to illustrate the basic rules of the game, so I will attempt to draw it to the best of my ability.

# BRAIN GENIUS SPIDER GAME IMAGE

You start with the spider at the top and move your eyes down the line. If you come to a horizontal line you simply move across to the connecting vertical line. Eventually you will come to a number at the bottom, which is then the number that you press on the keypad.

Pretty simple mechanics. Now I started to think to myself, would it be a fun mobile game if I took these mechanics, set up a timer in the background and had the player see how many they can get correct in a row? Well I set out to do just that. I initialised a new [Dart][dartlang_site] app, ran `$ pub get` to fetch an exellent Canvas and WebGL library called [StageXL][stagexl_site] (this was my first mistake, but more on that later) and got to work.

## Preparing for the Unknown

There were 3 configurations that I beleived needed tweaking throughout the testing phase in order to hit that sweet spot. These were:

1. How many columns and rows each level should have.
2. How long the duration of the timer should be.
3. How much time (if any) should be added back to the timer if the player gets one correct.

So in order to change these values with minimum effort, I made the configurations global getters which first looks for the value in the URL query parameters, but then falls back onto default values if the parameter does not exist.

```dart
String getProperty(String key, [String defaultValue]) =>
    Uri.base.queryParameters[key] ?? defaultValue;

// Level properties.
int get columns => int.parse(getProperty('columns', '3'));
int get rows => int.parse(getProperty('rows', '2'));

// Timer properties.
num get totalSeconds => num.parse(getProperty('totalSeconds', '6'));
num get appendingSeconds => num.parse(getProperty('appendingSeconds', '.6'));
```
