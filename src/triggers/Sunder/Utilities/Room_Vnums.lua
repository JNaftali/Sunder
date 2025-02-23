if matches[3] == "a bandit encampment in the Bonro Sands" then
  matches[3] = "bandit encampment in Bonro"
end
mmp.locateAndEcho(matches[2], false, matches[3]:gsub("an unstable section of ", ""))