function PetMaster_Init( _MePtr )

	Char.SetData(_MePtr, %对像_形象%, 110599);    --%对像_形象%
	Char.SetData(_MePtr, %对像_原形%, 110599);    --%对像_原形%
	Char.SetData(_MePtr, %对像_地图类型%, 0);     --%对像_地图类型%
	Char.SetData(_MePtr, %对像_地图%, 25000);      --%对像_地图%
	Char.SetData(_MePtr, %对像_X%, 25);          --%对像_X%
	Char.SetData(_MePtr, %对像_Y%, 13);           --%对像_Y%
	Char.SetData(_MePtr, %对像_方向%, %右下%);    --%对像_方向%, %右下%
	Char.SetData(_MePtr, %对像_原名%, "宠物大师牛牪犇");    --%对像_原名%
	if (Char.SetTalkedEvent(nil, "PetMaster_Talked", _MePtr) < 0) then
		print("PetMaster_Talked 注册事件失败。");
		return false;
	end
	if (Char.SetWindowTalkedEvent(nil, "PetMaster_WindowTalked", _MePtr) < 0) then
		print("PetMaster_WindowTalked 注册事件失败。");
		return false;
	end
	return true;
end
function PetMaster_Talked( _MePtr,_TalkPtr)
	if NLG.CheckInFront(_TalkPtr,_MePtr,1)==false then
		return;
	end
	NLG.ShowWindowTalked(_TalkPtr,0,12,0,
	"\n　　你好!["..Char.GetData(_TalkPtr,%对像_原名%).."],我是宠物大师牛牪犇，任何宠物的成长都逃脱不了我的眼睛，你只需要支付我100金币我就能告诉你宠物的档数!"..
	"\n\n　　想试试吗？",
	_MePtr);
 return;
end
function PetMaster_WindowTalked(_MePtr,_TalkPtr,_Seqno,_Select,_Data)

	if (_Select==8) then 
		NLG.TalkToCli(_TalkPtr,"算了，我的眼好累，o(>﹏<)o尴尬死了...",4,0,_MePtr);
		return;
	end
	local tab={};
	local tabnopet={};
	if (_Seqno==0) then
		local buf="";
		for t = 1,5 do
			
			PetIndex =Char.GetPetIndex(_TalkPtr,t-1);
			if (PetIndex>0) then 
				buf=Char.GetData( PetIndex, %对像_原名%);
			else 
				buf="无宠物";
				
				
			end
			tab[t]=buf;
			
		end	
		NLG.ShowWindowTalked(_TalkPtr,2,2,1,
		"2\n请选择："..
		"\n\n       ☆["..tab[1].."]☆"..
		"\n       ☆["..tab[2].."]☆"..
		"\n       ☆["..tab[3].."]☆"..
		"\n       ☆["..tab[4].."]☆"..
		"\n       ☆["..tab[5].."]☆",
		_MePtr);
		
		
		
	end
	if (_Seqno==1) then
		local PetIndex1=Char.GetPetIndex(_TalkPtr,tonumber(_Data)-1)
		if (PetIndex1>0) then
			local nowmoney=Char.GetData(_TalkPtr,%对像_金币%)-100;
			if (nowmoney<0) then 
				NLG.TalkToCli(_TalkPtr,"抱歉你的钱不够...",4,0,_MePtr);
				
			else	
				Char.SetData(_TalkPtr,%对像_金币%,nowmoney);
				NLG.TalkToCli(_TalkPtr,"交出100",4,0);
				NLG.ShowWindowTalked(_TalkPtr,0,1,12,
				"此["..Char.GetData( Char.GetPetIndex(_TalkPtr,tonumber(_Data)-1), %对像_原名%).."]掉挡情况如下："..
				"\n体力["..Pet.GetArtRank(PetIndex1,0)-Pet.FullArtRank(PetIndex1,0).."]档"..
				"\n力量["..Pet.GetArtRank(PetIndex1,1)-Pet.FullArtRank(PetIndex1,1).."]档"..
				"\n强度["..Pet.GetArtRank(PetIndex1,2)-Pet.FullArtRank(PetIndex1,2).."]档"..
				"\n速度["..Pet.GetArtRank(PetIndex1,3)-Pet.FullArtRank(PetIndex1,3).."]档"..
				"\n魔法["..Pet.GetArtRank(PetIndex1,4)-Pet.FullArtRank(PetIndex1,4).."]档",
				_MePtr);
			end
		else 
			NLG.ShowWindowTalked(_TalkPtr,0,1,11,"大哥，那个位置没宠物...汗⊙﹏⊙b汗",_MePtr);
		end
	end
	return;
end
