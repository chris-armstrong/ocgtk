(* GENERATED CODE - DO NOT EDIT *)
(* DragIcon: DragIcon *)

(** A [GtkRoot] implementation for drag icons.

    A drag icon moves with the pointer during a Drag-and-Drop operation and is
    destroyed when the drag ends.

    To set up a drag icon and associate it with an ongoing drag operation, use
    {{!Ocgtk.Raw.Drag_icon.val-get_for_drag}[Gtk.DragIcon.get_for_drag]} to get
    the icon for a drag. You can then use it like any other widget and use
    {{!Ocgtk.Raw.Drag_icon.val-set_child}[Gtk.DragIcon.set_child]} to set
    whatever widget should be used for the drag icon.

    Keep in mind that drag icons do not allow user input.

    The class built on this module is in {!Ocgtk.Drag_icon}. *)

type t = [ `drag_icon | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_drag_icon_get_type"

external get_for_drag : Ocgdk_raw.Drag.t -> t = "ml_gtk_drag_icon_get_for_drag"
(** Gets the [GtkDragIcon] in use with [drag].

    If no drag icon exists yet, a new one will be created and shown. *)

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
