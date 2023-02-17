This is my neovim config.

init.lua
- runs the loader
- runs the plugins
- loads configs

loader.lua
- sets up packer and loads all plugins

plugins init
- requires and loads all plugin configs

core
- keymaps, config, autocmd

To add a plugin:
1. add it in the loader so that packer downloads it
2. add a config file to ./lua/plugins
3. make sure the plugin config file is loaded by ./lua/plugins/init.lua
