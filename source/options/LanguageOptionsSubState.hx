package options;

class LanguageOptionsSubState extends BaseOptionsMenu
{
    public function new()
    {
        title = 'Language Settings';
        rpcTitle = 'Language Settings Menu'; //for Discord Rich Presence
    
        switch(ClientPrefs.data.language)
        {
            case 'Russian':
                var option:Option = new Option('Язык:',
                    "Выберите язык для игры.",
                    'language',
                    'string',
                    ['English', 'Russian']);
                addOption(option);
            default:
                var option:Option = new Option('Language:',
                    "Select your language for game.",
                    'language',
                    'string',
                    ['English', 'Russian']);
                addOption(option);
        }

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