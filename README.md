# ChordSymbolsStyler
Adjust chord symbol following simple replacements. Needs MuseScore 3.3 or higher to function.

Since the api doesn't allow much for selections, to run these plugins you have to select manually an example object. See usage for more details.

## Usage:
First open the file in any text editor (such as Musescore's plugin manager).

Add or remove replacement rules 

for example to replace all maj7 with a triangle followed by a 7 (t7) add the following rule:

txt = txt.replace("Maj", "t");

Select a Chord Symbol and run the plugin.

![Before](https://github.com/Marr11317/ChordSymbolsStyler/blob/master/ChordSymbolsStart.PNG)
![After](https://github.com/Marr11317/ChordSymbolsStyler/blob/master/ChordSymbolsEnd.PNG)

# [Download For MuseScore 3.3](https://github.com/Marr11317/ChordSymbolsStyler/archive/master.zip)

[Installation guide:](https://musescore.org/en/handbook/plugins#installation) https://musescore.org/en/handbook/plugins#installation
