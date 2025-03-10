local M = {}

function M.create_script_file_from_json(opts)
  -- Get the selected JSON block from the range (opts.line1 and opts.line2 are the range)
  local json = table.concat(vim.fn.getline(opts.line1, opts.line2), "\n")

  -- Extract the 'name' and 'script' values using pattern matching
  local name = json:match('"name": "%s*([^"]+)%s*"')
  local script = json:match('"script": "(.*)"')

  -- Convert name to underscore format and remove forward slashes
  name = name:gsub("/", "_"):gsub("%s+", "_"):gsub("[^a-zA-Z0-9_]", "")
  local filename = name .. '.lua'

  -- Get the current directory where the JSON file is located
  local dir = vim.fn.expand('%:p:h')

  -- Create the file path
  local file_path = dir .. '/' .. filename

  -- modify script special chars
  script = script:gsub("\\n", "\n") -- Replace \n with actual newline
      :gsub("\\t", "\t")            -- Replace \t with actual tab
      :gsub("\\\"", "\"")           -- Replace \" with actual "
      :gsub("\\\\", "\\")           -- Replace \\ with actual backslash


  -- Write the script into the file
  local file = io.open(file_path, "w")
  if file then
    file:write(script)
    file:close()
    print("Created " .. file_path)
  else
    print("Error: could not open file " .. file_path)
  end
end

-- Create a command to run the function and accept a range (visual mode)
vim.api.nvim_create_user_command('MuddlerFix', function(opts)
  M.create_script_file_from_json(opts)
end, { range = true })

return M
