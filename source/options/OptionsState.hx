package options;

import states.MainMenuState;
import backend.StageData;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = [];
	var optionsEn:Array<String> = ['Note Colors', 'Controls', 'Adjust Delay and Combo', 'Graphics', 'Visuals and UI', 'Gameplay', 'Language'];
	var optionsRu:Array<String> = ['Цвета Нот', 'Управление', 'Регулировка Задержки и Комбо', 'Графика', 'Визуал и Интерфейс', 'Геймплей', 'Язык'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
	public static var onPlayState:Bool = false;

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Note Colors' | 'Цвета Нот':
				openSubState(new options.NotesSubState());
			case 'Controls' | 'Управление':
				openSubState(new options.ControlsSubState());
			case 'Graphics' | 'Графика':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals and UI' | 'Визуал и Интерфейс':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay' | 'Геймплей':
				openSubState(new options.GameplaySettingsSubState());
			case 'Adjust Delay and Combo' | 'Регулировка Задержки и Комбо':
				MusicBeatState.switchState(new options.NoteOffsetState());
			case 'Language' | 'Язык':
				MusicBeatState.switchState(new options.LanguageOptionsSubState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		#end

		switch(ClientPrefs.data.gameLanguage)
		{
			/*case 'Russian':
				options = optionsRu;*/
			default:
				options = optionsEn;
		}

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.color = 0xFFea71fd;
		bg.updateHitbox();

		bg.screenCenter();
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}

		selectorLeft = new Alphabet(0, 0, '>', true);
		add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true);
		add(selectorRight);

		changeSelection();
		ClientPrefs.saveSettings();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			if(onPlayState)
			{
				StageData.loadDirectory(PlayState.SONG);
				LoadingState.loadAndSwitchState(new PlayState());
				FlxG.sound.music.volume = 0;
			}
			else MusicBeatState.switchState(new MainMenuState());
		}
		else if (controls.ACCEPT) openSelectedSubstate(options[curSelected]);
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	override function destroy()
	{
		ClientPrefs.loadPrefs();
		super.destroy();
	}
}