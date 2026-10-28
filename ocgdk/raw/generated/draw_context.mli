(* GENERATED CODE - DO NOT EDIT *)
(* DrawContext, a member of the cyclic module App_launch_context_cycle_de440b34 *)

(** Base class for objects implementing different rendering methods.

    [GdkDrawContext] is the base object used by contexts implementing different
    rendering methods, such as [Gdk.CairoContext] or [Gdk.GLContext]. It
    provides shared functionality between those contexts.

    You will always interact with one of those subclasses.

    A [GdkDrawContext] is always associated with a single toplevel surface.

    The class built on this module is in {!Ocgdk.Draw_context}. *)

include module type of struct
  include App_launch_context_cycle_de440b34.Draw_context
end
