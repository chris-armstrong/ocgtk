class type device_tool_t = object
  method get_axes : unit -> Enums.axisflags
  method get_hardware_id : unit -> UInt64.t
  method get_serial : unit -> UInt64.t
  method get_tool_type : unit -> Enums.devicetooltype
  method as_device_tool : Raw.Device_tool.t
end

(* High-level class for DeviceTool *)
class device_tool (obj : Raw.Device_tool.t) : device_tool_t =
  object (self)
    method get_axes : unit -> Enums.axisflags =
      fun () -> Raw.Device_tool.get_axes obj

    method get_hardware_id : unit -> UInt64.t =
      fun () -> Raw.Device_tool.get_hardware_id obj

    method get_serial : unit -> UInt64.t =
      fun () -> Raw.Device_tool.get_serial obj

    method get_tool_type : unit -> Enums.devicetooltype =
      fun () -> Raw.Device_tool.get_tool_type obj

    method as_device_tool = obj
  end
