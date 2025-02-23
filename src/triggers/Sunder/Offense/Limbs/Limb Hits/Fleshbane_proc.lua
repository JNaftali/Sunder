local numbermap =
  {
    one = 1,
    two = 2,
    three = 3,
    four = 4,
    five = 5,
    six = 6,
    seven = 7,
    eight = 8,
    nine = 9,
    ten = 10,
    eleven = 11,
    twelve = 12,
    thirteen = 13,
    fourteen = 14,
    fifteen = 15,
    sixteen = 16,
    seventeen = 17,
    eighteen = 18,
    nineteen = 19,
    twenty = 20,
  }
if matches[3] == snd.target then
  snd.fleshbaneStacks = numbermap[matches[2]]
  --failsafe to make sure this goes back to zero.
  if snd.fleshbaneTimer then killTimer(snd.fleshbaneTimer) end
  snd.fleshbaneTimer = tempTimer(5, function() snd.fleshbaneStacks = 0 end)
end