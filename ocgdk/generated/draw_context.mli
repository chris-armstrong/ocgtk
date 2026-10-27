(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for DrawContext from cyclic group App_launch_context_cycle_de440b34 *)

(** Base class for objects implementing different rendering methods.

    [GdkDrawContext] is the base object used by contexts implementing different
    rendering methods, such as [Gdk.CairoContext] or [Gdk.GLContext]. It
    provides shared functionality between those contexts.

    You will always interact with one of those subclasses.

    A [GdkDrawContext] is always associated with a single toplevel surface.

    Its methods, signals and properties are on {!class-type-draw_context_t}. The
    functions it is built on are in {!Ocgdk.Raw.Draw_context}. *)

class type draw_context_t = App_launch_context_cycle_de440b34.draw_context_t
(** The methods, signals and properties of a [GdkDrawContext]. *)

class draw_context : Raw.Draw_context.t -> draw_context_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Draw_context.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDrawContext], give one already wrapped. *)
