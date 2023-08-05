package options;

class OtherOptionsSubState extends BaseOptionsMenu
{
	public function new()
	{
		switch(ClientPrefs.data.gameLanguage)
		{
			case 'Russian':
				title = 'Дpугиe hаctpoйkи';
				rpcTitle = 'Меню Настроек Языка'; //for Discord Rich Presence
			default:
				title = 'Language Settings';
				rpcTitle = 'Language Settings Menu'; //for Discord Rich Presence
		}

		var option:Option = new Option('Disable stages',
			"This option turning off stages if checked.",
			'disableStages',
			'bool');
		addOption(option);
		var option:Option = new Option('Disable gf',
			"This option turning off girlfriend if checked.",
			'hideGF',
			'bool');
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