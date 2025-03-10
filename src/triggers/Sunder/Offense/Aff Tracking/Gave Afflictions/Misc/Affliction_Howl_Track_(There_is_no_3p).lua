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
  ["blurring"] = "blurry_vision",
  ["debilitating"] = "weariness",
  ["mania"] = "mania",
  ["angry"] = "hatred",
  --["disturbing"] = "disrupted",
  ["befuddling"] = "confusion",
  ["deep"] = "plodding",
  ["dumbing"] = "idiocy",
}
if matches[4]:find(snd.target) and howl_conversion[matches[2]] ~= nil then
  snd.target_got(howl_conversion[matches[2]])
end

