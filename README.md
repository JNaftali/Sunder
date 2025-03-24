## Introduction

These are the Sunder project files, a system for the game Aetolia running in the
Mudlet client.

## Social

Feel free to join us in the Sunder discord server to get help with the system
and get the latest updates: https://discord.gg/eqzmKf4z4k

## Installation

1. You will need Mudlet to start, if this is your first time using Mudlet, you
   can download the newest version here: https://www.mudlet.org/download/
2. Get the latest release from the releases page or the discord server. If you
   are looking for a GUI those are available for download in the Sunder discord
   (linked above)
3. Create a new profile in Mudlet
4. Use the Package Manager to install the Sunder.mpackage
5. Log into your Aetolia character and enter `?setup` into the prompt to
   configure everything
6. Set your separator with `CONFIG SEPARATOR <separator>`. NOTE: This needs to
   be different than your Mudlet separator, if it isn't then things will go
   horribly wrong
7. Log out and close Mudlet completely
8. Reopen Mudlet and log back in
9. Open Options > Preferences > Mapper > Download latest map provided by your
   game
10. Have fun!

## Building

If you wish to build from source, there is a flake.nix that can be called from
`nix build`. You will need the nix toolchain installed
(https://nixos.org/download/). If you do not wish to install the nix toolchain,
then check out the project https://github.com/demonnic/muddler to get
instructions on how to build the binary and run it.

## Contributing

Contributions are welcome, but please join the Sunder Discord to see open issues
that are work in progress and communicate with the rest of the Sunder team.
