(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Frame *)

type t = [`frame | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Frame *)
external new_ : string option -> t = "ml_gtk_frame_new"

(* Properties *)

(** Sets the label widget for the frame.

This is the widget that will appear embedded in the top edge
of the frame as a title. *)
external set_label_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_frame_set_label_widget"

(** Sets the X alignment of the frame widget’s label.

The default value for a newly created frame is 0.0. *)
external set_label_align : t -> float -> unit = "ml_gtk_frame_set_label_align"

(** Creates a new `GtkLabel` with the @label and sets it as the frame's
label widget. *)
external set_label : t -> string option -> unit = "ml_gtk_frame_set_label"

(** Sets the child widget of @frame. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_frame_set_child"

(** Retrieves the label widget for the frame. *)
external get_label_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_frame_get_label_widget"

(** Retrieves the X alignment of the frame’s label. *)
external get_label_align : t -> float = "ml_gtk_frame_get_label_align"

(** Returns the frame labels text.

If the frame's label widget is not a `GtkLabel`, %NULL
is returned. *)
external get_label : t -> string option = "ml_gtk_frame_get_label"

(** Gets the child widget of @frame. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_frame_get_child"

