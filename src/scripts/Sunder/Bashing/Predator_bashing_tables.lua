function snd.get_predator_bash_attacks()
if hasSkill("Triplet") then
    if snd.toggles.laesan then
    return {
      ["Gyanis"] = "series lateral lateral lateral swiftkick",
      ["Vae-Sant"] = "series vertical vertical lateral swiftkick",
      ["Ein-Fasit"] = "series vertical lateral lateral swiftkick",
      ["Rizet"] = "series crescentcut swiftkick crescentcut crescentcut",
      ["Laesan"] = "series swiftkick vertical lateral swiftkick",
      ["None"] = "series crescentcut lateral lateral crescentcut",
      ["Bladesurge"] = "series crescentcut crescentcut crescentcut crescentcut",
    }
    else
    return {
      ["Gyanis"] = "series lateral vertical vertical",
      ["Vae-Sant"] = "series lateral vertical lateral",
      ["Ein-Fasit"] = "series vertical vertical vertical",
      ["Rizet"] = "series vertical vertical lateral",
      ["Laesan"] = "series crescentcut vertical vertical",
      ["None"] = "series crescentcut vertical vertical",
      ["Bladesurge"] = "series crescentcut crescentcut crescentcut crescentcut",
    }
    end
  elseif hasSkill("Twin") then
    return {
      ["Gyanis"] = "series lateral lateral",
      ["Vae-Sant"] = "series vertical vertical",
      ["Ein-Fasit"] = "series vertical lateral",
      ["Rizet"] = "series vertical vertical",
      ["Laesan"] = "series swiftkick vertical", --we shouldn't get here.
      ["None"] = "series lateral lateral",
      ["Bladesurge"] = "series vertical vertical vertical",
      }
  else
    return {
      ["Gyanis"] = "sitara lateral",
      ["Vae-Sant"] = "sitara lateral",
      ["Ein-Fasit"] = "sitara vertical",
      ["Rizet"] = "sitara vertical",
      ["Laesan"] = "changestance ein-fasit", --we shouldn't get here.
      ["None"] = "sitara lateral",
      ["Bladesurge"] = "sitara vertical",
    }
  end
end