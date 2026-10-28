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
 Its constructors are under {!section-constructors}. The functions it is built \
 on are in {!Ocgtk.Raw.Window_controls}."]

class type window_controls_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_decoration_layout : unit -> string option
  (** Gets the decoration layout of this window controls widget *)

  method get_empty : unit -> bool
  (** Gets whether the widget has any window buttons. *)

  method get_side : unit -> Enums.packtype
  (** Gets the side to which this window controls widget belongs. *)

  method get_use_native_controls : unit -> bool
  (** Returns whether platform native window controls are shown. *)

  method set_decoration_layout : string option -> unit
  (** Sets the decoration layout for the title buttons.

      This overrides the [Gtk.Settings:gtk-decoration-layout] setting.

      The format of the string is button names, separated by commas. A colon
      separates the buttons that should appear on the left from those on the
      right. Recognized button names are minimize, maximize, close and icon (the
      window icon).

      For example, “icon:minimize,maximize,close” specifies a icon on the left,
      and minimize, maximize and close buttons on the right.

      If [Gtk.WindowControls:side] value is [Gtk.PackType.start], [self] will
      display the part before the colon, otherwise after that. *)

  method set_side : Enums.packtype -> unit
  (** Determines which part of decoration layout the window controls widget
      uses.

      See [Gtk.WindowControls:decoration-layout]. *)

  method set_use_native_controls : bool -> unit
  [@@ocaml.doc
    "Sets whether platform native window controls are used.\n\n\
     This option shows the \"stoplight\" buttons on macOS.\n\
     For Linux, this option has no effect.\n\n\
     See also Using GTK on Apple macOS."]

  method as_window_controls : Raw.Window_controls.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [WindowControls].}\n\n\
     Shows window frame controls.\n\n\
     Typical window frame controls are minimize, maximize and close buttons,\n\
     and the window icon.\n\n\
     An example GtkWindowControls\n\n\
     [GtkWindowControls] only displays start or end side of the controls (see\n\
     [Gtk.WindowControls:side]), so it's intended to be always used\n\
     in pair with another [GtkWindowControls] for the opposite side, for \
     example:\n\n\
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
     [GtkWindowControls] uses the [Gtk.AccessibleRole.group] role."]

class window_controls : Raw.Window_controls.t -> window_controls_t
(** Wraps a raw handle of {!Ocgtk.Raw.Window_controls.t}. *)

(** {2:constructors Constructors} *)

val new_ : Enums.packtype -> window_controls_t
(** Creates a new [GtkWindowControls]. *)
