## Install: 

Clone the repo with the submodules (plugins) :

```
git clone --recursive <this_repo>
```

Point your `.vimrc` (and/or `init.vim`) to this repo :

```
ln -sf ~/.vimrc <this_repo>/vimrc
ln -sf ~/.config/nvim/init.vim <this_repo>/vimrc
```
Or
```
echo "source <this_repo>/vimrc" > ~/.vimrc
echo "source <this_repo>/vimrc" > ~/.config/nvim/init.vim
```

