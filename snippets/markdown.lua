---@diagnostic disable: undefined-global
return {
  -- s( {trigger="link"...}) = s("link", {...})
  -- a for anchor tag: a -> (\1)[\2]
  s({ trig = "link", dscr = "link" },
    { t("["), i(1), t("]("), i(2), t(")") }),
  -- <img> tag for markdown
  -- s({ trig = "himg"},
  --     { t("<img href\""), i(1), t("\" alt=\""), i(2), t("\" height=\""), t("\" alt=\""), t(")") }),
  s({ trig = "himg", descr = "html img" }, {
    t('<img src="'), i(1), t('" alt="'), i(2), t('" height="'), i(3, "400px"), t('" width="'), i(4, "auto"), t(
    '" align="'), i(5, "right"), t('">')
  }),
  -- currency: yen -> ¥
  s("yen", { t("¥") }),
  -- currency: euro -> €
  s("euro", { t("€") }),
  -- currency: dollar -> $
  s("dollar", { t("$") }),

  -- insert today's date: Day DD.MM.YYYY (https://www.lua.org/pil/22.1.html)
  s("today", { t(os.date("%A %d.%m.%y")) }),
  -- yesterday = today - 24 hours
  s("yesterday", { t(os.date("%A %d.%m.%y", os.time() - 24 * 60 * 60)) }),
  -- tomorrow = today + 24 hours
  s("tomorrow", { t(os.date("%A %d.%m.%y", os.time() + 24 * 60 * 60)) }),
}
