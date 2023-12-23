local placeId = game.PlaceId
if placeId == 6296321810 or placeId == 6479231833 or placeId == 6301638949 or placeId == 6480994221 then
    _G.ScriptName = "The Mimic" --b1c1
elseif placeId == 6373539583 or placeId == 6485055338 or placeId == 6406571212 or placeId == 6485055836 or placeId == 6425178683 or placeId == 6485056556 then
    _G.ScriptName = "The Mimic" --b1c2
elseif placeId == 6472459099 or placeId == 6688734180 or placeId == 6682163754 or placeId == 6688734313 or placeId == 6682164423 or placeId == 6688734395 then
    _G.ScriptName = "The Mimic" --b1c3
elseif placeId == 7251865082 or placeId == 7265396387 or placeId == 7251866503 or placeId == 7265396805 or placeId == 7251867155 or placeId == 7265397072 or placeId == 7251867574 or placeId == 7265397848 then
   _G.ScriptName = "The Mimic" --b1c4
elseif placeId == 8056702588 then
    _G.ScriptName = "The Mimic" --b2c1
elseif placeId == 13489800654 then
    _G.ScriptName = "The Mimic" --b2c2
elseif placeId == 7068738088 or placeId == 7068951438 or placeId == 7068739000 or placeId == 7068951914 or placeId == 7068740106 or placeId == 7068952294 then
   _G.ScriptName = "The Mimic" --twt
elseif placeId == 8311299084 or placeId == 8311302084 then
    _G.ScriptName = "The Mimic" --christmas trial
elseif placeId == 7633631103 or placeId == 7633631351 or placeId == 7633631511 then
    _G.ScriptName = "The Mimic" --Halloween trial
elseif placeId == 11126398230 then
    _G.ScriptName = "The Mimic" --nightmarecircus
elseif placeId == 7618863566 then
    _G.ScriptName = "The Mimic" --jigoku
end
task.wait()
if placeId == 3475397644 or placeId == 5391312853 or placeId == 3752680052 or placeId == 4174118306 or placeId == 3475419198 or placeId == 3475422608 or placeId == 4601778915 or placeId == 4869039553 or placeId == 5777228223 or placeId == 3623549100 or placeId == 3737848045 or placeId == 3487210751 or placeId == 4728805070 or placeId == 5777228223 then
    _G.ScriptName = "Dragon Adventure" --NormalWorld
end
task.wait()
if placeId == 1962086868 or placeId == 3582763398 then
    _G.ScriptName = "Tower Of Hell"
end
task.wait()
if _G.ScriptName == "The Mimic" then
  loadstring(request({['Url']='https://bin.ttjyhub.cloud/TheMimic', ['Method']='GET'}).Body)()
elseif _G.ScriptName == "Dragon Adventure" then
    --loadstring
elseif _G.ScriptName == "Tower Of Hell" then
    --loadstring
else
    game.Players.LocalPlayer:Kick("Not supported")
end
