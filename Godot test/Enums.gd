extends Node


enum Skill {
	NoSkill,
	ExtraTurn,
	WildBonus,
	TakeToken,
	TakePriv,
	StealToken
}

enum TokenColour {
	Gold,
	Blue,
	Red,
	White,
	Green,
	Black,
	Pink,
	Wild,
	None
}
enum CardDetail{
	Tier,
	Score,
	Crown,
	Bonus,
	BonusCount,
	Skill,
	Cost
}


enum CardPopupState{
	CanReserveAndPurchase,
	CanReserve,
	CanPurchase,
	CannotReserveAndPurchase,
	NotPlayerTurn,
	
}

enum PhaseIndicatorState{
	Toggle_Out,
	Auto_Out,
	Auto_In
}


