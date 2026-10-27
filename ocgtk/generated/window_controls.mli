[@@@ocaml.text
"Shows window frame controls.\n\n\
 Typical window frame controls are minimize, maximize and close buttons,\n\
 and the window icon.\n\n\
 An example GtkWindowControls\n\n\
 [GtkWindowControls] only displays start or end side of the controls (see\n\
 [Gtk.WindowControls:side]), so it's intended to be always used\n\
 in pair with another [GtkWindowControls] for the opposite side, for example:\n\n\
 {[\n\
 <object class=\"GtkBox\">\n\
\  <child>\n\
\    <object class=\"GtkWindowControls\">\n\
\      <property name=\"side\">start</property>\n\
\    </object>\n\
\  </child>\n\n\
\  ...\n\n\
\  <child>\n\
\    <object class=\"GtkWindowControls\">\n\
\      <property name=\"side\">end</property>\n\
\    </object>\n\
\  </child>\n\
 </object>\n\
 ]}\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 windowcontrols\n\
 ├── [image.icon]\n\
 ├── [button.minimize]\n\
 ├── [button.maximize]\n\
 ╰── [button.close]\n\
 ]}\n\n\
 A [GtkWindowControls]' CSS node is called windowcontrols. It contains\n\
 subnodes corresponding to each title button. Which of the title buttons\n\
 exist and where they are placed exactly depends on the desktop environment\n\
 and [Gtk.WindowControls:decoration-layout] value.\n\n\
 When [Gtk.WindowControls:empty] is true, it gets the .empty\n\
 style class.\n\n\
 {b Accessibility}\n\n\
 [GtkWindowControls] uses the [Gtk.AccessibleRole.group] role.\n\n\
 Its methods, signals and properties are on {!class-type-window_controls_t}. \
 The functions it is built on are in {!Ocgtk.Raw.Window_controls}."]

(** The methods, signals and properties of a [GtkWindowControls]. *)
class type window_controls_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_decoration_layout : unit -> string option
  method get_empty : unit -> bool
  method get_side : unit -> Enums.packtype
  method get_use_native_controls : unit -> bool
  method set_decoration_layout : string option -> unit
  method set_side : Enums.packtype -> unit
  method set_use_native_controls : bool -> unit
  method as_window_controls : Raw.Window_controls.t
end

class window_controls : Raw.Window_controls.t -> window_controls_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Window_controls.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkWindowControls], give one already wrapped. *)

val new_ : Enums.packtype -> window_controls_t
