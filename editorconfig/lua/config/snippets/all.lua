return {
  s(
    { trig = "hi" },
    { t("Hello, world!") }
  ),
  s(
    { trig = "date", namr = "Date", dscr = "Date in the form of DD-MM-YYYY", },
    { f(function(_, snip)
      return os.date("%d-%m-%Y")
    end) }
  ),
}
