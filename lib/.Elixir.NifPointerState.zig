// this code is autogenerated, do not check it into to your code repository

// ref lib/nif_pointer_state.ex:4
const beam = @import("beam");
pub fn new(value: i64) !u64 {
  const value_ptr = try beam.allocator.create(i64);
  value_ptr.* = value;
  return @ptrToInt(value_ptr);
}

pub fn get(value_ptr_int: u64) i64 {
  return  @intToPtr(*i64, value_ptr_int).*;
}

pub fn put(value_ptr_int: u64, new_value: i64) void {
  @intToPtr(*i64, value_ptr_int).* =  new_value;
}

pub fn cleanup(value_ptr_int: u64) void {
  beam.allocator.destroy(@intToPtr(*i64, value_ptr_int));
}
