deleteLine()
local fishhooked = {
"FISH HOOKED!",
"YOU GOT A FISH ON THE LINE!",
"YOU GOT A HIT!",
"HOOKED! REEL IT IN!",
"THERE'S A FISH ON YOUR LINE!",
"LEADING A FISH!",
"YOU GOT SOMETHING! MAYBE...",
}

snd.fishmsg("<green>"..fishhooked[math.random(#fishhooked)])
