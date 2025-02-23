npb.init()
if npb.t.guess_from_clans and npb.city_guess[matches[2]] and not npb.honour_data.city then
  npb.honour_data.city = npb.city_guess[matches[2]]
end