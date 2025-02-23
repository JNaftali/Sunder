local raloth_affs = {
["throat"] = "crippled_throat",
["ribs"] = "cracked_ribs",
}

if matches[2] == snd.target then
  if raloth_affs[matches[3]] then
    snd.target_got(raloth_affs[matches[3]])
  else
    snd.target_got(matches[3].."_crippled")
  end
end