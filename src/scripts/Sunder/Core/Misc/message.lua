
function snd.message(string, type)
  if snd.toggles.gags then
    if type == "atk" then
      color = "magenta"
    elseif type == "death" then
      color = "red"
    elseif type == "q" then
      color = "brown"
    elseif type == "balance" then
      color = "orange"
    elseif type == "level" then
      color = "yellow"
    elseif type == "reset" then
      color = "brown"
    elseif type == "affliction" then
      color = "DeepSkyBlue"
    elseif type == "dendara" then
      color = "green"
    else
      color = "white"
    end
    if type == "toggle" or type == "echo" then
      line = ""
    else
      line = "\n"
    end
    cecho(line.."<green>[<white>SND<green>]<"..color.."> "..string)
    if type == "reset" then
      send(" ")
    end
  end
end

function snd.attack_hit(attack, target)
 snd.message("You: <green>HIT<magenta> "..attack.."<white> "..target.."<magenta>!", "atk")
end

function snd.got_hit(attack, attacker)
 snd.message(attacker..": <red>HIT<magenta> "..attack.."<white> you<magenta>!", "atk")
end

function snd.third_hit(attack, attacker, target)
 snd.message("<white>"..attacker..": <red>HIT<white> "..attack.." "..target)
end

function snd.target_hit(attack, attacker, target)
 snd.message("<grey>"..attacker..": <red>HIT<grey> "..attack.." "..target)
end