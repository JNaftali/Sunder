if multimatches[2][2] == "wailing" then return end
if multimatches[2][2] == "failure" then return end
local howl_conversion =
{
  ["piercing"] = "hearing",
  ["paralyzing"] = "paresis",
  ["baleful"] = "impairment",
  ["rousing"] = "recklessness",
  ["distasteful"] = "anorexia",
  ["forceful"] = "fallen",
  ["mind-numbing"] = "stupidity",
  ["stomach-turning"] = "vomiting",
  ["claustrophobic"] = "claustrophobia",
  ["muddling"] = "peace",
  ["hypnotic"] = "hypersomnia",
  ["deranged"] = "hallucinations",
  ["lethargic"] = "lethargy",
  ["ringing"] = "ringing_ears",
  ["blurring"] = "watery_eyes",
  ["debilitating"] = "weariness",
  ["mania"] = "mania",
  ["angry"] = "hatred",
  --["disturbing"] = "disrupted",
  ["befuddling"] = "confusion",
  ["deep"] = "plodding",
  ["dumbing"] = "idiocy",
}

if multimatches[2][3] == snd.target and howl_conversion[multimatches[2][2]] ~= nil then
  snd.target_got(howl_conversion[multimatches[2][2]])
end
