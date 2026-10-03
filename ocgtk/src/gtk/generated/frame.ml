(* GENERATED CODE - DO NOT EDIT *)
(* Frame: Frame *)

type t = [ `frame | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Surrounds its child with a decorative frame and an optional label.

    An example GtkFrame

    If present, the label is drawn inside the top edge of the frame. The
    horizontal position of the label can be controlled with
    [Gtk.Frame.set_label_align].

    [GtkFrame] clips its child. You can use this to add rounded corners to
    widgets, but be aware that it also cuts off shadows.

    {b GtkFrame as GtkBuildable}

    An example of a UI definition fragment with GtkFrame:

    {[
    <object class=”GtkFrame”>
      <property name=”label-widget”>
        <object class=”GtkLabel” id=”frame_label”/>
      </property>
      <property name=”child”>
        <object class=”GtkEntry” id=”frame_content”/>
      </property>
    </object>
    ]}

    {b CSS nodes}

    {[
    frame
    ├── <label widget>
    ╰── <child>
    ]}

    [GtkFrame] has a main CSS node with name “frame”, which is used to draw the
    visible border. You can set the appearance of the border using CSS
    properties like “border-style” on this node.

    {b Accessibility}

    [GtkFrame] uses the [Gtk.AccessibleRole.group] role. *)

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
