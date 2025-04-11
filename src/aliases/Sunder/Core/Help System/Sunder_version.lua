-- version is populated by muddler builds
local packages = getPackages()
local isHeartache = false

for _, package in ipairs(packages) do
  if string.lower(package):find("heartache") then
    isHeartache = true
  end
end

if isHeartache then
  snd.message("Your version of sunder is: @VERSION@ - Heartache Edition")
else
  snd.message("Your version of sunder is: @VERSION@")
end
