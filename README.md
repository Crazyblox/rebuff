# rebuff
Helper module designed to help reduce the verbosity of interacting with Luau's buffer type.

Performance has been considered while writing this module; use of the stack and self-recursive calls exceeds other user code, with the only exception being hard-coded user read/write functions.

This module was created after proposing the [buffer.pack*/unpack* RFC](https://github.com/luau-lang/rfcs/pull/233).

## How to use:
```luau
-- Require the module
local rebuff = require(`./rebuff`)

-- Let's create a buffer to reason with.
local b = buffer.create(32)

-- Say we have a vector... let's store that in the buffer with rebuff.packf32().
local v_pack = vector.create(8, 16, 24)
rebuff.packf32(b, 0, v_pack.x, v_pack.y, v_pack.z)

-- Say we need to interact with the data as a vector from the buffer... let's do direct data-to-constructor!
local v_unpack = vector.create(rebuff.unpackf32(b, 0, 3))
print(v_unpack) --> vector(8, 16, 24)
```

## API

| Function | Signature | Description |
|----------|-----------|-------------|
| `packi8` | `packi8(buffer, offset, ...values)` | Writes one or more signed 8-bit integers into a buffer starting at `offset`. |
| `packu8` | `packu8(buffer, offset, ...values)` | Writes one or more unsigned 8-bit integers into a buffer starting at `offset`. |
| `packi16` | `packi16(buffer, offset, ...values)` | Writes one or more signed 16-bit integers into a buffer starting at `offset`. |
| `packu16` | `packu16(buffer, offset, ...values)` | Writes one or more unsigned 16-bit integers into a buffer starting at `offset`. |
| `packi32` | `packi32(buffer, offset, ...values)` | Writes one or more signed 32-bit integers into a buffer starting at `offset`. |
| `packu32` | `packu32(buffer, offset, ...values)` | Writes one or more unsigned 32-bit integers into a buffer starting at `offset`. |
| `packf32` | `packf32(buffer, offset, ...values)` | Writes one or more 32-bit floating-point values into a buffer starting at `offset`. |
| `packf64` | `packf64(buffer, offset, ...values)` | Writes one or more 64-bit floating-point values into a buffer starting at `offset`. |
| `unpacki8` | `unpacki8(buffer, offset, count)` | Returns `count` signed 8-bit integers from a buffer starting at `offset`. |
| `unpacku8` | `unpacku8(buffer, offset, count)` | Returns `count` unsigned 8-bit integers from a buffer starting at `offset`. |
| `unpacki16` | `unpacki16(buffer, offset, count)` | Returns `count` signed 16-bit integers from a buffer starting at `offset`. |
| `unpacku16` | `unpacku16(buffer, offset, count)` | Returns `count` unsigned 16-bit integers from a buffer starting at `offset`. |
| `unpacki32` | `unpacki32(buffer, offset, count)` | Returns `count` signed 32-bit integers from a buffer starting at `offset`. |
| `unpacku32` | `unpacku32(buffer, offset, count)` | Returns `count` unsigned 32-bit integers from a buffer starting at `offset`. |
| `unpackf32` | `unpackf32(buffer, offset, count)` | Returns `count` 32-bit floating-point values from a buffer starting at `offset`. |
| `unpackf64` | `unpackf64(buffer, offset, count)` | Returns `count` 64-bit floating-point values from a buffer starting at `offset`. |
