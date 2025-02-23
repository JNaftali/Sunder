
function snd.do_rage()
 if snd.rage_check() and snd.can_rage() and snd.balance.rage then
  snd.send("rage")
  echo("(rage)")
  snd.last_type = "rage"
  snd.last_item = "rage"
  snd.waiting.balance = true
  tempTimer(snd.delay(), [[snd.waiting.balance = false]])
 end
end

function snd.rage_check()

  if not snd.balance.rage then return false end
  
  if not gmcp then return false end
  if hp ~= nil then
    if hp <= 1 then return false end
  end

  local rage_affs = {
    "aff_hubris",
  "aff_pacifism",
  "aff_peace",
  "aff_agony",
  "aff_accursed",
  "aff_limp_veins",
  "aff_lovers_effect",
  "aff_laxity",
  "aff_superstition",
  "aff_generosity",
  "aff_justice",
  "aff_magnanimity",}
  
  for _, v in pairs(rage_affs) do
    if snd.have_aff(v) then
      return true
    end
  end
  return false
end