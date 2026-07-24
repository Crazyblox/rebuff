--!strict
--!optimize 2
--!native

local function packu8(b: buffer, i: number, v: number, ...): ()
  if not v then return end
  buffer.writeu8(b, i, v)
  packu8(b, i + 1, ...)
end

local function packu16(b: buffer, i: number, v: number, ...): ()
  if not v then return end
  buffer.writeu16(b, i, v)
  packu16(b, i + 2, ...)
end

local function packu32(b: buffer, i: number, v: number, ...): ()
  if not v then return end
  buffer.writeu32(b, i, v)
  packu32(b, i + 4, ...)
end

local function packf32(b: buffer, i: number, v: number, ...): ()
  if not v then return end
  buffer.writef32(b, i, v)
  packf32(b, i + 4, ...)
end

local function packf64(b: buffer, i: number, v: number, ...): ()
  if not v then return end
  buffer.writef64(b, i, v)
  packf64(b, i + 8, ...)
end

local function unpacki8(b: buffer, i: number, c: number, ...): (number, ...number?)
  c -= 1
  if c <= 0 then return buffer.readi8(b, i + c), ... end
  return unpacki8(b, i, c, buffer.readi8(b, i + c), ...)
end

local function unpacku8(b: buffer, i: number, c: number, ...): (number, ...number?)
  c -= 1
  if c <= 0 then return buffer.readu8(b, i + c), ... end
  return unpacku8(b, i, c, buffer.readu8(b, i + c), ...)
end

local function unpacki16(b: buffer, i: number, c: number, ...): (number, ...number?)
  c -= 1
  if c <= 0 then return buffer.readi16(b, i + c * 2), ... end
  return unpacki16(b, i, c, buffer.readi16(b, i + c * 2), ...)
end

local function unpacku16(b: buffer, i: number, c: number, ...): (number, ...number?)
  c -= 1
  if c <= 0 then return buffer.readu16(b, i + c * 2), ... end
  return unpacku16(b, i, c, buffer.readu16(b, i + c * 2), ...)
end

local function unpacki32(b: buffer, i: number, c: number, ...): (number, ...number?)
  c -= 1
  if c <= 0 then return buffer.readi32(b, i + c * 4), ... end
  return unpacki32(b, i, c, buffer.readi32(b, i + c * 4), ...)
end

local function unpacku32(b: buffer, i: number, c: number, ...): (number, ...number?)
  c -= 1
  if c <= 0 then return buffer.readu32(b, i + c * 4), ... end
  return unpacku32(b, i, c, buffer.readu32(b, i + c * 4), ...)
end

local function unpackf32(b: buffer, i: number, c: number, ...): (number, ...number?)
  c -= 1
  if c <= 0 then return buffer.readf32(b, i + c * 4), ... end
  return unpackf32(b, i, c, buffer.readf32(b, i + c * 4), ...)
end

local function unpackf64(b: buffer, i: number, c: number, ...): (number, ...number?)
  c -= 1
  if c <= 0 then return buffer.readf64(b, i + c * 8), ... end
  return unpackf64(b, i, c, buffer.readf64(b, i + c * 8), ...)
end

return table.freeze {
  packi8 = packu8,
  packu8 = packu8,
  packi16 = packu16,
  packu16 = packu16,
  packi32 = packu32,
  packu32 = packu32,
  packf32 = packf32,
  packf64 = packf64,
  unpacki8 = unpacki8,
  unpacku8 = unpacku8,
  unpacki16 = unpacki16,
  unpacku16 = unpacku16,
  unpacki32 = unpacki32,
  unpacku32 = unpacku32,
  unpackf32 = unpackf32,
  unpackf64 = unpackf64
}
