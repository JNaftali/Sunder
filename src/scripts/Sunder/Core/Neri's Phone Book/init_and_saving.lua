npb = npb or {}
npb.t = npb.t or {}
npb.loc = getMudletHomeDir().."/phonebook.lua"
sndNDB = sndNDB or {}

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function npb.save()
  table.save(npb.loc, npb.t)
end

function npb.load(force)
  if not file_exists(npb.loc) then npb.save() end
  
  if force or table.size(npb.t) == 0 then
     table.load(npb.loc, npb.t)
  end
end