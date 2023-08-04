package options;

class LanguageOptionsSubState extends BaseOptionsMenu
{
	public function new()
	{
		switch(ClientPrefs.data.gameLanguage)
		{
			case 'Russian':
				title = 'Hаctpoйkи языkа';
				rpcTitle = 'Меню Настроек Языка'; //for Discord Rich Presence
			default:
				title = 'Language Settings';
				rpcTitle = 'Language Settings Menu'; //for Discord Rich Presence
		}

		var option:Option = new Option('Game language:',
			"Your language?",
			'gameLanguage',
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