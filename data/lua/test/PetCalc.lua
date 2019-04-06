----------------------------------------------------------------------
--名称：宠物算档器
--说明：计算宠物档数，修改宠物档数等等
--
--GMSV Lua QQ群：14583019
--By Duckyの復活 (QQ:462363)
--In 2012.12.28
----------------------------------------------------------------------

function PetCalc_Init( _MeIndex )
	Char.SetData(_MeIndex, 1, 101020);
	Char.SetData(_MeIndex, 2, 101020);
	Char.SetData(_MeIndex, 3, 0);
	Char.SetData(_MeIndex, 4, 62014);
	Char.SetData(_MeIndex, 5, 11);
	Char.SetData(_MeIndex, 6, 3);
	Char.SetData(_MeIndex, 7, 6);
	Char.SetData(_MeIndex, 2000, "会算档的牛牪犇");

	if (Char.SetTalkedEvent(nil, "PetCalc_Talked", _MeIndex) < 0) then
		print("PetCalc_Talked 注册事件失败。");
		return false;
	end

	if (Char.SetWindowTalkedEvent(nil, "PetCalc_WindowTalked", _MeIndex) < 0) then
		print("PetCalc_WindowTalked 注册事件失败。");
		return false;
	end

	return true;
end

function PetCalc_Talked( _MeIndex, _PlayerIndex)

	if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 1) == false) then
		return ;
	end 

	local buf = PetCalc_ShowCalc(_PlayerIndex)
	NLG.ShowWindowTalked(_PlayerIndex, 0, 1, 0, buf, _MeIndex);
	return ;
end

function PetCalc_ShowCalc(_PlayerIndex)
		local buf =  "\n 　　　　　　　　　【宠物算档】\n\n";
		buf = buf .. "　　　名称　　体力　力量　强度　敏捷　魔法　档"
		for i = 0, 4 do
			local PetIndex = Char.GetPetIndex(_PlayerIndex, i)
			if(PetIndex >=0) then
				--local buf1 = Char.GetData(PetIndex, %对像_原名%) .. "(" .. Char.GetPetEnemyId(_PlayerIndex, i) .. ")"
				local buf1 = Char.GetData(PetIndex, %对像_原名%)
				local buf2 = Pet.GetArtRank(PetIndex, %宠档_体成%) .. "/" .. Pet.FullArtRank(PetIndex, %宠档_体成%)
				local buf3 = Pet.GetArtRank(PetIndex, %宠档_力成%) .. "/" .. Pet.FullArtRank(PetIndex, %宠档_力成%)
				local buf4 = Pet.GetArtRank(PetIndex, %宠档_强成%) .. "/" .. Pet.FullArtRank(PetIndex, %宠档_强成%)
				local buf5 = Pet.GetArtRank(PetIndex, %宠档_速成%) .. "/" .. Pet.FullArtRank(PetIndex, %宠档_速成%)
				local buf6 = Pet.GetArtRank(PetIndex, %宠档_魔成%) .. "/" .. Pet.FullArtRank(PetIndex, %宠档_魔成%)
				local buf7 = Pet.GetArtRank(PetIndex, %宠档_体成%) + Pet.GetArtRank(PetIndex, %宠档_力成%) + Pet.GetArtRank(PetIndex, %宠档_强成%) + Pet.GetArtRank(PetIndex, %宠档_速成%) + Pet.GetArtRank(PetIndex, %宠档_魔成%) - Pet.FullArtRank(PetIndex, %宠档_体成%) - Pet.FullArtRank(PetIndex, %宠档_力成%) - Pet.FullArtRank(PetIndex, %宠档_强成%) - Pet.FullArtRank(PetIndex, %宠档_速成%) - Pet.FullArtRank(PetIndex, %宠档_魔成%)
				buf = buf .. string.format("%12.12s",buf1) .. string.format("%6.6s",buf2) .. string.format("%6.6s",buf3) .. string.format("%6.6s",buf4) .. string.format("%6.6s",buf5) .. string.format("%6.6s",buf6) .. string.format("%4.3s",buf7)
			else
				buf = buf .. string.format("%12.12s","无宠物") .. "\n"
			end
		end
	return buf
end

function PetCalc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	return ;
end

