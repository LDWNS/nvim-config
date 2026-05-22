---@diagnostic disable: undefined-global

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function capitalize_first(args)
  local text = args[1][1] or ""
  if text == "" then return "" end
  return text:sub(1, 1):upper() .. text:sub(2)
end
return {
  -- s( {trigger="link"...}) = s("link", {...})
  s({ trig = "gwith", descr = "Generate \"with\" method." }, {
    t("public "),
    i(1, "ReturnType"),
    t(" with"),
    f(capitalize_first, { 3 }),
    t("("),
    i(2, "FieldType"),
    t(" "),
    i(3, "fieldName"),
    t({ ") {", "    this." }),
    rep(3),
    t(" = "),
    rep(3),
    t({ ";", "    return this;", "}" })
  })
}
