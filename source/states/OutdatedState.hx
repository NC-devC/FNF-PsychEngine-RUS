package states;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		var warnContent:String = "";

		switch(ClientPrefs.data.gameLanguage)
		{
			case 'Russian':
				warnContent = "Привет братан, кажется ты играешь на   \n
				старой версии мода (" + MainMenuState.psychEngineVersion + "),\n
				ты можешь обновиться до " + TitleState.updateVersion + "!\n
				Нажми ESCAPE, чтобы продолжить.\n
				Нажми ENTER, чтобы обновиться.\n
				\n
				Спасибо за использование Psych Engine!";
			default:
				warnContent = "Sup bro, looks like you're running an   \n
				outdated version of mod (" + MainMenuState.psychEngineVersion + "),\n
				please update to " + TitleState.updateVersion + "!\n
				Press ESCAPE to proceed anyway.\n
				Press ENTER to download update.\n
				\n
				Thank you for using the Psych Engine!";
		}

		warnText = new FlxText(0, 0, FlxG.width, warnContent, 32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
				CoolUtil.browserLoad("https://github.com/NC-devC/FNF-PsychEngine-RUS/releases");
			}
			else if(controls.BACK) {
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}
