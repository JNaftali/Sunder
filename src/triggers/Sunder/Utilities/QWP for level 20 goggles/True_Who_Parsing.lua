local true_who = {}
local wraps = 1
local wrapWidth = getWindowWrap()
local x = 0
for word in string.gmatch(multimatches[1][1], '[^.,%s]+') do
  if word ~= "and" then
    table.insert(true_who, word)
  end
  x = x + #word + 2
  if x > wrapWidth then
    wraps = wraps + 1
    x = #word + 2
  end
end
deleteLine()
for i = 1, wraps do
  moveCursor(0, getLineNumber() - 1)
  deleteLine()
end
npb.qwsorted(true_who)
disableTrigger("QWP for level 20 goggles")

