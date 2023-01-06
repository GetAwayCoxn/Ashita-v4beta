# About Lockpick

Lockpick is a helper for unlocking treasure caskets in Final Fantasy XI, designed as an addon for [Windower 5](https://github.com/Windower/packages/wiki) and [Windower 4](http://windower.net).

This project is a complete rewrite of my old Windower 4 addon of a different name.

## Windower 4 Limitations

If FFXI was installed to a non-default location,[^1] you will need to manually edit the `client_path.xml` settings file.

[^1]: The default install location is `C:\Program Files (x86)\PlayOnline\SquareEnix\Final Fantasy XI\`

# Installation

## Automatic (Windower 5 only)

> Windower 5 will also keep lockpick up-to-date if you install with this method.

```
/pkg addsrc https://svanheulen.gitlab.io/lockpick
/install lockpick
```

## Manual

The latest version is always available here: https://svanheulen.gitlab.io/lockpick/lockpick.zip

When using Windower 4 you will need to extract the archive to the `addons` folder. By default the `addons` folder will be inside the same folder as the `Windower.exe`.

When using Windower 5 you will need to extract the archive to the `packages` folder. By default that will be located at `%LOCALAPPDATA%\Windower\packages`.

# Usage

When lockpick is loaded it will automatically show you possible combinations, the best combination to guess and the odds of opening a brown treasure casket when you interact with it.

