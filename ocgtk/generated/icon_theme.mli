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
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-icon_theme_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Icon_theme}."]

(** The methods, signals and properties of a [GtkIconTheme]. *)
class type icon_theme_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method add_resource_path : string -> unit
  method add_search_path : string -> unit
  method get_display : unit -> Ocgdk.Display.display_t option
  method get_icon_names : unit -> string array
  method get_resource_path : unit -> string array option
  method get_search_path : unit -> string array option
  method get_theme_name : unit -> string
  method has_gicon : Ocgio.Icon.icon_t -> bool
  method has_icon : string -> bool

  method lookup_by_gicon :
    Ocgio.Icon.icon_t ->
    int ->
    int ->
    Enums.textdirection ->
    Enums.iconlookupflags ->
    Icon_paintable.icon_paintable_t

  method lookup_icon :
    string ->
    string array option ->
    int ->
    int ->
    Enums.textdirection ->
    Enums.iconlookupflags ->
    Icon_paintable.icon_paintable_t

  method set_resource_path : string array option -> unit
  method set_search_path : string array option -> unit
  method set_theme_name : string option -> unit
  method as_icon_theme : Raw.Icon_theme.t
end

class icon_theme : Raw.Icon_theme.t -> icon_theme_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Icon_theme.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkIconTheme], give one already wrapped. *)

val new_ : unit -> icon_theme_t
