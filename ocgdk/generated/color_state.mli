(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ColorState from cyclic group Cicp_params_and__color_state *)

(** Provides information to interpret colors and pixels in a variety of ways.

    They are also known as
    {{:https://en.wikipedia.org/wiki/Color_space}{i color spaces}}.

    Crucially, GTK knows how to convert colors from one color state to another.

    [GdkColorState] objects are immutable and therefore threadsafe.

    Its methods, signals and properties are on {!class-type-color_state_t}. The
    functions it is built on are in {!Ocgdk.Raw.Color_state}. *)

class type color_state_t = Cicp_params_and__color_state.color_state_t
(** The methods, signals and properties of a [ColorState]. *)

class color_state : Raw.Color_state.t -> color_state_t
(** Wraps a raw handle of {!Ocgdk.Raw.Color_state.t}. *)
