class device_tool : Device_tool.t ->
  object
    method get_axes : unit -> Gdk_enums.axisflags
    method get_tool_type : unit -> Gdk_enums.devicetooltype
    method as_device_tool : Device_tool.t
  end

