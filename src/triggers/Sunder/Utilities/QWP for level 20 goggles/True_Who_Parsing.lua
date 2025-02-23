for word in string.gmatch(multimatches[1][1], '[^.,%s]+') do
    if word ~= "and" then
        table.insert(snd.true_who, word)
    end
end
sndNDB_SortOnline(snd.true_who)
disableTrigger("QWP for level 20 goggles")

 

  

   