function GMSV_NPC_Init()

	require("./data/lua/EasyLuaFunc");

	if (M__MeIndex == nil) then
		M__MeIndex = NL.CreateNpc("./data/lua/test/PetCalc.lua", "PetCalc_Init");
		NLG.UpChar(M__MeIndex);
	end
	
	if (M__MePtr == nil) then
		M__MePtr = NL.CreateNpc("./data/lua/test/PetMaster.lua", "PetMaster_Init");
		NLG.UpChar(M__MePtr);
	end

	if (M_SuperNPCTest_ptr == nil) then
		M_SuperNPCTest_ptr = NL.CreateNpc("./data/lua/test/paris.lua", "SuperNPCTest_Init");
		NLG.UpChar(M_SuperNPCTest_ptr);
	end



end

--ÀH¾÷ºØ¤l
math.randomseed(os.time());
GMSV_NPC_Init();
