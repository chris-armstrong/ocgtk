(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for CairoContext from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents the platform-specific draw context.

    [GdkCairoContext]s are created for a surface using
    [Gdk.Surface.create_cairo_context], and the context can then be used to draw
    on that surface.

    Its methods, signals and properties are on {!class-type-cairo_context_t}.
    The functions it is built on are in {!Ocgdk.Raw.Cairo_context}. *)

class type cairo_context_t = App_launch_context_cycle_de440b34.cairo_context_t
(** The methods, signals and properties of a [GdkCairoContext]. *)

class cairo_context : Raw.Cairo_context.t -> cairo_context_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Cairo_context.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkCairoContext], give one already wrapped. *)
