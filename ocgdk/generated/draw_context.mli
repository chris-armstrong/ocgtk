(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for DrawContext from cyclic group App_launch_context_cycle_de440b34 *)

(** Base class for objects implementing different rendering methods.

    Its methods, signals and properties are on {!class-type-draw_context_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Draw_context}. *)

(** {1:class Class} *)

class type draw_context_t = App_launch_context_cycle_de440b34.draw_context_t
(** {b The methods, signals and properties of a [DrawContext].}

    Base class for objects implementing different rendering methods.

    [GdkDrawContext] is the base object used by contexts implementing different
    rendering methods, such as [Gdk.CairoContext] or [Gdk.GLContext]. It
    provides shared functionality between those contexts.

    You will always interact with one of those subclasses.

    A [GdkDrawContext] is always associated with a single toplevel surface. *)

class draw_context : Raw.Draw_context.t -> draw_context_t
(** Wraps a raw handle of {!Ocgdk.Raw.Draw_context.t}. *)

(** {1:description Description}

    Base class for objects implementing different rendering methods.

    [GdkDrawContext] is the base object used by contexts implementing different
    rendering methods, such as [Gdk.CairoContext] or [Gdk.GLContext]. It
    provides shared functionality between those contexts.

    You will always interact with one of those subclasses.

    A [GdkDrawContext] is always associated with a single toplevel surface. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
