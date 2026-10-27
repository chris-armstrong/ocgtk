(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Seat from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents a collection of input devices that belong to a user.

    Its methods, signals and properties are on {!class-type-seat_t}. The
    functions it is built on are in {!Ocgdk.Raw.Seat}. *)

class type seat_t = App_launch_context_cycle_de440b34.seat_t
(** The methods, signals and properties of a [GdkSeat]. *)

class seat : Raw.Seat.t -> seat_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Seat.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkSeat], give one already wrapped. *)
