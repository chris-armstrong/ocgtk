class type header_bar_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_decoration_layout : unit -> string option
  (** Gets the decoration layout of the header bar. *)

  method get_show_title_buttons : unit -> bool
  (** Returns whether this header bar shows the standard window title buttons.
  *)

  method get_title_widget : unit -> Widget.widget_t option
  (** Retrieves the title widget of the header bar.

      See [Gtk.HeaderBar.set_title_widget]. *)

  method get_use_native_controls : unit -> bool
  (** Returns whether this header bar shows platform native window controls. *)

  method pack_end : Widget.widget_t -> unit
  (** Adds a child to the header bar, packed with reference to the end. *)

  method pack_start : Widget.widget_t -> unit
  (** Adds a child to the header bar, packed with reference to the start. *)

  method remove : Widget.widget_t -> unit
  (** Removes a child from the header bar.

      The child must have been added with [Gtk.HeaderBar.pack_start],
      [Gtk.HeaderBar.pack_end] or [Gtk.HeaderBar.set_title_widget]. *)

  method set_decoration_layout : string option -> unit
  (** Sets the decoration layout for this header bar.

      This property overrides the [Gtk.Settings:gtk-decoration-layout] setting.

      There can be valid reasons for overriding the setting, such as a header
      bar design that does not allow for buttons to take room on the right, or
      only offers room for a single close button. Split header bars are another
      example for overriding the setting.

      The format of the string is button names, separated by commas. A colon
      separates the buttons that should appear on the left from those on the
      right. Recognized button names are minimize, maximize, close and icon (the
      window icon).

      For example, “icon:minimize,maximize,close” specifies an icon on the left,
      and minimize, maximize and close buttons on the right. *)

  method set_show_title_buttons : bool -> unit
  (** Sets whether this header bar shows the standard window title buttons. *)

  method set_title_widget : Widget.widget_t option -> unit
  (** Sets the title for the header bar.

      When set to [None], the headerbar will display the title of the window it
      is contained in.

      The title should help a user identify the current view. To achieve the
      same style as the builtin title, use the “title” style class.

      You should set the title widget to [None], for the window title label to
      be visible again. *)

  method set_use_native_controls : bool -> unit
  [@@ocaml.doc
    "Sets whether this header bar shows native window controls.\n\n\
     This option shows the \"stoplight\" buttons on macOS.\n\
     For Linux, this option has no effect.\n\n\
     See also Using GTK on Apple macOS."]

  (** {2:conversions Conversions} *)

  method as_header_bar : Raw.Header_bar.t
end

(* High-level class for HeaderBar *)
class header_bar (obj : Raw.Header_bar.t) : header_bar_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method get_decoration_layout : unit -> string option =
      fun () -> Raw.Header_bar.get_decoration_layout obj

    method get_show_title_buttons : unit -> bool =
      fun () -> Raw.Header_bar.get_show_title_buttons obj

    method get_title_widget : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Header_bar.get_title_widget obj)

    method get_use_native_controls : unit -> bool =
      fun () -> Raw.Header_bar.get_use_native_controls obj

    method pack_end : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Header_bar.pack_end obj child

    method pack_start : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Header_bar.pack_start obj child

    method remove : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Header_bar.remove obj child

    method set_decoration_layout : string option -> unit =
      fun layout -> Raw.Header_bar.set_decoration_layout obj layout

    method set_show_title_buttons : bool -> unit =
      fun setting -> Raw.Header_bar.set_show_title_buttons obj setting

    method set_title_widget : Widget.widget_t option -> unit =
      fun title_widget ->
        let title_widget = Option.map (fun c -> c#as_widget) title_widget in
        Raw.Header_bar.set_title_widget obj title_widget

    method set_use_native_controls : bool -> unit =
      fun setting -> Raw.Header_bar.set_use_native_controls obj setting

    method as_header_bar = obj
  end

let new_ () : header_bar_t = new header_bar (Raw.Header_bar.new_ ())
