if snd.class == "Infiltrator" then
local shorthand = {
["clu"] = "clumsiness",
["imp"] = "impatience"
}
if shorthand[matches[2]] then
 snd.send("qeb suggest "..snd.target.." "..shorthand[matches[2]])
else
 cecho("<red>No such affliction!")
end
end