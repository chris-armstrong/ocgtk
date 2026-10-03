(* GENERATED CODE - DO NOT EDIT *)
(* DragIcon: DragIcon *)

type t = [ `drag_icon | `widget | `initially_unowned | `object_ ] Gobject.obj
(** A [GtkRoot] implementation for drag icons.

    A drag icon moves with the pointer during a Drag-and-Drop operation and is
    destroyed when the drag ends.

    To set up a drag icon and associate it with an ongoing drag operation, use
    [Gtk.DragIcon.get_for_drag] to get the icon for a drag. You can then use it
    like any other widget and use [Gtk.DragIcon.set_child] to set whatever
    widget should be used for the drag icon.

    Keep in mind that drag icons do not allow user input. *)

external get_for_drag : Ocgtk_gdk.Gdk.Wrappers.Drag.t -> t
  = "ml_gtk_drag_icon_get_for_drag"
(** Create a new DragIcon *)

(* Methods *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_drag_icon_set_child"
(** Sets the widget to display as the drag icon. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_drag_icon_get_child"
(** Gets the widget currently used as drag icon. *)

(* Properties *)
