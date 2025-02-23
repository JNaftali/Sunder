
function snd.do_fitness()
 if snd.can_fitness() and snd.need_fitness and snd.full_balance() then
  snd.send(snd.fitnessCommandOverride and snd.fitnessCommandOverride() or "fitness")
  echo("(fitness)")
  snd.last_type = "fitness"
  snd.last_item = "fitness"
  snd.waiting.balance = true
  tempTimer(snd.delay(), [[snd.waiting.balance = false]])
 end
end