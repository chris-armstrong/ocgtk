(** A physical tool associated to a [GdkDevice].

    Its methods, signals and properties are on {!class-type-device_tool_t}. The
    functions it is built on are in {!Ocgdk.Raw.Device_tool}. *)

(** The methods, signals and properties of a [GdkDeviceTool]. *)
class type device_tool_t = object
  method get_axes : unit -> Enums.axisflags
  method get_hardware_id : unit -> UInt64.t
  method get_serial : unit -> UInt64.t
  method get_tool_type : unit -> Enums.devicetooltype
  method as_device_tool : Raw.Device_tool.t
end

class device_tool : Raw.Device_tool.t -> device_tool_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Device_tool.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDeviceTool], give one already wrapped. *)
