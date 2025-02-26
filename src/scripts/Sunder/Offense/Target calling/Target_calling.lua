snd.targeting = {
  auto = false,
  list = {},
  burst = false,
  skip = false
}

snd.e = {
  echo = function(str, lnb, lna)
    if lnb then echo("\n") end
    cecho(string.format("%s", "<aquamarine>Target Update: <grey>") .. str:title())
    if lna then echo("\n") end
  end,

  warn = function(str, lnb, lna)
    if lnb then echo("\n") end
    cecho(string.format("%s", "<orange_red>Warning:<navajo_white> ") .. str:title())
    if lna then echo("\n") end
  end,
}
