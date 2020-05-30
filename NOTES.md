# Plugins to try

- Alternate
- Bufferize
- Commentary, NerdCommenter
- Easy-align, Tabular
- Far
- Undoquit
- Vimade
- Quickfix-reflector, Qfgrep
- Vimspector

# Vim vs. Nvim 

- Nvim gets <M-*> bindings right.
- Nvim makes it easier to use denite. The switch is not impossible.
- Nvim is out of date in debian repo.
- Native lsp interface feels irrelevant.

# Make vim fast again

Nvim startup is getting high. With the addition of project commands, we can
decide when to load all heavy plugins. Probably what should be done now is
eliminate as many plugins as possible in regular nvim, and load them via the
`ide` alias or the `Project` command.

A decent amount of nvim startup time is spend loading our custom plugin config,
maybe it's time to start using the autoload directory.
