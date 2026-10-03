(* GENERATED CODE - DO NOT EDIT *)
(* WindowControls: WindowControls *)

type t =
  [ `window_controls | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Shows window frame controls.

    Typical window frame controls are minimize, maximize and close buttons, and
    the window icon.

    An example GtkWindowControls

    [GtkWindowControls] only displays start or end side of the controls (see
    [Gtk.WindowControls:side]), so it's intended to be always used in pair with
    another [GtkWindowControls] for the opposite side, for example:

    {[
    <object class=”GtkBox”>
      <child>
        <object class=”GtkWindowControls”>
          <property name=”side”>start</property>
        </object>
      </child>

      ...

      <child>
        <object class=”GtkWindowControls”>
          <property name=”side”>end</property>
        </object>
      </child>
    </object>
    ]}

    {b CSS nodes}

    {[
    windowcontrols
    ├── [image.icon]
    ├── [button.minimize]
    ├── [button.maximize]
    ╰── [button.close]
    ]}

    A [GtkWindowControls]' CSS node is called windowcontrols. It contains
    subnodes corresponding to each title button. Which of the title buttons
    exist and where they are placed exactly depends on the desktop environment
    and [Gtk.WindowControls:decoration-layout] value.

    When [Gtk.WindowControls:empty] is true, it gets the .empty style class.

    {b Accessibility}

    [GtkWindowControls] uses the [Gtk.AccessibleRole.group] role. *)

external new_ : Gtk_enums.packtype -> t = "ml_gtk_window_controls_new"
(** Create a new WindowControls *)

(* Methods *)

external set_use_native_controls : t -> bool -> unit
  = "ml_gtk_window_controls_set_use_native_controls"
(** Sets whether platform native window controls are used.

    This option shows the “stoplight” buttons on macOS. For Linux, this option
    has no effect.

    See also Using GTK on Apple macOS. *)

external set_side : t -> Gtk_enums.packtype -> unit
  = "ml_gtk_window_controls_set_side"
(** Determines which part of decoration layout the window controls widget uses.

    See [Gtk.WindowControls:decoration-layout]. *)

external set_decoration_layout : t -> string option -> unit
  = "ml_gtk_window_controls_set_decoration_layout"
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

external get_use_native_controls : t -> bool
  = "ml_gtk_window_controls_get_use_native_controls"
(** Returns whether platform native window controls are shown. *)

external get_side : t -> Gtk_enums.packtype = "ml_gtk_window_controls_get_side"
(** Gets the side to which this window controls widget belongs. *)

external get_empty : t -> bool = "ml_gtk_window_controls_get_empty"
(** Gets whether the widget has any window buttons. *)

external get_decoration_layout : t -> string option
  = "ml_gtk_window_controls_get_decoration_layout"
(** Gets the decoration layout of this window controls widget *)

(* Properties *)
