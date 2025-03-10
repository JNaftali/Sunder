if snd.class == "Oneiromancer" then
  snd.giving =
    {
      "asthma",
      --"aeon",
      "perplexity",
      "impatience",
      "clumsiness",
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
      "hypersomnia",
    }
  snd.starting_attack()

  function snd.attack_function()
    local string = ""
    local raw_affs_to_fling = {}
    local cards = {one = {affliction = "", card = ""}, two = {affliction = "", card = ""}}
    if not snd.waiting.queue then
      -- all instakill conditions(deform/vivi) or other add ons should go here as elseif.
      if snd.used.shield then
        string = "touch hammer " .. snd.target
        -- vivi/deform checks would prolly go here
      elseif snd.theytumbling then
        string = "impel athame at "..snd.target.." prefarar"..snd.sep    
      elseif snd.aff_count_all() > 10 then
        string = "starlight " .. snd.target
      else

        for i in pairs(snd.giving) do
          if not snd.checkAff(snd.giving[i]) then
            if snd.giving[i] == "aeon" then
              table.insert(raw_affs_to_fling, snd.giving[i])
            elseif not table.contains(raw_affs_to_fling, snd.giving[i]) then
              table.insert(raw_affs_to_fling, snd.giving[i])
              -- insert into a raw aff list that they don't have, based on priority chosen above
            end
          end
        end
        for k, v in ipairs(raw_affs_to_fling) do
          -- run through the raw affs
          if cards.one.affliction == "" then
            -- fill in card one, could start with card two if you want to work around dodge CD
            if snd.cardshapes.oneiromancer[v].card == "diamond" then
              if not snd.adder_attached then
                -- Make sure that if we're picking an adder venom, we haven't already thrown adder
                cards.one.affliction = v
                cards.one.card = snd.cardshapes.oneiromancer[v].card
              end
            else
              cards.one.affliction = v
              cards.one.card = snd.cardshapes.oneiromancer[v].card
            end
          elseif
            cards.one.card ~= snd.cardshapes.oneiromancer[v].card and cards.two.affliction == ""
          then
            -- if card types are different and haven't already set card two
            if snd.cardshapes.oneiromancer[v].card == "diamond" then
              if not snd.adder_attached then
                -- Make sure that if we're picking an adder venom, we haven't already thrown adder
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
        if cards.one.card == "diamond" then
          cards.one.affliction = snd.effects[cards.one.affliction]
        end
        if cards.two.card == "diamond" then
          cards.two.affliction = snd.effects[cards.two.affliction]
        end
        if snd.need_leech_aura then
          string = "unspool " .. snd.target
        end
        if snd.adder_ready then
          string = string .. snd.sep .. "activate diamond " .. snd.target
        end
        -- Syntax should be the same unless you have arti deck/regular deck, change next line as necessary
        -- Similarly, if you're using config auto_outc, feel free to remove outcping paper
        string = string..snd.sep.."outc sheet as "..cards.one.card..snd.sep.."outc sheet as "..cards.two.card
        string = string..snd.sep.."unfurl "..cards.one.card.." "..cards.one.affliction.." and "..cards.two.card.." "..cards.two.affliction.." at "..snd.target
        if snd.toggles.affcalling and not snd.target_gone then
          call = "wt Afflicting "..snd.target..": "..cards.one.affliction ..", "..cards.two.affliction..snd.sep
          string = call .. string
        end
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
