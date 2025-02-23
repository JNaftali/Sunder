if matches[2] == snd.target and (matches[1]:find("scimitar") or matches[1]:find("shotel") or matches[1]:find("sabre")) then
  snd.onHit2({"Rebounding", "Dodge"}, "Templar")
end