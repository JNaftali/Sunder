if matches[2] == snd.target and (matches[1]:find("longsword") or matches[1]:find("sabre") or matches[1]:find("blade")) then
  snd.onHit2({"Rebounding", "Dodge"}, "Templar")
end