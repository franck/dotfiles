return {
  -- Before
  s({
    trig = "bef",
    namr = "Before",
    dscr = "Super simple before end block",
  }, fmt([[
before do
  {}
end
]],
    {
      i(0),
    }
  )),

  s({
    trig = "test",
    namr = "New rails test",
    dscr = "New test",
  }, fmt([[
require 'test_helper'

class {}Test < ActiveSupport::TestCase
  {}
end
]],
    {
      i(1),
      i(0),
    }
  )),

  -- New rails spec rspec
  s({
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
      i(1),
      i(0),
    }
  )),

  -- New rails feature spec
  s({
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
      i(1),
      i(0),
    }
  )),

  -- Describe
  s({
    trig = "des",
    namr = "Describe",
    dscr = "Super simple describe block",
  }, fmt([[
describe '{}' do
  {}
end
]],
    {
      i(1),
      i(0),
    }
  )),

  -- Context
  s({
    trig = "con",
    namr = "Context block",
    dscr = "Super simple context block",
  }, fmt([[
context '{}' do
  {}
end
]],
    {
      i(1),
      i(0),
    }
  )),

  -- it
  s({
    trig = "it",
    namr = "It block",
    dscr = "Super simple it block",
  }, fmt([[
it '{}' do
  {}
end
]],
    {
      i(1),
      i(0),
    }
  )),

  -- Save and open page
  s({
    trig = "sop",
    namr = "Save and open page",
    dscr = "Lunchy gem helper",
  }, t('save_and_open_page')),

  -- Byebug
  s({
    trig = "bb",
    namr = "Byebug",
  }, t('byebug')),

  -- expect(page).to have_content
  s({
    trig = "ept",
    namr = "expect(page).to have_content",
    dscr = "Capybara matcher",
  }, fmt("expect(page).to have_content {}", i(0))),
}
