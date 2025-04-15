# dailies.nvim

Calling [dailies](https://github.com/JachymPutta/dailies) inside neovim.
This plugin exposes `Dailies` function which will call dailies and either 
generate a new daily entry or open the existing one.

## Installation
The plugin itself can be install with any plugin manager.

> NOTE: The plugin depends on having the dailies binary available on your PATH!
> Refer to the [dailies repo](https://github.com/JachymPutta/dailies) for installation instruction

### Nix Flakes & [home-manager](https://github.com/nix-community/home-manager)
> NOTE: Samples are taken from [my dotfiles](https://github.com/JachymPutta/dotfiles)

1. **Add this and the dailies repo as inputs**
```nix
inputs = {
    dailies.url = "github:JachymPutta/dailies";
    dailies-nvim = {
      url = "github:JachymPutta/dailies.nvim";
      flake = false;
    };
    ...
}
```
2. **Overlay**
```nix
dailies = inputs.dailies.packages.${system}.dailies;
vimPlugins = prev.vimPlugins // {
  dailies-nvim = prev.vimUtils.buildVimPlugin {
    name = "dailies-nvim";
    pname = "dailies-nvim";
    src = inputs.dailies-nvim;
  };
};
```
3. **Use the packages**
```nix

home = {
    ...
    packages =
      with pkgs;
      [
        dailies
        ...
      ];
};
```
and the plugin
```nix

programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      dailies-nvim
      ...
}
```
### Other package managers

Using other package managers requires installing the `dailies` binary manually.
Please refer to the [dailies repo](https://github.com/JachymPutta/dailies) for more instructions.

#### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { 'JachymPutta/dailies.nvim' }
```

#### Using [vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'JachymPutta/dailies.nvim'
```

#### Using [dein](https://github.com/Shougo/dein.vim)

```viml
call dein#add('JachymPutta/dailies.nvim')
```

