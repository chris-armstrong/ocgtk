(** Surrounds its child with a decorative frame and an optional label.

    Its methods, signals and properties are on {!class-type-frame_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Frame}. *)

(** {1:class Class} *)

class type frame_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [frame]. *)

  method get_label : unit -> string option
  (** Returns the frame labels text.

      If the frame's label widget is not a [GtkLabel], [None] is returned. *)

  method get_label_align : unit -> float
  (** Retrieves the X alignment of the frame’s label. *)

  method get_label_widget : unit -> Widget.widget_t option
  (** Retrieves the label widget for the frame. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [frame]. *)

  method set_label : string option -> unit
  (** Creates a new [GtkLabel] with the [label] and sets it as the frame's label
      widget. *)

  method set_label_align : float -> unit
  (** Sets the X alignment of the frame widget’s label.

      The default value for a newly created frame is 0.0. *)

  method set_label_widget : Widget.widget_t option -> unit
  (** Sets the label widget for the frame.

      This is the widget that will appear embedded in the top edge of the frame
      as a title. *)

  (** {2:conversions Conversions} *)

  method as_frame : Raw.Frame.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Frame].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\n\
     Surrounds its child with a decorative frame and an optional label.\n\n\
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
     visible border. You can set the appearance of the border using CSS \
     properties\n\
     like “border-style” on this node.\n\n\
     {b Accessibility}\n\n\
     [GtkFrame] uses the [Gtk.AccessibleRole.group] role."]

class frame : Raw.Frame.t -> frame_t
(** Wraps a raw handle of {!Ocgtk.Raw.Frame.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Surrounds its child with a decorative frame and an optional label.\n\n\
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

(** {1:constructors Constructors} *)

val new_ : string option -> frame_t
(** Creates a new [GtkFrame], with optional label [label].

    If [label] is [None], the label is omitted. *)
