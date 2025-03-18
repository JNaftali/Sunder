--- @module settings

function snd_toggleSave(disp)
  local separator = string.char(getMudletHomeDir():byte()) == "/" and "/" or "\\"
  local save_loc = getMudletHomeDir() .. separator .. "sunderToggles"

  table.save(save_loc, snd.toggles)

  if disp then
    snd.message("Current toggle configuration saved.")
  end
end

function snd_toggleLoad()
  local separator = string.char(getMudletHomeDir():byte()) == "/" and "/" or "\\"
  local load_loc = getMudletHomeDir() .. separator .. "sunderToggles"

  if not io.exists(load_loc) then
    snd.message("Toggle save file not found; will save when you next disconnect/QQ.")
    return
  end
  local loadedToggles = {}
  table.load(load_loc, loadedToggles)

  for key, value in pairs(loadedToggles) do
    snd.toggles[key] = value
  end

  snd.message("Toggles found; we loaded them in just fine.")
  snd.goggle_update()
  snd_toggleSave(false)
  if snd.toggles.highlights then
    npb.enable()
  end
end

registerAnonymousEventHandler("sysDisconnectionEvent", "snd_toggleSave", true)
registerAnonymousEventHandler("sysLoadEvent", "snd_toggleLoad")

snd.toggle_info = {
  active = { info = "System full stop of on/off.", command = "sndon and sndoff" },
  parrying = { info = "Basic parry set-up.", command = "tpry or toggle parry" },
  defenses = { info = "Maintain defenses automatically.", command = "defup" },
  calling = { info = "Call targets over web.", command = "tcl" },
  listening = { info = "Accept targets over web.", command = "ls <name name name>" },
  affcalling = { info = "Call affs over web.", command = "acl" },
  chameleon = { info = "Use chameleon tattoo/racial.", command = "tcm" },
  bashing = { info = "Kill NPCs in your room.", command = "aa" },
  fasthunt = { info = "Toggle on to clear rooms as you walk around.", command = "ff" },
  generics = { info = "Uses name instead of number while bashing.", command = "toggle generic" },
  gathering = { info = "Pick up items while bashing.", command = "On when fasthunt is active" },
  lighting = { info = "Toggle lighting pipes.", command = "lgt or toggle (lighting|pipes)" },
  attacking = { info = "Turns on/off based on aliases for PvP.", command = "See Sunder Help PK" },
  balecho = { info = "Replaces bal/eq with colorful echoes.", command = "automatic" },
  atkecho = { info = "Replaces attack lines with shorthand.", command = "tatk or toggle attack echo" },
  newbie = { info = "Newbie bashing attacks only.", command = "tnewb or toggle newbie" },
  cobra = { info = "Toggle cobra bashing for monks.", command = "toggle cobra" },
  lightning = { info = "Toggle luminary lightning to bash.", command = "tlgt or toggle lightning" },
  gallop = { info = "Use gallop while pathing around.", command = "tgl or toggle gallop" },
  dash = { info = "Use of dash while pathing around.", command = "tds or toggle dash" },
  rockharvest = { info = "Harvest rocks as you walk around.", command = "tr or toggle rockharvest" },
  plants = { info = "Shows plants in the room as you walk.", command = "toggle plants" },
  disperse = { info = "Use disperse to remove writhes from allies.", command = "toggle disperse (all|callers|none)" },
  questing = { info = "Toggle questing.", command = "toggle questing" },
  vermin = { info = "Vermin walking/killing/turnin.", command = "toggle vermin" },
  goggles = { info = "Telling Sunder you have antiquated goggles.", command = "toggle goggles" },
  goggle_level = { info = "What level are your goggles?", command = "mygoggles or mygoggles <level>" },
  nontargetgags = { info = "Remove nontarget cures from output.", command = "toggle non target gagging" },
  dome = { info = "Do you want Sunder to auto dome for you?", command = "toggle dome" },
  auto_reject = { info = "Should we auto reject lust attempts?", command = "toggle reject" },
  prism = { info = "Do you want to prism/triplicate bash?", command = "toggle prism" },
  enrich = { info = "Do you want to enrich while you bash?", command = "toggle enrich" },
  diagaffs = { info = "How many hidden affs before you diagnose?", command = "diagaffs <#>" }
}
