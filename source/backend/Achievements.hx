package backend;

class Achievements {
	public static var achievementsStuff:Array<Dynamic> = [ //Name, Description, Achievement save tag, Hidden achievement
		
	];
	public static var achievementsEn:Array<Dynamic> = [ //Name, Description, Achievement save tag, Hidden achievement
		["Freaky on a Friday Night",	"Play on a Friday... Night.",						'friday_night_play',	 true],
		["She Calls Me Daddy Too",		"Beat Week 1 on Hard with no Misses.",				'week1_nomiss',			false],
		["No More Tricks",				"Beat Week 2 on Hard with no Misses.",				'week2_nomiss',			false],
		["Call Me The Hitman",			"Beat Week 3 on Hard with no Misses.",				'week3_nomiss',			false],
		["Lady Killer",					"Beat Week 4 on Hard with no Misses.",				'week4_nomiss',			false],
		["Missless Christmas",			"Beat Week 5 on Hard with no Misses.",				'week5_nomiss',			false],
		["Highscore!!",					"Beat Week 6 on Hard with no Misses.",				'week6_nomiss',			false],
		["God Effing Damn It!",			"Beat Week 7 on Hard with no Misses.",				'week7_nomiss',			false],
		["What a Funkin' Disaster!",	"Complete a Song with a rating lower than 20%.",	'ur_bad',				false],
		["Perfectionist",				"Complete a Song with a rating of 100%.",			'ur_good',				false],
		["Roadkill Enthusiast",			"Watch the Henchmen die over 50 times.",			'roadkill_enthusiast',	false],
		["Oversinging Much...?",		"Hold down a note for 10 seconds.",					'oversinging',			false],
		["Hyperactive",					"Finish a Song without going Idle.",				'hype',					false],
		["Just the Two of Us",			"Finish a Song pressing only two keys.",			'two_keys',				false],
		["Toaster Gamer",				"Have you tried to run the game on a toaster?",		'toastie',				false],
		["Debugger",					"Beat the \"Test\" Stage from the Freeplay menu.",	'debugger',				 true]
	];
	public static var achievementsRu:Array<Dynamic> = [ //Name, Description, Achievement save tag, Hidden achievement
		["Freaky on a Friday Night",	"Поиграйте в пятницу... ночью.",						'friday_night_play',	 true],
		["She Calls Me Daddy Too",		"Пройдите 1 неделю на сложном уровне без промахов.",				'week1_nomiss',			false],
		["No More Tricks",				"Пройдите 2 неделю на сложном уровне без промахов.",				'week2_nomiss',			false],
		["Call Me The Hitman",			"Пройдите 3 неделю на сложном уровне без промахов.",				'week3_nomiss',			false],
		["Lady Killer",					"Пройдите 4 неделю на сложном уровне без промахов.",				'week4_nomiss',			false],
		["Missless Christmas",			"Пройдите 5 неделю на сложном уровне без промахов.",				'week5_nomiss',			false],
		["Highscore!!",					"Пройдите 6 неделю на сложном уровне без промахов.",				'week6_nomiss',			false],
		["God Effing Damn It!",			"Пройдите 7 неделю на сложном уровне без промахов.",				'week7_nomiss',			false],
		["What a Funkin' Disaster!",	"Завершите песню с рейтингом менее 20%.",	'ur_bad',				false],
		["Perfectionist",				"Завершите песню с рейтингом в 100%.",			'ur_good',				false],
		["Roadkill Enthusiast",			"Посмотрите как приспешники умирают 50 раз.",			'roadkill_enthusiast',	false],
		["Oversinging Much...?",		"Зажмите ноту на 10 секунд.",					'oversinging',			false],
		["Hyperactive",					"Завершите песню без перехода в спокойный режим.",				'hype',					false],
		["Just the Two of Us",			"Завершите песню нажимая только 2 клавиши.",			'two_keys',				false],
		["Toaster Gamer",				"Вы пытались запустить игру на тостере?",		'toastie',				false],
		["Debugger",					"Пройдите \"Проверочную\" песню в плейлисте.",	'debugger',				 true]
	];
	public static var achievementsMap:Map<String, Bool> = new Map<String, Bool>();

	public static var henchmenDeath:Int = 0;
	public static function unlockAchievement(name:String):Void {
		FlxG.log.add('Completed achievement "' + name +'"');
		achievementsMap.set(name, true);
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
	}

	public static function isAchievementUnlocked(name:String) {
		if(achievementsMap.exists(name) && achievementsMap.get(name)) {
			return true;
		}
		return false;
	}

	public static function getAchievementIndex(name:String) {
		for (i in 0...achievementsStuff.length) {
			if(achievementsStuff[i][2] == name) {
				return i;
			}
		}
		return -1;
	}

	public static function loadAchievements():Void {
		switch(ClientPrefs.data.gameLanguage)
		{
			case 'Russian':
				achievementsStuff = achievementsRu;
			default:
				achievementsStuff = achievementsEn;
		}
		if(FlxG.save.data != null) {
			if(FlxG.save.data.achievementsMap != null) {
				achievementsMap = FlxG.save.data.achievementsMap;
			}
			if(henchmenDeath == 0 && FlxG.save.data.henchmenDeath != null) {
				henchmenDeath = FlxG.save.data.henchmenDeath;
			}
		}
	}
}