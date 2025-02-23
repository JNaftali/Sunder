cecho("\n<MediumSeaGreen>*------------------------------------------------------------------------------------------------*")
cecho("\n<MediumSeaGreen>|                                           <CadetBlue>SUNDER TOGGLES                                       <MediumSeaGreen>|")                                                    
cecho("\n<MediumSeaGreen>*------------------------------------------------------------------------------------------------*")
cecho("\n<MediumSeaGreen>| <ansiCyan>TOGGLE NAME <MediumSeaGreen> |                 <ansiCyan>INFOMATION                  <MediumSeaGreen>|             <ansiCyan>TOGGLES               <MediumSeaGreen>|")
cecho("\n<MediumSeaGreen>|------------------------------------------------------------------------------------------------|\n")

local togglecolor = ""

for k, v in pairs(snd.toggle_info) do

if snd.toggles[k] then togglecolor = "DeepSkyBlue" else togglecolor = "SlateGray" end

  cecho("<MediumSeaGreen>|<"..togglecolor.."> "..padRight(k, 13).. "<MediumSeaGreen>|<ForestGreen> "..padRight(tostring(v.info), 44).."<MediumSeaGreen>|<MediumTurquoise> "..padRight(tostring(v.command), 34).."<MediumSeaGreen>|\n")
end

cecho("<MediumSeaGreen>*------------------------------------------------------------------------------------------------*\n")