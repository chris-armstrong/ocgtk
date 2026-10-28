(** Loads themed icons.

    Its methods, signals and properties are on {!class-type-icon_theme_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Icon_theme}. *)

(** {1:class Class} *)

class type icon_theme_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the icon theme changes.

      This can happen because current icon theme is switched or because GTK
      detects that a change has occurred in the contents of the current icon
      theme. *)

  method add_resource_path : string -> unit
  (** Adds a resource path that will be looked at when looking for icons,
      similar to search paths.

      See [Gtk.IconTheme.set_resource_path].

      This function should be used to make application-specific icons available
      as part of the icon theme. *)

  method add_search_path : string -> unit
  (** Appends a directory to the search path.

      See [Gtk.IconTheme.set_search_path]. *)

  method get_display : unit -> Ocgdk.Display.display_t option
  (** Returns the display that the [GtkIconTheme] object was created for. *)

  method get_icon_names : unit -> string array
  (** Lists the names of icons in the current icon theme. *)

  method get_resource_path : unit -> string array option
  (** Gets the current resource path.

      See [Gtk.IconTheme.set_resource_path]. *)

  method get_search_path : unit -> string array option
  (** Gets the current search path.

      See [Gtk.IconTheme.set_search_path]. *)

  method get_theme_name : unit -> string
  (** Gets the current icon theme name. *)

  method has_gicon : Ocgio.Icon.icon_t -> bool
  (** Checks whether an icon theme includes an icon for a particular [GIcon]. *)

  method has_icon : string -> bool
  (** Checks whether an icon theme includes an icon for a particular name. *)

  method lookup_by_gicon :
    Ocgio.Icon.icon_t ->
    int ->
    int ->
    Enums.textdirection ->
    Enums.iconlookupflags ->
    Icon_paintable.icon_paintable_t
  (** Looks up a icon for a desired size and window scale.

      The icon can then be rendered by using it as a [GdkPaintable], or you can
      get information such as the filename and size. *)

  method lookup_icon :
    string ->
    string array option ->
    int ->
    int ->
    Enums.textdirection ->
    Enums.iconlookupflags ->
    Icon_paintable.icon_paintable_t
  [@@ocaml.doc
    "Looks up a named icon for a desired size and window scale,\n\
     returning a [GtkIconPaintable].\n\n\
     The icon can then be rendered by using it as a [GdkPaintable],\n\
     or you can get information such as the filename and size.\n\n\
     If the available [icon_name] is not available and [fallbacks] are\n\
     provided, they will be tried in order.\n\n\
     If no matching icon is found, then a paintable that renders the\n\
     \"missing icon\" icon is returned. If you need to do something else\n\
     for missing icons you need to use [Gtk.IconTheme.has_icon].\n\n\
     Note that you probably want to listen for icon theme changes and\n\
     update the icon. This is usually done by overriding the\n\
     GtkWidgetClass.css-changed() function."]

  method set_resource_path : string array option -> unit
  (** Sets the resource paths that will be looked at when looking for icons,
      similar to search paths.

      The resources are considered as part of the hicolor icon theme and must be
      located in subdirectories that are defined in the hicolor icon theme, such
      as [@path/16x16/actions/run.png] or [@path/scalable/actions/run.svg].

      Icons that are directly placed in the resource path instead of a
      subdirectory are also considered as ultimate fallback, but they are
      treated like unthemed icons. *)

  method set_search_path : string array option -> unit
  (** Sets the search path for the icon theme object.

      When looking for an icon theme, GTK will search for a subdirectory of one
      or more of the directories in [path] with the same name as the icon theme
      containing an index.theme file. (Themes from multiple of the path elements
      are combined to allow themes to be extended by adding icons in the user’s
      home directory.)

      In addition if an icon found isn’t found either in the current icon theme
      or the default icon theme, and an image file with the right name is found
      directly in one of the elements of [path], then that image will be used
      for the icon name. (This is legacy feature, and new icons should be put
      into the fallback icon theme, which is called hicolor, rather than
      directly on the icon path.) *)

  method set_theme_name : string option -> unit
  (** Sets the name of the icon theme that the [GtkIconTheme] object uses
      overriding system configuration.

      This function cannot be called on the icon theme objects returned from
      [Gtk.IconTheme.get_for_display]. *)

  method as_icon_theme : Raw.Icon_theme.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [IconTheme].}\n\n\
     Loads themed icons.\n\n\
     The main reason for using a name rather than simply providing a filename\n\
     is to allow different icons to be used depending on what “icon theme” is\n\
     selected by the user. The operation of icon themes on Linux and Unix\n\
     follows the Icon Theme Specification\n\
     There is a fallback icon theme, named [hicolor], where applications\n\
     should install their icons, but additional icon themes can be installed\n\
     as operating system vendors and users choose.\n\n\
     In many cases, named themes are used indirectly, via [Gtk.Image]\n\
     rather than directly, but looking up icons directly is also simple. The\n\
     [GtkIconTheme] object acts as a database of all the icons in the current\n\
     theme. You can create new [GtkIconTheme] objects, but it’s much more\n\
     efficient to use the standard icon theme of the [GtkWidget] so that the\n\
     icon information is shared with other people looking up icons.\n\n\
     {[\n\
     GtkIconTheme *icon_theme;\n\
     GtkIconPaintable *icon;\n\
     GdkPaintable *paintable;\n\n\
     icon_theme = gtk_icon_theme_get_for_display (gtk_widget_get_display \
     (my_widget));\n\
     icon = gtk_icon_theme_lookup_icon (icon_theme,\n\
    \                                   \"my-icon-name\", // icon name\n\
    \                                   48, // icon size\n\
    \                                   1,  // scale\n\
    \                                   0,  // flags);\n\
     paintable = GDK_PAINTABLE (icon);\n\
     // Use the paintable\n\
     g_object_unref (icon);\n\
     ]}"]

class icon_theme : Raw.Icon_theme.t -> icon_theme_t
(** Wraps a raw handle of {!Ocgtk.Raw.Icon_theme.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Loads themed icons.\n\n\
 The main reason for using a name rather than simply providing a filename\n\
 is to allow different icons to be used depending on what “icon theme” is\n\
 selected by the user. The operation of icon themes on Linux and Unix\n\
 follows the Icon Theme Specification\n\
 There is a fallback icon theme, named [hicolor], where applications\n\
 should install their icons, but additional icon themes can be installed\n\
 as operating system vendors and users choose.\n\n\
 In many cases, named themes are used indirectly, via [Gtk.Image]\n\
 rather than directly, but looking up icons directly is also simple. The\n\
 [GtkIconTheme] object acts as a database of all the icons in the current\n\
 theme. You can create new [GtkIconTheme] objects, but it’s much more\n\
 efficient to use the standard icon theme of the [GtkWidget] so that the\n\
 icon information is shared with other people looking up icons.\n\n\
 {[\n\
 GtkIconTheme *icon_theme;\n\
 GtkIconPaintable *icon;\n\
 GdkPaintable *paintable;\n\n\
 icon_theme = gtk_icon_theme_get_for_display (gtk_widget_get_display \
 (my_widget));\n\
 icon = gtk_icon_theme_lookup_icon (icon_theme,\n\
\                                   \"my-icon-name\", // icon name\n\
\                                   48, // icon size\n\
\                                   1,  // scale\n\
\                                   0,  // flags);\n\
 paintable = GDK_PAINTABLE (icon);\n\
 // Use the paintable\n\
 g_object_unref (icon);\n\
 ]}"]

(** {1:constructors Constructors} *)

val new_ : unit -> icon_theme_t
(** Creates a new icon theme object.

    Icon theme objects are used to lookup up an icon by name in a particular
    icon theme. Usually, you’ll want to use [Gtk.IconTheme.get_for_display]
    rather than creating a new icon theme object for scratch. *)
