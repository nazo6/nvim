 (Get-Content init.lua) -replace 'local profile = false', 'local profile = true' | Out-File -encoding UTF-8 init.lua

nvim -c ":q"

inferno-flamegraph profile.log > flame.svg

 (Get-Content init.lua) -replace 'local profile = true', 'local profile = false' | Out-File -encoding UTF-8 init.lua
