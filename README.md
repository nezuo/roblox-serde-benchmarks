# Networking Serde Benchmarks

These benchmarks are a work in progress.

## Running the benchmarks
Run these commands:
`wally install`
`zap`
`rojo build -o out.rbxl`

Start the `out.rbxl` place.

## Results (Last Updated 3/10/2024)
These results were taken in Roblox Studio using Zap v0.6.2 and ByteNet v0.4.3.

The FPS and Network Send (KB/s) are eyeballed averages.

FPS comes from the `Ctrl + Shift + F5` menu.

Network Send (KB/s) comes from the `Overall (KB/s)` in the `Outgoing` section of the `Ctrl + Shift + F3` menu.

Network Send is benchmarked by firing remotes at a constant rate of once per second so that FPS doesn't affect the results.

### [Booleans](https://github.com/nezuo/roblox-serde-benchmarks/blob/main/src/client/Benches/Booleans.lua)
| Mode | FPS | Network Send (KB/s) |
|--|--|--|
| Roblox  | 18 | 2150 |
| Zap | 53 | 0.76 |
| ByteNet | 37.5 | 0.76 |

### [StructOfNumbers](https://github.com/nezuo/roblox-serde-benchmarks/blob/main/src/client/Benches/StructOfNumbers.lua)
| Mode | FPS | Network Send (KB/s) |
|--|--|--|
| Roblox  | 5 | 8500 |
| Zap | 36 | 1.43 |
| ByteNet | 39 | 1.43 |
