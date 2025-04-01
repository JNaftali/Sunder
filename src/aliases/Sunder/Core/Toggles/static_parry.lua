local map = {
  ll = "left leg",
  la = "left arm",
  rl = "right leg",
  ra = "right arm",
  t = "torso",
  h = "head",
  a = "auto",
}
snd.parrying.set_static_parry(map[matches[2]:lower()])
