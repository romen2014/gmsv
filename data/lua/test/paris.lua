function SuperNPCTest_Init( _MePtr )

	Char.SetData(_MePtr, %对像_形象%, 108125);    --%对像_形象%
	Char.SetData(_MePtr, %对像_原形%, 108125);    --%对像_原形%
	Char.SetData(_MePtr, %对像_地图类型%, 0);     --%对像_地图类型%
	Char.SetData(_MePtr, %对像_地图%, 25000);      --%对像_地图%
	Char.SetData(_MePtr, %对像_X%, 31);          --%对像_X%
	Char.SetData(_MePtr, %对像_Y%, 3);           --%对像_Y%
	Char.SetData(_MePtr, %对像_方向%, %左下%);    --%对像_方向%, %右下%
	Char.SetData(_MePtr, %对像_原名%, "爱八卦的小牛");    --%对像_原名%

	
	if (Char.SetTalkedEvent(nil, "SuperNPCTest_Talked", _MePtr) < 0) then
		print("SuperNPCTest_Talked 注册事件失败。");
		return false;
	end
	
	
	return true;
end



function SuperNPCTest_Talked( _MePtr, _TalkPtr)

	if(NLG.CheckInFront(_TalkPtr, _MePtr, 1) == false) then
		return ;
	end 
	paris1 = Char.GetData(_TalkPtr, %对像_原名%);
	paris2 = Char.GetData(_TalkPtr, %对像_等级%);
	paris3 = Char.GetData(_TalkPtr, %对像_死亡数%);
	paris4 = Char.GetData(_TalkPtr, %对像_登陆次数%);
	paris5 = Char.GetData(_TalkPtr, %对像_声望%);
	paris6 = Char.GetData(_TalkPtr, %对像_走动次数%);
	
	paris7 = Char.GetData(_TalkPtr, %对像_杀宠数%);
	paris8 = Char.GetData(_TalkPtr, %对像_金币%);
	

	NLG.ShowWindowTalked(_TalkPtr, %视窗_讯息框%, 0, 0, "\n您好，" ..paris1.. "，您的个人信息如下：\n\n等级：" ..paris2.. "\n声望：" ..paris5.. "\n登陆次数：" ..paris4.. "\n死亡次数：" ..paris3.. "\n移动步数：" ..paris6.. "\n杀敌数：" ..paris7.. "\n身上魔币：" ..paris8.. " ",  _MePtr);

	return ;
end



