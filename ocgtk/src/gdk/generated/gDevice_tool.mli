class type device_tool_t = object
  method get_axes : unit -> Gdk_enums.axisflags
  method get_hardware_id : unit -> UInt64.t
  method get_serial : unit -> UInt64.t
  method get_tool_type : unit -> Gdk_enums.devicetooltype
  method as_device_tool : Device_tool.t
end

class device_tool : Device_tool.t -> device_tool_t
