---@diagnostic disable: undefined-global
function getRelease()
  local handle = io.popen('git fetch --tags 2> /dev/null && git tag --sort=-creatordate | head -n 1')
  if handle ~= nil then
    local result = handle:read("*a")
    handle:close()
    -- result ~ v1.15.2\n
    result = string.gsub(result, "\n", "")

    -- result ~ v1.15.2 -> 1, 15+1, 2
    local major_str, minor_str, patch_str = string.match(result, "v(%d+)%.(%d+)%.(%d+)")
    if not major_str then
      return "no release"
    end
    local major = tonumber(major_str)
    local minor = tonumber(minor_str)
    minor = minor + 1

    -- result ~ 1.16.0 (no "v" because that would be a tag)
    result = string.format("%d.%d.0", major, minor)

    return result
  end
  return 'no release'
end

return {
  s("nrelease", { f(getRelease, {}, {}) }),
}
