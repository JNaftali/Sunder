local count = 0
npb.help_handled = true
for i,v in pairs(npb.t.people) do
	count = count + 1
end
npb.echo("       Neri's PhoneBook Settings")
echo("\n ")
npb.echo((snd.toggles.highlights and "<green>We are" or "<red>We are not").."<NavajoWhite> currently highlighting names.")
cecho("\n       <NavajoWhite>      Total of <white>"..count.."<NavajoWhite> names!\n\n")

npb.echo("       Highlight settings:")
for city, colour in pairs(npb.t.config.colors) do
	cecho("\n <"..colour..">"..city:title().."<white>"..string.rep(" ", 12-string.len(city)).."citizens will be highlighted in <"..colour..">"..colour..".")
end