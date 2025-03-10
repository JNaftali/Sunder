-- Note: this alias was placed as an example and haw flaws - parts may not work. Toy with at your discrection.

if snd.class == "Oneiromancer" then
  snd.giving = {
    "asthma",
    --"aeon",
    "impatience",
    "clumsiness",
    "perplexity",
    "weariness",
    "stupidity",
    "anorexia",
    "epilepsy",
    "sensitivity",
    "vomiting",
    "lethargy",
    "confusion",
    "recklessness",
    "superstition",
    "mania",
    "hypersomnia",
  }

  snd.starting_attack()

  function snd.attack_function()
    local string = ""
    local raw_affs_to_fling = {}
    local cards = { one = { affliction = "", card = "" }, two = { affliction = "", card = "" } }

    if not snd.waiting.queue then
      if snd.used.shield then
        string = "order cerberus attack " .. snd.target .. snd.sep
        -- elseif snd.theytumbling then
        -- string ="unfurl hourglass and favor at "..snd.target..snd.sep
      elseif snd.checksomeAffs({ "left_arm_crippled", "right_arm_crippled", "left_leg_crippled", "right_leg_crippled", "leeched_aura" }, 5) then
        string = "vanquish " .. snd.target
      elseif not snd.need_deform then
        string = "starlight " .. snd.target .. snd.sep
      elseif snd.checksomeAffs({ "anorexia", "asthma" }, 2) and not snd.checkAff("slickness") then
        string = "impel athame at " .. snd.target .. " gecko" .. snd.sep
      else -- No special attacks, time to run through our aff list defined above and see what we want to give most.
        for i in pairs(snd.giving) do
          if not snd.checkAff(snd.giving[i]) then
            if snd.giving[i] == "aeon" then
              if snd.checkAff("clumsiness") or snd.checkAff("weariness") then
                table.insert(raw_affs_to_fling, snd.giving[i])
              end
            elseif not table.contains(raw_affs_to_fling, snd.giving[i]) then
              table.insert(raw_affs_to_fling, snd.giving[i]) -- insert into a raw aff list that they don't have, based on priority chosen above
            end
          end
        end

        for k, v in ipairs(raw_affs_to_fling) do -- run through the raw affs
          if cards.one.affliction == "" then -- fill in card one, could start with card two if you want to work around dodge CD
            if snd.cardshapes.oneiromancer[v].card == "diamond" then
              if not snd.adder_attached then -- Make sure that if we're picking an adder venom, we haven't already thrown adder
                cards.one.affliction = v
                cards.one.card = snd.cardshapes.oneiromancer[v].card
              end
            else
              cards.one.affliction = v
              cards.one.card = snd.cardshapes.oneiromancer[v].card
            end
          elseif cards.one.card ~= snd.cardshapes.oneiromancer[v].card and cards.two.affliction == "" then -- if card types are different and haven't already set card two
            if snd.cardshapes.oneiromancer[v].card == "diamond" then
              if not snd.adder_attached then                                                          -- Make sure that if we're picking an adder venom, we haven't already thrown adder
                cards.one.affliction = v
                cards.one.card = snd.cardshapes.oneiromancer[v].card
              end
            else
              cards.two.affliction = v
              cards.two.card = snd.cardshapes.oneiromancer[v].card
            end
          end
        end

        -- If the card is an adder venom affliction, convert the affliction to the venom.
        if cards.one.card == "diamond" then cards.one.affliction = snd.effects[cards.one.affliction] end
        if cards.two.card == "diamond" then cards.two.affliction = snd.effects[cards.two.affliction] end
      end

      if not snd.loyalsattacking then
        string = "order loyals kill " .. snd.target .. snd.sep .. string
      end

      if snd.need_leech_aura then
        string = "unspool " .. snd.target
      end

      if snd.balance.soulmaster and not snd.checkAff("slickness") then
        string = "order " .. snd.target .. " apply epidermal to head" .. snd.sep
      end

      if snd.balance.envelop then
        if not snd.checksomeAffs({ "anorexia", "slickness", "asthma" }, 1) then
          string = "order blob envelop" .. snd.sep
        end
      end

      if not snd.need_deform then
        string = string .. snd.sep .. "order quetzal wingbeat " .. snd.target .. snd.sep
      end

      if snd.need_deform then
        if snd.aff_count_all() > 11 then
          string = "disjunct " .. snd.target .. snd.sep
        end
      end

      if snd.adder_ready then
        string = string .. snd.sep .. "activate diamond " .. snd.target .. snd.sep
      end

      string = string ..
      snd.sep ..
      "unfurl " ..
      cards.one.card .. " " ..
      cards.one.affliction .. " and " .. cards.two.card .. " " .. cards.two.affliction .. " at " .. snd.target

      if snd.toggles.affcalling and not snd.target_gone then
        call = "wt Afflicting " .. snd.target .. ": " .. cards.one.affliction .. ", " .. cards.two.affliction .. snd.sep
        string = call .. snd.sep .. string
      end


      if string ~= snd.last_attack and not snd.waiting.queue then
        snd.last_attack = string
        snd.attack(snd.last_attack)
        snd.waiting.queue = true
        tempTimer(snd.delay(), [[snd.waiting.queue = false]])
      end
    end
  end

  snd.attack_function()
end

