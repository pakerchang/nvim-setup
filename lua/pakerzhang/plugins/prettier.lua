local status, prettier = pcall(require, "prettier")
if not status then
  return
end

prettier.setup({
  ["null_ls"] = {
    condition = function()
      return prettier.config_exists({
        check_package_json = true,
      })
    end,
    runtime_condition = function(params)
      return true
    end,
    timeout = 5000,
  },
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_attribute_pre_line = false,
    single_quote = false,
    tab_width = 3,
    trailing_comma = "es5",
    use_tabs = true,
    vue_indent_script_and_style = false,
  },
})
