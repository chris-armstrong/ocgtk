(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Device from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents an input device, such as a keyboard, mouse or touchpad.

    Its methods, signals and properties are on {!class-type-device_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Device}. *)

(** {1:class Class} *)

class type device_t = App_launch_context_cycle_de440b34.device_t
(** {b The methods, signals and properties of a [Device].}

    Represents an input device, such as a keyboard, mouse or touchpad.

    See the {{!Ocgdk.Seat.class-type-seat_t}[Gdk.Seat]} documentation for more
    information about the various kinds of devices, and their relationships. *)

class device : Raw.Device.t -> device_t
(** Wraps a raw handle of {!Ocgdk.Raw.Device.t}. *)

(** {1:description Description}

    Represents an input device, such as a keyboard, mouse or touchpad.

    See the {{!Ocgdk.Seat.class-type-seat_t}[Gdk.Seat]} documentation for more
    information about the various kinds of devices, and their relationships. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
