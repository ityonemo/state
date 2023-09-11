defmodule NifNaiveState do
  use Zig, otp_app: :state

  ~Z"""
  const beam = @import("beam");
  var stored:i64 = 0;

  pub fn new(value: i64) void {
    stored = value;
  }

  pub fn get(_: beam.term) i64 {
    return stored;
  }

  pub fn put(_: beam.term, value: i64) void {
    stored = value;
  }
  """

  def cleanup(_), do: :ok
end
