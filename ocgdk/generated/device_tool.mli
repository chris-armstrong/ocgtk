(** A physical tool associated to a [GdkDevice].

    Its methods, signals and properties are on {!class-type-device_tool_t}. The
    functions it is built on are in {!Ocgdk.Raw.Device_tool}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DeviceTool].}

    A physical tool associated to a [GdkDevice]. *)
class type device_tool_t = object
  (** {2:methods Methods} *)

  method get_axes : unit -> Enums.axisflags
  (** Gets the axes of the tool. *)

  method get_hardware_id : unit -> UInt64.t
  (** Gets the hardware ID of this tool, or 0 if it's not known.

      When non-zero, the identifier is unique for the given tool model, meaning
      that two identical tools will share the same [hardware_id], but will have
      different serial numbers (see [Gdk.DeviceTool.get_serial]).

      This is a more concrete (and device specific) method to identify a
      [GdkDeviceTool] than [Gdk.DeviceTool.get_tool_type], as a tablet may
      support multiple devices with the same [GdkDeviceToolType], but different
      hardware identifiers. *)

  method get_serial : unit -> UInt64.t
  (** Gets the serial number of this tool.

      This value can be used to identify a physical tool (eg. a tablet pen)
      across program executions. *)

  method get_tool_type : unit -> Enums.devicetooltype
  (** Gets the [GdkDeviceToolType] of the tool. *)

  (** {2:conversions Conversions} *)

  method as_device_tool : Raw.Device_tool.t
end

class device_tool : Raw.Device_tool.t -> device_tool_t
(** Wraps a raw handle of {!Ocgdk.Raw.Device_tool.t}. *)
