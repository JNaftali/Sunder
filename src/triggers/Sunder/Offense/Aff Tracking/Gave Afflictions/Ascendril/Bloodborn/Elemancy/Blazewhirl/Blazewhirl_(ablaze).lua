if snd.target == matches[2] then
  snd.target_got("ablaze")
  disableTrigger("Blazewhirl (not ablaze)")
  tempLineTrigger(2,1,[[enableTrigger("Blazewhirl (not ablaze)")]])
end