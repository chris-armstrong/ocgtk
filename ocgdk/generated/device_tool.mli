class type device_tool_t = object
  method get_axes : unit -> Enums.axisflags
  method get_hardware_id : unit -> UInt64.t
  method get_serial : unit -> UInt64.t
  method get_tool_type : unit -> Enums.devicetooltype
  method as_device_tool : Raw.Device_tool.t
end

class device_tool : Raw.Device_tool.t -> device_tool_t
