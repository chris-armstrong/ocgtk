(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Device from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents an input device, such as a keyboard, mouse or touchpad.

    Its methods, signals and properties are on {!class-type-device_t}. Its full
    description is under {!section-description}. The functions it is built on
    are in {!Ocgdk.Raw.Device}. *)

(** {1:class Class} *)

class type device_t = App_launch_context_cycle_de440b34.device_t
(** {b The methods, signals and properties of a [Device].}

    Inherits from: [GObject.Object]

    Represents an input device, such as a keyboard, mouse or touchpad.

    See the [Gdk.Seat] documentation for more information about the various
    kinds of devices, and their relationships. *)

class device : Raw.Device.t -> device_t
(** Wraps a raw handle of {!Ocgdk.Raw.Device.t}. *)

(** {1:description Description}

    Represents an input device, such as a keyboard, mouse or touchpad.

    See the [Gdk.Seat] documentation for more information about the various
    kinds of devices, and their relationships. *)
