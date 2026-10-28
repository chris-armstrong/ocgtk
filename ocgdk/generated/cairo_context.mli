(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for CairoContext from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents the platform-specific draw context.

    Its methods, signals and properties are on {!class-type-cairo_context_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgdk.Raw.Cairo_context}. *)

(** {1:class Class} *)

class type cairo_context_t = App_launch_context_cycle_de440b34.cairo_context_t
(** {b The methods, signals and properties of a [CairoContext].}

    Represents the platform-specific draw context.

    [GdkCairoContext]s are created for a surface using
    [Gdk.Surface.create_cairo_context], and the context can then be used to draw
    on that surface. *)

class cairo_context : Raw.Cairo_context.t -> cairo_context_t
(** Wraps a raw handle of {!Ocgdk.Raw.Cairo_context.t}. *)

(** {1:description Description}

    Represents the platform-specific draw context.

    [GdkCairoContext]s are created for a surface using
    [Gdk.Surface.create_cairo_context], and the context can then be used to draw
    on that surface. *)
