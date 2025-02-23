npb.honour_count = npb.honour_count + 1
if npb.honour_count == 3 then
  setTriggerStayOpen("parse_honours", 0)
  disableTrigger("parse_honours")
  npb.honour_on = false
  npb.add_or_update_person(npb.honour_data.name, npb.honour_data)
  --npb.unload_guess_triggers()
  if npb.honour_queue then
    npb.next_honour()
  end
end