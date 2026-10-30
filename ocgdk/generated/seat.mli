(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Seat from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents a collection of input devices that belong to a user.

    Its methods, signals and properties are on {!class-type-seat_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Seat}. *)

(** {1:class Class} *)

class type seat_t = App_launch_context_cycle_de440b34.seat_t
(** {b The methods, signals and properties of a [Seat].}

    Represents a collection of input devices that belong to a user. *)

class seat : Raw.Seat.t -> seat_t
(** Wraps a raw handle of {!Ocgdk.Raw.Seat.t}. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
