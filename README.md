## Install: 

clone the repo :

```
git clone <this_repo>
```

update the submodules

```
git submodule init
git submodule update
```

point your .vimrc to this repo :

```
ln -sf ~/.vimrc <this_repo>/vimrc
```
Or
```
echo "source <this_repo>/vimrc" > ~/.vimrc
```

For plugins to work this has to be in your packpath. If needed add the
following line to your .vimrc : 
``` 
set packpath=<this_repo> 
```
