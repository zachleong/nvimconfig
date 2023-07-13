local line_begin = require("luasnip.extras.expand_conditions").line_begin

local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- IMPLIES, i.e. \implies
  s({trig = ">>", snippetType="autosnippet"},
    {
      t("\\implies "),
    }
  ),
  -- CDOTS, i.e. \cdots
  s({trig = "cdd", snippetType="autosnippet"},
    {
      t("\\cdots"),
    }
  ),
  -- LDOTS, i.e. \ldots
  s({trig = "ldd", snippetType="autosnippet"},
    {
      t("\\ldots"),
    }
  ),
  -- EQUIV, i.e. \equiv
  s({trig = "eqq", snippetType="autosnippet"},
    {
      t("\\equiv "),
    }
  ),
  -- INTEGRAL with upper and lower limit
  s({trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = in_mathzone}
  ),
  -- ABSOLUTE VALUE
s({trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType="autosnippet"},
fmta(
  "<>\\abs{<>}",
  {
    f( function(_, snip) return snip.captures[1] end ),
    d(1, get_visual),
  }
),
{condition = in_mathzone}
),
s({trig = "sum", snippetType="autosnippet"},
  fmta(
    "\\sum_{<>}^{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),
s({trig = "sum", snippetType="autosnippet"},
  fmta(
    "\\sum_{<>}^{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),
s({trig = "ff", snippetType="autosnippet"},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),
s({trig="inff", snippetType="autosnippet"},
  {
    t("\\infty"),
  },
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),
s({trig=";a", snippetType="autosnippet"},
  {
    t("\\alpha"),
  }
),
s({trig=";b", snippetType="autosnippet"},
  {
    t("\\beta"),
  }
),
s({trig=";d", snippetType="autosnippet"},
  {
    t("\\delta"),
  }
),
s({trig=";e", snippetType="autosnippet"},
  {
    t("\\epsilon"),
  }
),
s({trig=";g", snippetType="autosnippet"},
  {
    t("\\gamma"),
  }
),
-- \frac
s({trig="//", dscr="Expands 'ff' into '\frac{}{}'"},
  fmta(
    "\\frac{<>}{<>}<>",
    {
      i(1),
      i(2),
      i(0)
    }
  )
),
s(
{trig="inf"},
    t("\\infty")
),
s(
{trig="temp"},
    fmta([[
    % arara: pdflatex

    \documentclass[a4paper]{article}
    \usepackage{amsmath}
    \usepackage{amssymb}
    \usepackage{amsthm}
    \usepackage{tikz}
    \usetikzlibrary{automata, arrows.meta, positioning}
    \parindent 0pt

    \title{<>}
    \author{Zach Leong: z5218549}
    \date{}
    \begin{document}
    \maketitle
    <>
    \end{document}
    ]], 
    {i(1), i(0)})
),

s({trig="set", dscr=""},
  fmta(
     [[ \{ <> \} ]],
     { i(0) }
  )
),

s({trig="mbb", dscr="Expands 'eq' into an equation environment"},
  fmta(
     [[ \mathbb{<>}<> ]],
     { i(1),i(0) }
  )
),
-- Equation
s({trig="eq", dscr="Expands 'eq' into an equation environment"},
  fmta(
     [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
     { i(1) }
  )
),
s({trig="pr", dscr="Begins proof environment"},
    fmta(
        [[
        \begin{proof}
            <>
        \end{proof}
        ]], {i(0)}
    )
),
s({trig="beg", dscr="Begins general environment", snippetType="autosnippet"},
    fmta(
        [[
        \begin{<>}
            <>
        \end{<>}
        ]], {i(1), i(0), rep(1)}
    ),
    {condition=line_begin}
),

s({trig = "h1", snippetType="autosnippet", dscr="Top-level section"},
  fmta(
    [[\section{<>}]],
    { i(1) }
  ), 
  {condition = line_begin}  -- set condition in the `opts` table
),

s({trig="it", dscr="item snippet"},
    fmta(
        [[
        \item <>
        ]], {i(0)}
        )
),

s({trig="list", dscr="Begins list environment"},
    fmta(
        [[
        \begin{list}
            <>
        \end{list}
        ]], {i(0)}
    )
),

s({trig = "([^%w])mk", regTrig = true, wordTrig=false, snippetType="autosnippet", dscr="Inline math"},
    fmta(
        "<>$<>$<>",
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0)
        }
    )
),

s({trig = "([^%w])dk", regTrig = true, wordTrig=false, snippetType="autosnippet", dscr="Display math"},
    fmta(
    [[<>
    \[
    <>
    .\]
    ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(0)
        }
    )
),

-- s({trig = "(%a)(%d)", regTrig = true, snippetType="autosnippet", dscr="Subscript 1"},
--     fmta(
--         "<>_{<>}",
--         {
--           f( function(_, snip) return snip.captures[1] end ),
--           f( function(_, snip) return snip.captures[2] end ),
--         }
--     ),
--     {condition=in_mathzone}
-- ),

s({trig = "(%a)td", regTrig=true, dscr="Superscript"},
    fmta(
        [[<>^{<>}<>]],
        {
            f( function(_, snip) return snip.captures[1] end ),
            i(1),
            i(0)
        }
    )
),
s({trig = '([%a%)%]%}])tt', regTrig = true, wordTrig = false, snippetType="autosnippet", dscr="Superscript 2"},
  fmta(
    "<>^{<>}<>",
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
      i(0)
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),
s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType="autosnippet", dscr="Subscript 2"},
  fmta(
    "<>_{<>}<>",
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
      i(0)
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

s({trig = "(%a)pr", regTrig = true, snippetType="autosnippet", dscr="Prime autosnippet"},
    fmta(
        [[<>^{\prime}]],
        {
          f( function(_, snip) return snip.captures[1] end )
        }
    )
),
}
