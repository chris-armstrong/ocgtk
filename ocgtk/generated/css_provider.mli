(** A style provider for CSS.

    Its methods, signals and properties are on {!class-type-css_provider_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Css_provider}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CssProvider].}

    Implements:
    - {{!Ocgtk.Style_provider.class-type-style_provider_t}Ocgtk.Style_provider}

    A style provider for CSS.

    It is able to parse CSS-like input in order to style widgets.

    An application can make GTK parse a specific CSS style sheet by calling
    {{!Ocgtk.Css_provider.class-type-css_provider_t.method-load_from_file}[Gtk.CssProvider.load_from_file]}
    or
    {{!Ocgtk.Css_provider.class-type-css_provider_t.method-load_from_resource}[Gtk.CssProvider.load_from_resource]}
    and adding the provider with
    {{!Ocgtk.Style_context.class-type-style_context_t.method-add_provider}[Gtk.StyleContext.add_provider]}
    or [Gtk.StyleContext.add_provider_for_display].

    In addition, certain files will be read when GTK is initialized. First, the
    file [$XDG_CONFIG_HOME/gtk-4.0/gtk.css] is loaded if it exists. Then, GTK
    loads the first existing file among
    [XDG_DATA_HOME/themes/THEME/gtk-VERSION/gtk-VARIANT.css],
    [$HOME/.themes/THEME/gtk-VERSION/gtk-VARIANT.css],
    [$XDG_DATA_DIRS/themes/THEME/gtk-VERSION/gtk-VARIANT.css] and
    [DATADIR/share/themes/THEME/gtk-VERSION/gtk-VARIANT.css], where [THEME] is
    the name of the current theme (see the
    {{!Ocgtk.Settings.class-type-settings_t.method-gtk_theme_name}[Gtk.Settings:gtk-theme-name]}
    setting), [VARIANT] is the variant to load (see the
    {{!Ocgtk.Settings.class-type-settings_t.method-gtk_application_prefer_dark_theme}
     [Gtk.Settings:gtk-application-prefer-dark-theme]} setting), [DATADIR] is
    the prefix configured when GTK was compiled (unless overridden by the
    [GTK_DATA_PREFIX] environment variable), and [VERSION] is the GTK version
    number. If no file is found for the current version, GTK tries older
    versions all the way back to 4.0.

    To track errors while loading CSS, connect to the
    [Gtk.CssProvider::parsing-error] signal. *)
class type css_provider_t = object
  inherit Style_provider.style_provider_t

  (** {2:methods Methods} *)

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

  (** {2:properties Properties} *)

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

  (** {2:conversions Conversions} *)

  method as_css_provider : Raw.Css_provider.t
end

class css_provider : Raw.Css_provider.t -> css_provider_t
(** Wraps a raw handle of {!Ocgtk.Raw.Css_provider.t}. *)

(** {1:description Description}

    A style provider for CSS.

    It is able to parse CSS-like input in order to style widgets.

    An application can make GTK parse a specific CSS style sheet by calling
    {{!Ocgtk.Css_provider.class-type-css_provider_t.method-load_from_file}[Gtk.CssProvider.load_from_file]}
    or
    {{!Ocgtk.Css_provider.class-type-css_provider_t.method-load_from_resource}[Gtk.CssProvider.load_from_resource]}
    and adding the provider with
    {{!Ocgtk.Style_context.class-type-style_context_t.method-add_provider}[Gtk.StyleContext.add_provider]}
    or [Gtk.StyleContext.add_provider_for_display].

    In addition, certain files will be read when GTK is initialized. First, the
    file [$XDG_CONFIG_HOME/gtk-4.0/gtk.css] is loaded if it exists. Then, GTK
    loads the first existing file among
    [XDG_DATA_HOME/themes/THEME/gtk-VERSION/gtk-VARIANT.css],
    [$HOME/.themes/THEME/gtk-VERSION/gtk-VARIANT.css],
    [$XDG_DATA_DIRS/themes/THEME/gtk-VERSION/gtk-VARIANT.css] and
    [DATADIR/share/themes/THEME/gtk-VERSION/gtk-VARIANT.css], where [THEME] is
    the name of the current theme (see the
    {{!Ocgtk.Settings.class-type-settings_t.method-gtk_theme_name}[Gtk.Settings:gtk-theme-name]}
    setting), [VARIANT] is the variant to load (see the
    {{!Ocgtk.Settings.class-type-settings_t.method-gtk_application_prefer_dark_theme}
     [Gtk.Settings:gtk-application-prefer-dark-theme]} setting), [DATADIR] is
    the prefix configured when GTK was compiled (unless overridden by the
    [GTK_DATA_PREFIX] environment variable), and [VERSION] is the GTK version
    number. If no file is found for the current version, GTK tries older
    versions all the way back to 4.0.

    To track errors while loading CSS, connect to the
    [Gtk.CssProvider::parsing-error] signal. *)

(** {1:constructors Constructors} *)

val new_ : unit -> css_provider_t
(** Returns a newly created [GtkCssProvider]. *)
