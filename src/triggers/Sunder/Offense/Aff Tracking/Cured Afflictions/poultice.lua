if matches[2]:lower() == snd.target:lower() then
  snd.target_cured("slickness")
  snd.target_cured("slough")
  snd.immediateResto()
  if snd.sloughTimer then killTimer(snd.sloughTimer) end
  if not snd.checkAff("burnt_skin") then
    if matches[4] == "epidermal" then
      snd.target_last_used_salve = "epidermal"
      if matches[5] == "head" then
        if snd.checksomeAffs({ "stuttering", "blurry_vision", "indifference", "sight" }, 1) then
          snd.target_used("epidermal_head")
        else
          snd.target_got("sight")
        end
      elseif matches[5] == "torso" then
        snd.target_used("epidermal_torso")
      elseif matches[5] == "skin" then
        snd.target_used("epidermal")
      end
    else
      snd.target_used(matches[4])
    end
  end

  if snd.class == "Zealot" and matches[2] == snd.target then
    cecho("\n" .. snd.target .. " Now has <light_goldenrod>" .. snd.flamestack .. "<dodger_blue> stacks of intensity")
  end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end

