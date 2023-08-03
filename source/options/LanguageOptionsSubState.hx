package options;

class LanguageOptionsSubState extends BaseOptionsMenu
{
    public function new()
    {
        title = 'Language Settings';
        rpcTitle = 'Language Settings Menu'; //for Discord Rich Presence
    
        var option:Option = new Option('Language:',
            "Select your language for game.",
            'language',
            'string',
            ['English', 'Russian']);
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