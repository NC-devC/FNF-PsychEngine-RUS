# Friday Night Funkin' - Psych Engine руссификатор

В настоящее время ведётся перевод версии 0.6.3.

Команда:
NC - кодер, переводчик и тд
Ender69 - кодер
Smixels2 - артист

Специальные возможности мода:

Шрифты теперь доступны и на русском языке.

Возможность добавить перевод диалога:

Пример английского диалога:
senpaiDialogue.txt
Пример русского диалога:
senpaiDialogue-ru.txt
Эта механника в разработке.

Билд на GitHub:

1.Создайте репозиторий и перенесите всё с нашего репозитория, или же сделайте это по нашему template.
2.Нажмите на Actions
3.Выберите ForceBuild
4.Запустите ForceBuild

Для работы на вашем ПК и билду на GitHub:

Вам потребуется Git или GitHub Desktop.

Git:

Для коммита:

git add .
git commit -m "Название коммита"
git push "ссылка на репозиторий"

или через Github Desktor

Билд на вашем ПК:

ВНИМАНИЕ:

Если пакет hmm не работает, то рекомендуем скачивать пакеты по файлу в .github/workflows/autobuild.yml:

haxelib setup C:/haxelib
haxelib install hxcpp > /dev/null --quiet
haxelib install actuate 1.9.0
haxelib install box2d 1.2.3 
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
haxelib git faxe https://github.com/ashea-code/faxe
haxelib install flixel 4.11.0
haxelib git flixel-demos https://github.com/HaxeFlixel/flixel-demos
haxelib install flixel-addons 2.11.0
haxelib git flixel-ui https://github.com/HaxeFlixel/flixel-ui
haxelib install flixel-templates 2.6.6
haxelib install flixel-tools 1.5.1
haxelib install hscript 2.5.0
haxelib install hxCodec 2.6.1
haxelib install hxcpp 4.2.1
haxelib install hscript 2.5.0
haxelib install layout 1.2.1 
haxelib install lime 8.0.0
haxelib install lime-samples 7.0.0
haxelib install newgrounds 2.0.1
haxelib install openfl 9.2.0
haxelib install openfl-samples 8.7.0
haxelib run lime setup
haxelib git tentools https://github.com/TentaRJ/tentools.git
haxelib git systools https://github.com/haya3218/systools
haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit
haxelib git polymod https://github.com/larsiusprime/polymod.git

Взависимости от вашей платформы:

Windows:
haxelib run lime rebuild systools windows

Linux:
haxelib run lime rebuild systools linux

Mac OS:
haxelib run lime rebuild systools mac

Билд:
lime build windows

Тест:
lime test windows

Но, если вам лень устанавливать что либо, то просто отправляйте изменения на гитхаб и наш мод скомпилирует всё за вас.



# Friday Night Funkin' - Psych Engine
Engine originally used on [Mind Games Mod](https://gamebanana.com/mods/301107), intended to be a fix for the vanilla version's many issues while keeping the casual play aspect of it. Also aiming to be an easier alternative to newbie coders.

## Installation:
You must have [the most up-to-date version of Haxe](https://haxe.org/download/), seriously, stop using 4.1.5, it misses some stuff.

open up a Command Prompt/PowerShell or Terminal, type `haxelib install hmm`

after it finishes, simply type `haxelib run hmm install` in order to install all the needed libraries for *Psych Engine!*

## Customization:

if you wish to disable things like *Lua Scripts* or *Video Cutscenes*, you can read over to `Project.xml`

inside `Project.xml`, you will find several variables to customize Psych Engine to your liking

to start you off, disabling Videos should be simple, simply Delete the line `"VIDEOS_ALLOWED"` or comment it out by wrapping the line in XML-like comments, like this `<!-- YOUR_LINE_HERE -->`

same goes for *Lua Scripts*, comment out or delete the line with `LUA_ALLOWED`, this and other customization options are all available within the `Project.xml` file

## Credits:
* Shadow Mario - Programmer
* RiverOaken - Artist
* Yoshubs - Assistant Programmer

### Special Thanks
* bbpanzu - Ex-Programmer
* Yoshubs - New Input System
* SqirraRNG - Crash Handler and Base code for Chart Editor's Waveform
* KadeDev - Fixed some cool stuff on Chart Editor and other PRs
* iFlicky - Composer of Psync and Tea Time, also made the Dialogue Sounds
* PolybiusProxy - .MP4 Video Loader Library (hxCodec)
* Keoiki - Note Splash Animations
* Smokey - Sprite Atlas Support
* Nebula the Zorua - LUA JIT Fork and some Lua reworks
_____________________________________

# Features

## Attractive animated dialogue boxes:

![](https://user-images.githubusercontent.com/44785097/127706669-71cd5cdb-5c2a-4ecc-871b-98a276ae8070.gif)


## Mod Support
* Probably one of the main points of this engine, you can code in .lua files outside of the source code, making your own weeks without even messing with the source!
* Comes with a Mod Organizing/Disabling Menu.


## Atleast one change to every week:
### Week 1:
  * New Dad Left sing sprite
  * Unused stage lights are now used
### Week 2:
  * Both BF and Skid & Pump does "Hey!" animations
  * Thunders does a quick light flash and zooms the camera in slightly
  * Added a quick transition/cutscene to Monster
### Week 3:
  * BF does "Hey!" during Philly Nice
  * Blammed has a cool new colors flash during that sick part of the song
### Week 4:
  * Better hair physics for Mom/Boyfriend (Maybe even slightly better than Week 7's :eyes:)
  * Henchmen die during all songs. Yeah :(
### Week 5:
  * Bottom Boppers and GF does "Hey!" animations during Cocoa and Eggnog
  * On Winter Horrorland, GF bops her head slower in some parts of the song.
### Week 6:
  * On Thorns, the HUD is hidden during the cutscene
  * Also there's the Background girls being spooky during the "Hey!" parts of the Instrumental

## Cool new Chart Editor changes and countless bug fixes
![](https://github.com/ShadowMario/FNF-PsychEngine/blob/main/docs/img/chart.png?raw=true)
* You can now chart "Event" notes, which are bookmarks that trigger specific actions that usually were hardcoded on the vanilla version of the game.
* Your song's BPM can now have decimal values
* You can manually adjust a Note's strum time if you're really going for milisecond precision
* You can change a note's type on the Editor, it comes with two example types:
  * Alt Animation: Forces an alt animation to play, useful for songs like Ugh/Stress
  * Hey: Forces a "Hey" animation instead of the base Sing animation, if Boyfriend hits this note, Girlfriend will do a "Hey!" too.

## Multiple editors to assist you in making your own Mod
![Screenshot_3](https://user-images.githubusercontent.com/44785097/144629914-1fe55999-2f18-4cc1-bc70-afe616d74ae5.png)
* Working both for Source code modding and Downloaded builds!

## Story mode menu rework:
![](https://i.imgur.com/UB2EKpV.png)
* Added a different BG to every song (less Tutorial)
* All menu characters are now in individual spritesheets, makes modding it easier.

## Credits menu
![Screenshot_1](https://user-images.githubusercontent.com/44785097/144632635-f263fb22-b879-4d6b-96d6-865e9562b907.png)
* You can add a head icon, name, description and a Redirect link for when the player presses Enter while the item is currently selected.

## Awards/Achievements
* The engine comes with 16 example achievements that you can mess with and learn how it works (Check Achievements.hx and search for "checkForAchievement" on PlayState.hx)

## Options menu:
* You can change Note colors, Delay and Combo Offset, Controls and Preferences there.
 * On Preferences you can toggle Downscroll, Middlescroll, Anti-Aliasing, Framerate, Low Quality, Note Splashes, Flashing Lights, etc.

## Other gameplay features:
* When the enemy hits a note, their strum note also glows.
* Lag doesn't impact the camera movement and player icon scaling anymore.
* Some stuff based on Week 7's changes has been put in (Background colors on Freeplay, Note splashes)
* You can reset your Score on Freeplay/Story Mode by pressing Reset button.
* You can listen to a song or adjust Scroll Speed/Damage taken/etc. on Freeplay by pressing Space.
