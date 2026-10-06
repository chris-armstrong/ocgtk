(* GENERATED CODE - DO NOT EDIT *)
(* IconTheme: IconTheme *)

[@@@ocaml.text
"Loads themed icons.\n\n\
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

type t = [ `icon_theme | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_icon_theme_new"
(** Create a new IconTheme *)

(* Methods *)

external set_theme_name : t -> string option -> unit
  = "ml_gtk_icon_theme_set_theme_name"
(** Sets the name of the icon theme that the [GtkIconTheme] object uses
    overriding system configuration.

    This function cannot be called on the icon theme objects returned from
    [Gtk.IconTheme.get_for_display]. *)

external set_search_path : t -> string array option -> unit
  = "ml_gtk_icon_theme_set_search_path"
(** Sets the search path for the icon theme object.

    When looking for an icon theme, GTK will search for a subdirectory of one or
    more of the directories in [path] with the same name as the icon theme
    containing an index.theme file. (Themes from multiple of the path elements
    are combined to allow themes to be extended by adding icons in the user’s
    home directory.)

    In addition if an icon found isn’t found either in the current icon theme or
    the default icon theme, and an image file with the right name is found
    directly in one of the elements of [path], then that image will be used for
    the icon name. (This is legacy feature, and new icons should be put into the
    fallback icon theme, which is called hicolor, rather than directly on the
    icon path.) *)

external set_resource_path : t -> string array option -> unit
  = "ml_gtk_icon_theme_set_resource_path"
(** Sets the resource paths that will be looked at when looking for icons,
    similar to search paths.

    The resources are considered as part of the hicolor icon theme and must be
    located in subdirectories that are defined in the hicolor icon theme, such
    as [@path/16x16/actions/run.png] or [@path/scalable/actions/run.svg].

    Icons that are directly placed in the resource path instead of a
    subdirectory are also considered as ultimate fallback, but they are treated
    like unthemed icons. *)

external lookup_icon :
  t ->
  string ->
  string array option ->
  int ->
  int ->
  Gtk_enums.textdirection ->
  Gtk_enums.iconlookupflags ->
  Icon_paintable.t
  = "ml_gtk_icon_theme_lookup_icon_bytecode"
    "ml_gtk_icon_theme_lookup_icon_native"
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

external lookup_by_gicon :
  t ->
  Ocgtk_gio.Gio.Wrappers.Icon.t ->
  int ->
  int ->
  Gtk_enums.textdirection ->
  Gtk_enums.iconlookupflags ->
  Icon_paintable.t
  = "ml_gtk_icon_theme_lookup_by_gicon_bytecode"
    "ml_gtk_icon_theme_lookup_by_gicon_native"
(** Looks up a icon for a desired size and window scale.

    The icon can then be rendered by using it as a [GdkPaintable], or you can
    get information such as the filename and size. *)

external has_icon : t -> string -> bool = "ml_gtk_icon_theme_has_icon"
(** Checks whether an icon theme includes an icon for a particular name. *)

external has_gicon : t -> Ocgtk_gio.Gio.Wrappers.Icon.t -> bool
  = "ml_gtk_icon_theme_has_gicon"
(** Checks whether an icon theme includes an icon for a particular [GIcon]. *)

external get_theme_name : t -> string = "ml_gtk_icon_theme_get_theme_name"
(** Gets the current icon theme name. *)

external get_search_path : t -> string array option
  = "ml_gtk_icon_theme_get_search_path"
(** Gets the current search path.

    See [Gtk.IconTheme.set_search_path]. *)

external get_resource_path : t -> string array option
  = "ml_gtk_icon_theme_get_resource_path"
(** Gets the current resource path.

    See [Gtk.IconTheme.set_resource_path]. *)

external get_icon_names : t -> string array = "ml_gtk_icon_theme_get_icon_names"
(** Lists the names of icons in the current icon theme. *)

external get_display : t -> Ocgtk_gdk.Gdk.Wrappers.Display.t option
  = "ml_gtk_icon_theme_get_display"
(** Returns the display that the [GtkIconTheme] object was created for. *)

external add_search_path : t -> string -> unit
  = "ml_gtk_icon_theme_add_search_path"
(** Appends a directory to the search path.

    See [Gtk.IconTheme.set_search_path]. *)

external add_resource_path : t -> string -> unit
  = "ml_gtk_icon_theme_add_resource_path"
(** Adds a resource path that will be looked at when looking for icons, similar
    to search paths.

    See [Gtk.IconTheme.set_resource_path].

    This function should be used to make application-specific icons available as
    part of the icon theme. *)

(* Properties *)

let on_changed ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"changed" ~callback
    ~after:(Option.value after ~default:false)
