
function snd.do_elixir(current)
 if gmcp.Char.Vitals.elixir == "1" and not snd.waiting.elixir and snd.can_eat() then
  snd.send("sip "..snd.afflictions[current].cures.elixir)
  snd.waiting.elixir = true
  tempTimer(snd.delay(), [[snd.waiting.elixir = false]] )
 end
end