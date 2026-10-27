(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Root from cyclic group Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** An interface for widgets that can act as the root of a widget hierarchy.

    The root widget takes care of providing the connection to the windowing
    system and manages layout, drawing and event delivery for its widget
    hierarchy.

    The obvious example of a [GtkRoot] is [GtkWindow].

    To get the display to which a [GtkRoot] belongs, use [Gtk.Root.get_display].

    [GtkRoot] also maintains the location of keyboard focus inside its widget
    hierarchy, with [Gtk.Root.set_focus] and [Gtk.Root.get_focus].

    Its methods, signals and properties are on {!class-type-root_t}. The
    functions it is built on are in {!Ocgtk.Raw.Root}. *)

class type root_t =
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .root_t
(** The methods, signals and properties of a [GtkRoot]. *)

class root : Raw.Root.t -> root_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Root.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkRoot], give one already wrapped. *)
