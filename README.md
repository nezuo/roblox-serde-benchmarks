# Networking Serde Benchmarks

These benchmarks are a work in progress.

## Running the benchmarks
Run these commands:
`wally install`
`zap`
`rojo build -o out.rbxl`

Start the `out.rbxl` place.

## Results (Last Updated 8/16/2024)
These results were taken in Roblox Studio using Zap v0.6.12, ByteNet v0.4.6, and Blink v0.14.6.

The FPS and Network Send (KB/s) are eyeballed averages.

FPS comes from the `Ctrl + Shift + F5` menu.

Network Send (KB/s) comes from the `Overall (KB/s)` in the `Outgoing` section of the `Ctrl + Shift + F3` menu.

Network Send is benchmarked by firing remotes at a constant rate of once per second so that FPS doesn't affect the results.

### [Booleans](https://github.com/nezuo/roblox-serde-benchmarks/blob/main/src/client/Benches/Booleans.lua)
| Mode | FPS | Network Send (KB/s) |
|--|--|--|
| Roblox | 19 | 2100 |
| Zap | 48 | 0.8 |
| ByteNet | 36.5 | 0.8 |
| Blink | 71 | 0.8 |

### [StructOfNumbers](https://github.com/nezuo/roblox-serde-benchmarks/blob/main/src/client/Benches/StructOfNumbers.lua)
| Mode | FPS | Network Send (KB/s) |
|--|--|--|
| Roblox  | 6 | 9500 |
| Zap | 36 | 1.5 |
| ByteNet | 37.5 | 1.5 |
| Blink | 38 | 1.6 |