local M = {}

function M.create_script_files_from_json(opts)
  -- Get the selected JSON block from the range (opts.line1 and opts.line2 are the range)
  local json = table.concat(vim.fn.getline(opts.line1, opts.line2), "\n")

  -- Clean up any leading or trailing whitespace
  json = json:match("^%s*(.-)%s*$")

  -- Parse the JSON content
  local json_data, err = vim.fn.json_decode(json)

  -- Check if JSON parsing was successful
  if err then
    print("Error parsing JSON: " .. err)
    return
  end

  -- Function to process each JSON object
  local function process_json_object(obj)
    local name = obj.name
    local script = obj.script

    -- Convert name to underscore format and remove forward slashes
    name = name:gsub("/", "_"):gsub("%s+", "_"):gsub("[^a-zA-Z0-9_]", "")
    local filename = name .. '.lua'

    -- Get the current directory where the JSON file is located
    local dir = vim.fn.expand('%:p:h')

    -- Create the file path
    local file_path = dir .. '/' .. filename

    -- Modify script special chars
    script = script:gsub("\\n", "\n") -- Replace \n with actual newline
        :gsub("\\t", "\t")            -- Replace \t with actual tab
        :gsub("\\\"", "\"")           -- Replace \" with actual "
        :gsub("\\\\", "\\")           -- Replace \\ with actual backslash

    -- Open the file for writing (create it if it doesn't exist)
    local file = io.open(file_path, "w")
    if file then
      -- Write the script content to the file
      file:write(script)
      file:close() -- Close the file after writing

      -- Notify the user
      print("Created " .. file_path)
    else
      -- If file could not be opened, notify the user
      print("Error: Could not open file " .. file_path)
    end
  end

  -- Check if JSON data is an array (multiple objects) or a single object
  if type(json_data) == "table" then
    if #json_data > 0 then
      -- If it's an array, process each object in the array
      for _, obj in ipairs(json_data) do
        process_json_object(obj)
      end
    else
      print("Error: Empty JSON array.")
    end
  else
    print("Error: Invalid JSON format.")
  end
end

-- Create a command to run the function and accept a range (visual mode)
vim.api.nvim_create_user_command('MuddlerFixAll', function(opts)
  M.create_script_files_from_json(opts)
end, { range = true })

return M
