if snd.class == "Alchemist" then
  if matches[2] == "" then
    snd.attack("botany allure "..snd.target)
  else
    snd.attack("botany allure "..matches[2])
  end
end