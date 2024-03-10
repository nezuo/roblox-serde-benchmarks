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

The numbers are approximate average FPS.

| Mode | Booleans | StructOfNumbers |
|--|--|--|
| Roblox  | 18 | 5 |
| Zap | 53 | 36 |
| ByteNet | 23 | 29 |
