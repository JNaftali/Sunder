if snd.class == "Infiltrator" then
  if matches[2] == nil then
    snd.set_queue("secure dirk"..snd.sep.."secure whip"..snd.sep.."wear buckler"..snd.sep.."bowstance"..snd.sep.."switch meteor"..snd.sep.."shoot "..snd.target.." meteor")
  else
    snd.set_queue("secure dirk"..snd.sep.."secure whip"..snd.sep.."wear buckler"..snd.sep.."bowstance"..snd.sep.."switch meteor"..snd.sep.."shoot "..matches[2].." meteor")
  end
end