-------------------------------------------------------------------------
-- Snippets
-------------------------------------------------------------------------
local luasnip_status_ok, ls = pcall(require, "luasnip")
if not luasnip_status_ok then
  return
end

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local fmt = require('luasnip.extras.fmt').fmt

-------------------------------------------------------------------------
-- All Snippets
-------------------------------------------------------------------------

local date = function() return { os.date('%d-%m-%Y') } end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of DD-MM-YYYY",
    }, {
      func(date, {})
    }),
  },
})


-------------------------------------------------------------------------
-- Ruby Snippet
-------------------------------------------------------------------------
-- ls.add_snippets('eruby', { })

ls.add_snippets('ruby', {

  -- Before
  snip({
    trig = "bef",
    namr = "Before",
    dscr = "Super simple before end block",
  }, fmt([[
    before do
    {}
  end
  ]],
    {
      insert(0),
    }
  )),

  -- New rails spec rspec
  snip({
    trig = "desc",
    namr = "New rails spec",
    dscr = "New describe",
  }, fmt([[
  require 'rails_helper'

  describe {} do
  {}
end
]],
    {
      insert(1),
      insert(0),
    }
  )),

  -- New rails feature spec
  snip({
    trig = "feat",
    namr = "New rails feature spec",
    dscr = "New feature",
  }, fmt([[
require 'rails_helper'

feature "{}" do
{}
        end
        ]],
    {
      insert(1),
      insert(0),
    }
  )),

  -- Describe
  snip({
    trig = "des",
    namr = "Describe",
    dscr = "Super simple describe block",
  }, fmt([[
        describe '{}' do
        {}
      end
      ]],
    {
      insert(1),
      insert(0),
    }
  )),

  -- Context
  snip({
    trig = "con",
    namr = "Context block",
    dscr = "Super simple context block",
  }, fmt([[
      context '{}' do
      {}
    end
    ]],
    {
      insert(1),
      insert(0),
    }
  )),

  -- it
  snip({
    trig = "it",
    namr = "It block",
    dscr = "Super simple it block",
  }, fmt([[
    it '{}' do
    {}
  end
  ]],
    {
      insert(1),
      insert(0),
    }
  )),

  -- Save and open page
  snip({
    trig = "sop",
    namr = "Save and open page",
    dscr = "Lunchy gem helper",
  }, text('save_and_open_page')),

  -- Byebug
  snip({
    trig = "bb",
    namr = "Byebug",
  }, text('byebug')),

  -- expect(page).to have_content
  snip({
    trig = "ept",
    namr = "expect(page).to have_content",
    dscr = "Capybara matcher",
  }, fmt("expect(page).to have_content {}", insert(0))),

})


-------------------------------------------------------------------------
-- Javascript Snippet
-------------------------------------------------------------------------

ls.add_snippets('javascript', {
  -- console.log
  snip({
    trig = "log",
    namr = "console.log()",
    dscr = "Console Logger",
  }, fmt("console.log({})", insert(0))),
})
