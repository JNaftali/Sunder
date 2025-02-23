pills = {
"waterbreathing",
"kawhepill",
"acuity",
"steroid",
"stimulant",
"coagulation",
"thanatonin",
"paste",
"somnium",
"ototoxin",
"decongestant",
"amaurosis",
"depressant",
"antipsychotic",
"panacea",
"euphoriant",
"anabiotic",
"opiate",
"eucrasia",
}
for pillname in pairs(pills) do
 snd.send("buy "..matches[2].." "..pills[pillname])
end