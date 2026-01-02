(* High-level class for DeviceTool *)
class device_tool (obj : Device_tool.t) = object (self)

  method get_axes : unit -> Gdk_enums.axisflags =
    fun () ->
      (Device_tool.get_axes obj)

  method get_tool_type : unit -> Gdk_enums.devicetooltype =
    fun () ->
      (Device_tool.get_tool_type obj)

    method as_device_tool = obj
end

