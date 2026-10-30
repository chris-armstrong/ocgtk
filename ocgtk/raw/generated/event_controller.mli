(* GENERATED CODE - DO NOT EDIT *)
(* EventController, a member of the cyclic module Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** The base class for event controllers.

    These are ancillary objects associated to widgets, which react to
    [GdkEvents], and possibly trigger actions as a consequence.

    Event controllers are added to a widget with
    {{!Ocgtk.Raw.Widget.val-add_controller}[Gtk.Widget.add_controller]}. It is
    rarely necessary to explicitly remove a controller with
    {{!Ocgtk.Raw.Widget.val-remove_controller}[Gtk.Widget.remove_controller]}.

    See the chapter on input handling for an overview of the basic concepts,
    such as the capture and bubble phases of event propagation.

    The class built on this module is in {!Ocgtk.Event_controller}. *)

include module type of struct
  include
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .Event_controller
end
