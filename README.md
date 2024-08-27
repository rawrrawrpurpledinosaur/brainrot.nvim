# brainrot.nvim

`brainrot.nvim` is a fun Neovim plugin that plays a video (brainrot.mp4) directly within a Neovim buffer. Whether you need a break or just want some visual stimulation while coding, this plugin has you covered!

## Features

- Play the video `brainrot.mp4` within a Neovim buffer.
- Activate the video manually using the `:Brainrot` command.
- Enable auto-play on startup by setting an option in your Neovim config.

## Requirements

- **Neovim** 0.5 or later
- **mpv** with support for `--vo=tct` (True Color Terminal Video Output)
- A terminal that supports true color

## Installation

You can install `brainrot.nvim` using your favorite plugin manager. Here are a few examples:

### Using [Packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'rawrrawrpurpledinosaur/brainrot.nvim',
  config = function()
    require('brainrot').setup({ auto_play = true })  -- Enable auto-play on startup
  end
}

