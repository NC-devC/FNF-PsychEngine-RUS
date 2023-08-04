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
        var returnValue:String = "Hopmальho";

		for (i in 0...diffsRuFormatted.length)
		{
			if(diffsRuFormatted[i][0] == diff)
			{
				returnValue = diffsRuFormatted[i][1];
			}
		}

        return returnValue;
    }
}