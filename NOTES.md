# Things to try

- omnibar : Denite is pretty complete, but heavy and sometimes buggy
    - should try fzf / crtlp again ? probably not
    - Denite is the last heavyweight, python3 / neovim only pluggins. The dream
      of a powerfull, vim-compatible config is alive again. Most of the crazy
      Denite stuff I never use anyways. The most popular alternative now is
      vim-clap, but fzf is already installed in the main config

- vim-sandwitch is apparently stricly better than vim-surround. try it someday.

- note-taking pluggins, are they worht it ?

# Cleanup

There is now a runtime directory in this repo. Many self-contained pieces of
config could go in a plugin file there. It would be easier to understand and
maintain than the current architecture (`mappings.vim`, `commands.vim` and
`settings.vim`). plugin configuration could also be done more precisely using
the `after` folder. Most of the config directory should in fact end up in the
runtime.

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

# Project specific config

More and more projects will have specific configuration (language server
settings, custom completion sources, options to save/store layout, custom
filetype detection). Should we just have a .vim script in there that we source,
or a directory containing .vim files for each project (including cd directives)
(can be plugged into fzf), or use a project management plugin (does that even
exist?)? Only experience will tell.
