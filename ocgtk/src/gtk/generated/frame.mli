(* GENERATED CODE - DO NOT EDIT *)
(* Frame: Frame *)

[@@@ocaml.text
"Surrounds its child with a decorative frame and an optional label.\n\n\
 An example GtkFrame\n\n\
 If present, the label is drawn inside the top edge of the frame.\n\
 The horizontal position of the label can be controlled with\n\
 [Gtk.Frame.set_label_align].\n\n\
 [GtkFrame] clips its child. You can use this to add rounded corners\n\
 to widgets, but be aware that it also cuts off shadows.\n\n\
 {b GtkFrame as GtkBuildable}\n\n\
 An example of a UI definition fragment with GtkFrame:\n\n\
 {[\n\
 <object class=\"GtkFrame\">\n\
\  <property name=\"label-widget\">\n\
\    <object class=\"GtkLabel\" id=\"frame_label\"/>\n\
\  </property>\n\
\  <property name=\"child\">\n\
\    <object class=\"GtkEntry\" id=\"frame_content\"/>\n\
\  </property>\n\
 </object>\n\
 ]}\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 frame\n\
 ├── <label widget>\n\
 ╰── <child>\n\
 ]}\n\n\
 [GtkFrame] has a main CSS node with name “frame”, which is used to draw the\n\
 visible border. You can set the appearance of the border using CSS properties\n\
 like “border-style” on this node.\n\n\
 {b Accessibility}\n\n\
 [GtkFrame] uses the [Gtk.AccessibleRole.group] role."]

type t = [ `frame | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : string option -> t = "ml_gtk_frame_new"
(** Create a new Frame *)

(* Methods *)

external set_label_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_frame_set_label_widget"
(** Sets the label widget for the frame.

    This is the widget that will appear embedded in the top edge of the frame as
    a title. *)

external set_label_align : t -> float -> unit = "ml_gtk_frame_set_label_align"
(** Sets the X alignment of the frame widget’s label.

    The default value for a newly created frame is 0.0. *)

external set_label : t -> string option -> unit = "ml_gtk_frame_set_label"
(** Creates a new [GtkLabel] with the [label] and sets it as the frame's label
    widget. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_frame_set_child"
(** Sets the child widget of [frame]. *)

external get_label_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_frame_get_label_widget"
(** Retrieves the label widget for the frame. *)

external get_label_align : t -> float = "ml_gtk_frame_get_label_align"
(** Retrieves the X alignment of the frame’s label. *)

external get_label : t -> string option = "ml_gtk_frame_get_label"
(** Returns the frame labels text.

    If the frame's label widget is not a [GtkLabel], [NULL] is returned. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_frame_get_child"
(** Gets the child widget of [frame]. *)

(* Properties *)
