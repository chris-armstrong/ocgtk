(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Device from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents an input device, such as a keyboard, mouse or touchpad.

    See the [Gdk.Seat] documentation for more information about the various
    kinds of devices, and their relationships.

    Its methods, signals and properties are on {!class-type-device_t}. The
    functions it is built on are in {!Ocgdk.Raw.Device}. *)

class type device_t = App_launch_context_cycle_de440b34.device_t
(** The methods, signals and properties of a [GdkDevice]. *)

class device : Raw.Device.t -> device_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Device.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDevice], give one already wrapped. *)
