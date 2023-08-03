package options;

class LanguageOptionsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Language Settings';
		rpcTitle = 'Gameplay Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Game language:',
			"Your language?",
			'language',
			'string',
			['Russian', 'English']);
		addOption(option);

		super();
	}

	function onChangeHitsoundVolume()
	{
		FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.data.hitsoundVolume);
	}

	function onChangeAutoPause()
	{
		FlxG.autoPause = ClientPrefs.data.autoPause;
	}
}