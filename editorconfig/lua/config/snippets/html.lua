return {
  s({
    trig = "html",
    namr = "HTML tag",
  }, fmt([[
<html>
  {}
</html>
]],
    {
      i(0),
    }
  )),
  s({
    trig = "div",
    namr = "div tag",
  }, fmt([[
<div>
  {}
</div>
]],
    {
      i(0),
    }
  )),
}
