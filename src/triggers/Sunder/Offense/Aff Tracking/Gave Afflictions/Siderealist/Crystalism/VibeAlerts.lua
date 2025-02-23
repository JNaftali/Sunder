--^(\w+) begins to vibrate in tune with a disruptive harmony\.$

--Not sure if possible to code anti illusion checks.

local vibrationToEffect = {
    adduction = {},
    disorientation = { affs = { "dizziness" } },
    plague_broken_arms = { affs = { "right_arm_crippled", "left_arm_crippled" } },
    plague_broken_legs = { affs = { "left_leg_crippled", "right_leg_crippled", "fallen" } },
    plague_vomiting = { affs = { "vomiting" } },
    dissipate = { mp = 0.055 },
    energize = {},
    creeps_claustrophobia = { affs = { "claustrophobia" } },
    creeps_agoraphobia = { affs = { "agoraphobia" } },
    creeps_shyness = { affs = { "shyness" } },
    oscillate = {},
    lullaby = { affs = { "sleep" } },
    palpitation = { hp = 0.0925 },
    dissension = {},
    gravity = { defStrip = { "levitation" } },
    tremors = { affs = { "fallen" } },
    stridulation = { affs = { "disrupted" } },
}

if snd.target == matches[2] then
  for i,v in pairs(vibrationToEffect[matches[3]]) do
    if i ~= "hp" and i ~= "mp" then
      for num,effect in ipairs(v) do
        if i == "affs" then
          snd.target_got(effect)
        elseif i == "defStrip" then
          if effect == "levitation" then
            snd.lev_gone = true
          end
        end
      end
    else
      snd.vital_change(i, -v*100)
    end
  end
end