(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Surface from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents a rectangular region on the screen.

    It’s a low-level object, used to implement high-level objects such as
    GtkWindow.

    The surfaces you see in practice are either [Gdk.Toplevel] or [Gdk.Popup],
    and those interfaces provide much of the required API to interact with these
    surfaces. Other, more specialized surface types exist, but you will rarely
    interact with them directly.

    Its methods, signals and properties are on {!class-type-surface_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Surface}. *)

class type surface_t = App_launch_context_cycle_de440b34.surface_t
(** The methods, signals and properties of a [GdkSurface]. *)

class surface : Raw.Surface.t -> surface_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Surface.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkSurface], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_popup : App_launch_context_cycle_de440b34.surface_t -> bool -> surface_t
(** Create a new popup surface.

    The surface will be attached to [parent] and can be positioned relative to
    it using [Gdk.Popup.present]. *)

val new_toplevel : App_launch_context_cycle_de440b34.display_t -> surface_t
(** Creates a new toplevel surface. *)
