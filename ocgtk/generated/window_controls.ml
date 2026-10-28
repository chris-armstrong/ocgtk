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

(* High-level class for WindowControls *)
class window_controls (obj : Raw.Window_controls.t) : window_controls_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_decoration_layout : unit -> string option =
      fun () -> Raw.Window_controls.get_decoration_layout obj

    method get_empty : unit -> bool =
      fun () -> Raw.Window_controls.get_empty obj

    method get_side : unit -> Enums.packtype =
      fun () -> Raw.Window_controls.get_side obj

    method get_use_native_controls : unit -> bool =
      fun () -> Raw.Window_controls.get_use_native_controls obj

    method set_decoration_layout : string option -> unit =
      fun layout -> Raw.Window_controls.set_decoration_layout obj layout

    method set_side : Enums.packtype -> unit =
      fun side -> Raw.Window_controls.set_side obj side

    method set_use_native_controls : bool -> unit =
      fun setting -> Raw.Window_controls.set_use_native_controls obj setting

    method as_window_controls = obj
  end

let new_ (side : Enums.packtype) : window_controls_t =
  let obj_ = Raw.Window_controls.new_ side in
  new window_controls obj_
