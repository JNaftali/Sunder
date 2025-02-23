local herbMap = {
  ["a reishi mushroom"] = "reishi",
  ["some willow bark"] = "willow",
  ["a yarrow root"] = "yarrow",
}
local herb = herbMap[matches[2]]
snd.emptypipes[herb] = false