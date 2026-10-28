class type css_provider_t = object
  inherit Style_provider.style_provider_t

  method load_from_bytes : Glib_bytes.t -> unit
  (** Loads [data] into [css_provider].

      This clears any previously loaded information. *)

  method load_from_data : string -> int -> unit
  (** Loads [data] into [css_provider].

      This clears any previously loaded information. *)

  method load_from_file : Ocgio.File.file_t -> unit
  (** Loads the data contained in [file] into [css_provider].

      This clears any previously loaded information. *)

  method load_from_path : string -> unit
  (** Loads the data contained in [path] into [css_provider].

      This clears any previously loaded information. *)

  method load_from_resource : string -> unit
  (** Loads the data contained in the resource at [resource_path] into the
      [css_provider].

      This clears any previously loaded information. *)

  method load_from_string : string -> unit
  (** Loads [string] into [css_provider].

      This clears any previously loaded information. *)

  method load_named : string -> string option -> unit
  (** Loads a theme from the usual theme paths.

      The actual process of finding the theme might change between releases, but
      it is guaranteed that this function uses the same mechanism to load the
      theme that GTK uses for loading its own theme. *)

  method to_string : unit -> string
  (** Converts the [provider] into a string representation in CSS format.

      Using [Gtk.CssProvider.load_from_string] with the return value from this
      function on a new provider created with [Gtk.CssProvider.new] will
      basically create a duplicate of this [provider]. *)

  method prefers_color_scheme : Enums.interfacecolorscheme
  (** Define the color scheme used for rendering the user interface.

      The UI can be set to either [Gtk.InterfaceColorScheme.LIGHT], or
      [Gtk.InterfaceColorScheme.DARK] mode. Other values will be interpreted the
      same as [Gtk.InterfaceColorScheme.LIGHT].

      This setting is be available for media queries in CSS:

      {[
      @media (prefers-color-scheme: dark) {
        // some dark mode styling
      }
      ]}

      Changing this setting will cause a re-render of the style sheet. *)

  method set_prefers_color_scheme : Enums.interfacecolorscheme -> unit
  (** Define the color scheme used for rendering the user interface.

      The UI can be set to either [Gtk.InterfaceColorScheme.LIGHT], or
      [Gtk.InterfaceColorScheme.DARK] mode. Other values will be interpreted the
      same as [Gtk.InterfaceColorScheme.LIGHT].

      This setting is be available for media queries in CSS:

      {[
      @media (prefers-color-scheme: dark) {
        // some dark mode styling
      }
      ]}

      Changing this setting will cause a re-render of the style sheet. *)

  method prefers_contrast : Enums.interfacecontrast
  (** Define the contrast mode to use for the user interface.

      When set to [Gtk.InterfaceContrast.MORE] or [Gtk.InterfaceContrast.LESS],
      the UI is rendered in high or low contrast.

      When set to [Gtk.InterfaceContrast.NO_PREFERENCE] (the default), the user
      interface will be rendered in default mode.

      This setting is be available for media queries in CSS:

      {[
      @media (prefers-contrast: more) {
        // some style with high contrast
      }
      ]}

      Changing this setting will cause a re-render of the style sheet. *)

  method set_prefers_contrast : Enums.interfacecontrast -> unit
  (** Define the contrast mode to use for the user interface.

      When set to [Gtk.InterfaceContrast.MORE] or [Gtk.InterfaceContrast.LESS],
      the UI is rendered in high or low contrast.

      When set to [Gtk.InterfaceContrast.NO_PREFERENCE] (the default), the user
      interface will be rendered in default mode.

      This setting is be available for media queries in CSS:

      {[
      @media (prefers-contrast: more) {
        // some style with high contrast
      }
      ]}

      Changing this setting will cause a re-render of the style sheet. *)

  method as_css_provider : Raw.Css_provider.t
end

(* High-level class for CssProvider *)
class css_provider (obj : Raw.Css_provider.t) : css_provider_t =
  object (self)
    inherit Style_provider.style_provider (Raw.Style_provider.from_gobject obj)

    method load_from_bytes : Glib_bytes.t -> unit =
      fun data -> Raw.Css_provider.load_from_bytes obj data

    method load_from_data : string -> int -> unit =
      fun data length -> Raw.Css_provider.load_from_data obj data length

    method load_from_file : Ocgio.File.file_t -> unit =
      fun file ->
        let file = file#as_file in
        Raw.Css_provider.load_from_file obj file

    method load_from_path : string -> unit =
      fun path -> Raw.Css_provider.load_from_path obj path

    method load_from_resource : string -> unit =
      fun resource_path -> Raw.Css_provider.load_from_resource obj resource_path

    method load_from_string : string -> unit =
      fun string -> Raw.Css_provider.load_from_string obj string

    method load_named : string -> string option -> unit =
      fun name variant -> Raw.Css_provider.load_named obj name variant

    method to_string : unit -> string = fun () -> Raw.Css_provider.to_string obj
    method prefers_color_scheme = Raw.Css_provider.get_prefers_color_scheme obj

    method set_prefers_color_scheme v =
      Raw.Css_provider.set_prefers_color_scheme obj v

    method prefers_contrast = Raw.Css_provider.get_prefers_contrast obj
    method set_prefers_contrast v = Raw.Css_provider.set_prefers_contrast obj v
    method as_css_provider = obj
  end

let new_ () : css_provider_t = new css_provider (Raw.Css_provider.new_ ())
