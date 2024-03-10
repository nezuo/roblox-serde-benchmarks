# Networking Serde Benchmarks

These benchmarks are a work in progress.

## Running the benchmarks
Run these commands:
`wally install`
`zap`
`rojo build -o out.rbxl`

Start the `out.rbxl` place.

## Results (Last Updated 3/10/2024)
These results were taken in Roblox Studio using Zap v0.6.2 and ByteNet v0.4.0.

The FPS and Network Send (KB/s) are eyeballed averages.

FPS comes from the `Ctrl + Shift + F5` menu.
Network Send (KB/s) comes from the `Overall (KB/s)` in the `Outgoing` section of the `Ctrl + Shift + F3` menu.

### Booleans
| Mode | FPS | Network Send (KB/s) |
|--|--|--|
| Roblox  | 18 | 37,000 |
| Zap | 53 | 7.8 |
| ByteNet | 23 | 3.5 |


### StructOfNumbers
| Mode | FPS | Network Send (KB/s) |
|--|--|--|
| Roblox  | 5 | 49,000 |
| Zap | 36 | 8.1 |
| ByteNet | 29 | 3.98 |
