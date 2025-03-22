project = 'Sunder'
title = 'Sunder System'
description = 'Documentation for Sunder, an Aetolian Mudlet system'

file = {
  'src/'
}

output = 'index'

format = 'markdown'
style = false
sort = false
merge = true
not_luadoc = true

kind_names = {
  ['function'] = 'Functions',
  ['table'] = 'Tables',
  ['field'] = 'Fields',
  ['module'] = 'Modules',
}

custom_tags = {
  { 'section', title = 'Section', hidden = false },
}
