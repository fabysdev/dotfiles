local function file_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == 'file'
end

local function to_set(list)
  local set = {}

  for _, v in ipairs(list) do
    set[v] = true
  end

  return set
end

local current_file_dir = vim.fn.expand '%:p:h'
local devcontainer_json_path = current_file_dir .. '/' .. '.devcontainer/devcontainer.json'

local devcontainer_customizations = {
  lsb_servers = {},
  lsb_formatters = {},
  treesitter_configs = {},
}

if file_exists(devcontainer_json_path) then
  local json_data = vim.fn.readfile(devcontainer_json_path)

  local cleaned_json = {}
  for _, line in ipairs(json_data) do
    line = line:gsub('//.*$', '')
    line = line:gsub('/%*.*%*/', '')
    line = line:match '^%s*(.-)%s*$'
    if line ~= '' then
      table.insert(cleaned_json, line)
    end
  end

  local json_string = table.concat(cleaned_json, '\n')
  local success, parsed = pcall(vim.json.decode, json_string)
  if not success then
    print('failed to parse devcontainer.json', json_string)
    return devcontainer_customizations
  end

  local customizations = parsed.customizations
  if customizations ~= nil then
    local neovim_customizations = customizations.neovim
    if neovim_customizations ~= nil then
      if neovim_customizations.lsb_servers ~= nil then
        devcontainer_customizations.lsb_servers = to_set(neovim_customizations.lsb_servers)
      end

      if neovim_customizations.lsb_formatters ~= nil then
        devcontainer_customizations.lsb_formatters = to_set(neovim_customizations.lsb_formatters)
      end

      if neovim_customizations.treesitter_configs ~= nil then
        devcontainer_customizations.treesitter_configs = neovim_customizations.treesitter_configs
      end
    end
  end
end

return devcontainer_customizations
