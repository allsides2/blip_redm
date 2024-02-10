# RedM Blip Manager Script

## Introduction

This Lua script is designed to manage blips for various locations in Red Dead Redemption 2 using the RedM.

## Features

- Adds blips for specified locations.
- Allows customization of blip names, icons, colors, and positions.
- Provides functions for adding and removing blips dynamically during gameplay.
- Cleans up blips when the resource is stopped to avoid lingering blips.

## Configuration

The script provides a configuration table `Config` where you can specify the blip settings:

- `Blips`: Array of tables, each representing a blip with properties such as name, icon, position, and color.
- `BlipColors`: Table mapping color names to blip color modifier constants.

You can customize the blip settings according to your server's needs by modifying the `Config` table in the script file.

## Usage

1. Ensure you have the script installed in your RedM server's resources directory.
2. Start your RedM server.
3. Blips will be automatically added for each location specified in the `Config` table when the script is started.
4. Customize blip settings and positions as needed by modifying the `Config` table.
5. Blips will be removed automatically when the resource is stopped to avoid clutter.

## Customization

You can customize the blip settings by modifying the `Config` table in the script file:

- Add or remove blips by adjusting the `Blips` array.
- Customize blip names, icons, positions, and colors to suit your server's needs.
- Use the `BlipColors` table to map color names to blip color modifier constants.


