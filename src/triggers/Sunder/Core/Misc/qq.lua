local stable_check = {
	Enorian = "enorianstable",
	Spinesreach = "spinesreachstable",
	Bloodloch = "bloodlochstable",
	Duiran = "duiranstable"
}

snd.send("qdmount"..snd.sep.."return mount "..stable_check[gmcp.Char.Status.city])

snd_toggleSave(true)