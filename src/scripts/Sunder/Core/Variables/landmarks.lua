snd.landmarks = snd.landmarks or {}
--tear of lleis
snd.landmarks.tear = 19296

--pk objective thing.
snd.landmarks.orrery = 62642

--Fengard mobs
snd.landmarks.tara = 18815
snd.landmarks.cosmina = 18838
snd.landmarks.derryk = 18829
snd.landmarks.sylvos = 18826
snd.landmarks.tiber = 18843
snd.landmarks.gladius = 18852
snd.landmarks.gloom = 19083
snd.landmarks.derban = 19072
snd.landmarks.grothgar = 19060
snd.landmarks.grollum = 19094
snd.landmarks.smirnick = 19065
snd.landmarks.smythe = 18766
snd.landmarks.helfga = 18798
snd.landmarks.naggamantex = 18773
snd.landmarks.glixx = 18774
snd.landmarks.quelzar = 18792
snd.landmarks.sisters = 18789
snd.landmarks.hecuba = 19100

--turnin for tellimerius
snd.landmarks.kerrach = 23219

--milestone mobs
snd.landmarks.tellimerius = 23236 --one north of telli
snd.landmarks.broondac = 26627 --in the spire leading to the prison.
snd.landmarks.belmith = 60083
snd.landmarks.marcello = 27124 --This is north of marcello's guards.
snd.landmarks.axel = 17606
snd.landmarks.makkali = 4438
snd.landmarks.mamba = 11162
snd.landmarks.tolonar = 3999 --west of tolonar
snd.landmarks.gorgon = 36814

--other milestone things
snd.landmarks.herolt = 57296
snd.landmarks.farkle = 61403
snd.landmarks.lineconnect = 66482
snd.landmarks.poker = 53397
snd.landmarks.safari = 52786

snd.landmarks.boggard = 53409 --turning for black ylem

snd.landmarks.hg = 4746

snd.landmarks.nighteye = 9342
snd.landmarks.claw = 9341
snd.landmarks.shade = 6090
snd.landmarks.staghelm = 9348
snd.landmarks.silence = 4614
snd.landmarks.rose = 9341
snd.landmarks.ivory = 6842
snd.landmarks.rowan = 6842
snd.landmarks.hgshrine = 23489

snd.landmarks.wyvern = 78127

snd.landmarks.sgs = 59238

snd.landmarks.epicurean = 62454

snd.landmarks.mithril = 3429

local citymarks =
  {
    Enorian = {staging = 56509, training = 55768},
    Bloodloch = {staging = 65913, training = 9330},
    Spinesreach = {staging = 73174, training = 52748},
    Duiran = {staging = 52260, training = 52260},
  }
function snd.registerCityMarks()
  if citymarks[gmcp.Char.Status.city] then
    for name, num in pairs(citymarks[gmcp.Char.Status.city]) do
      snd.landmarks[name] = num
    end
  end
end