local index = table.index_of(snd.skills.tattoos_on_me, matches[2]:title().."Tattoo")
if index then
  table.remove(snd.skills.tattoos_on_me, index)
end
--Leaving this turned off - I don't have a good way to repopulate a tattoo when it's inked on you. :(