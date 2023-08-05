package backend;

class TranslationUtil
{
    public static var diffsRuFormatted:Array<Dynamic> = [
		['Легко', "Лeгko"],
		['Нормально', "Hopmальho"],
		['Сложно', "Cлoжho"]
	];

    public static function ruDiffFormat(diff:String)
    {
        var returnValue:String = diff;

		if(isDefaultDiff(diff) == false)
		{
			return returnValue;
		}

		for (i in 0...diffsRuFormatted.length)
		{
			if(diffsRuFormatted[i][0] == diff)
			{
				returnValue = diffsRuFormatted[i][1];
			}
		}

        return returnValue;
    }

	public static function isDefaultDiff(diff:String)
	{
		var isDefault:Bool = false;
		switch(diff.toLowerCase())
		{
			case 'easy' | 'normal' | 'hard' | 'легко' | 'нормально' | 'сложно':
				isDefault = true;
			default:
				isDefault = false;
		}
		return isDefault;
	}
}