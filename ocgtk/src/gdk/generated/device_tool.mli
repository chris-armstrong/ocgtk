(* GENERATED CODE - DO NOT EDIT *)
(* DeviceTool: DeviceTool *)

type t = [`device_tool | `object_] Gobject.obj

(* Methods *)
(** Gets the `GdkDeviceToolType` of the tool. *)
external get_tool_type : t -> Gdk_enums.devicetooltype = "ml_gdk_device_tool_get_tool_type"

(** Gets the axes of the tool. *)
external get_axes : t -> Gdk_enums.axisflags = "ml_gdk_device_tool_get_axes"

(* Properties *)

