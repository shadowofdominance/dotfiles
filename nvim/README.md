Heres's How to install this configuration!

First Backup old configuration.

mv ~/.config/nvim ~/.config/nvim-old


Or remove old nvim config.

rm -rf ~/.config/nvim

Remove local/state and local/share

rm -rf ~/.local/state/nvim

rm -rf ~/.local/share/nvim


Install NvChad

git clone https://github.com/shadowofdominance/nvim.git ~/.config/nvim && nvim

And You are good to go!
