--Maybe need an illusion check. 
--Maybe call a flag from the combatmessage and check for the flag here? 
--You use Crystalism Tones Plague on PERSON.

if snd.target == matches[2] then
  snd.target_got(matches[3])
end