if snd.class == "Archivist" then
  if snd.defenses.def_linked.state ~= "deffed" then
    snd.send("contemplate yi"..snd.sep.."contemplate jherza"..snd.sep.."contemplate jhako")
  elseif snd.defenses.def_oneness.state ~= "deffed" then
    snd.send("contemplate yuef")
  end
elseif snd.class == "Voidseer" then
  if snd.defenses.def_synergism.state ~= "deffed" then
    snd.send("blossom leaf"..snd.sep.."blossom heartwood"..snd.sep.."blossom branch")
  elseif snd.defenses.def_introspection.state ~= "deffed" then
    snd.send("blossom root")
  end    
end