defmodule NifResourceState do
  use Zig, otp_app: :state, resources: [:I64Res]

  ~Z"""
  pub const I64Res = 
    @import("beam").Resource(i64, @import("root"), .{});

  pub fn new(value: i64) !I64Res {
    return I64Res.create(value, .{});
  }

  pub fn get(resource: I64Res) i64 {
    return resource.unpack();
  }

  pub fn put(resource: I64Res, new_value: i64) void {
    resource.update(new_value);
  }
  """

  def cleanup(_), do: :ok
end
