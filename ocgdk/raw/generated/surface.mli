(* GENERATED CODE - DO NOT EDIT *)
(* Surface, a member of the cyclic module App_launch_context_cycle_de440b34 *)

(** Represents a rectangular region on the screen.

    It’s a low-level object, used to implement high-level objects such as
    GtkWindow.

    The surfaces you see in practice are either [Gdk.Toplevel] or [Gdk.Popup],
    and those interfaces provide much of the required API to interact with these
    surfaces. Other, more specialized surface types exist, but you will rarely
    interact with them directly.

    The class built on this module is in {!Ocgdk.Surface}. *)

include module type of struct
  include App_launch_context_cycle_de440b34.Surface
end
