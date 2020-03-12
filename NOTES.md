# Plugins to try

- Alternate
- Bufferize
- Commentary, NerdCommenter
- Easy-align, Tabular
- Far
- Gitgutter
- Undoquit
- Vimade
- Quickfix-reflector, Qfgrep

# Cleanup

All files are now sourced from the cleanup folder, making it easier to control
what is sourced before/after plugins. `mappings.vim`, `settings.vim` and
`commands.vim` could probably be broken into smaller files that deal with
particular aspects of the configuration (moving around, completion, etc.)

# Make vim fast again

Nvim startup is also now getting higher. When we want the full IDE features,
this is not a problem, but it should be possible to have a light configuration,
maybe using the alias `lvim`. Options are :

1. Use different programs (i.e. vim and nvim) as editor and IDE.
2. Use a global flag (i.e. `g:lightConfig`) during loading to choose what to
   include, and then use `alias lvim="nvim -c 'let g:lightConfig=1'"`)
3. Use different entry points (`init.vim` and `linit.vim` for example), and
   then use `alias lvim="nvim -u ~/.config/nvim/linit.vim"`.

The best solution should have minimal impact on the dotfiles config (number 1
and 3 are worse here), and allow to easily switch from light config to full
config (number 3 makes this really easy, number 2 should not be too bad, and
number 1 makes this almost impossible).
