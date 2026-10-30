(* GENERATED CODE - DO NOT EDIT *)
(* CairoContext, a member of the cyclic module App_launch_context_cycle_de440b34 *)

(** Represents the platform-specific draw context.

    [GdkCairoContext]s are created for a surface using
    {{!Ocgdk.Raw.Surface.val-create_cairo_context}[Gdk.Surface.create_cairo_context]},
    and the context can then be used to draw on that surface.

    The class built on this module is in {!Ocgdk.Cairo_context}. *)

include module type of struct
  include App_launch_context_cycle_de440b34.Cairo_context
end
