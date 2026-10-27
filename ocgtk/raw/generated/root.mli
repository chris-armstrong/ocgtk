(* GENERATED CODE - DO NOT EDIT *)
(* Root, a member of the cyclic module Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** An interface for widgets that can act as the root of a widget hierarchy.

    The root widget takes care of providing the connection to the windowing
    system and manages layout, drawing and event delivery for its widget
    hierarchy.

    The obvious example of a [GtkRoot] is [GtkWindow].

    To get the display to which a [GtkRoot] belongs, use [Gtk.Root.get_display].

    [GtkRoot] also maintains the location of keyboard focus inside its widget
    hierarchy, with [Gtk.Root.set_focus] and [Gtk.Root.get_focus].

    The class built on this module is in {!Ocgtk.Root}. *)

include module type of struct
  include
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .Root
end
