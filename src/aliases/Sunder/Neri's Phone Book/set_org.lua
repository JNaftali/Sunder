npb.set_city(matches[2], matches[3])
npb.echo("Set <green>"..matches[2]:title().."<reset>'s city to <yellow>"..matches[3]:title().."<reset>.\n")
npb.help_handled = true