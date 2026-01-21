(* GENERATED CODE - DO NOT EDIT *)
(* IconTheme: IconTheme *)

type t = [`icon_theme | `object_] Gobject.obj

(** Create a new IconTheme *)
external new_ : unit -> t = "ml_gtk_icon_theme_new"

(* Methods *)
(** Sets the name of the icon theme that the `GtkIconTheme` object uses
overriding system configuration.

This function cannot be called on the icon theme objects returned
from [func@Gtk.IconTheme.get_for_display]. *)
external set_theme_name : t -> string option -> unit = "ml_gtk_icon_theme_set_theme_name"

(** Sets the resource paths that will be looked at when
looking for icons, similar to search paths.

The resources are considered as part of the hicolor icon theme
and must be located in subdirectories that are defined in the
hicolor icon theme, such as `@path/16x16/actions/run.png`
or `@path/scalable/actions/run.svg`.

Icons that are directly placed in the resource path instead
of a subdirectory are also considered as ultimate fallback,
but they are treated like unthemed icons. *)
external set_resource_path : t -> string array option -> unit = "ml_gtk_icon_theme_set_resource_path"

(** Looks up a named icon for a desired size and window scale,
returning a `GtkIconPaintable`.

The icon can then be rendered by using it as a `GdkPaintable`,
or you can get information such as the filename and size.

If the available @icon_name is not available and @fallbacks are
provided, they will be tried in order.

If no matching icon is found, then a paintable that renders the
"missing icon" icon is returned. If you need to do something else
for missing icons you need to use [method@Gtk.IconTheme.has_icon].

Note that you probably want to listen for icon theme changes and
update the icon. This is usually done by overriding the
GtkWidgetClass.css-changed() function. *)
external lookup_icon : t -> string -> string array option -> int -> int -> Gtk_enums.textdirection -> Gtk_enums.iconlookupflags -> Icon_paintable.t = "ml_gtk_icon_theme_lookup_icon_bytecode" "ml_gtk_icon_theme_lookup_icon_native"

(** Checks whether an icon theme includes an icon
for a particular name. *)
external has_icon : t -> string -> bool = "ml_gtk_icon_theme_has_icon"

(** Gets the current icon theme name.

Returns (transfer full): the current icon theme name, *)
external get_theme_name : t -> string = "ml_gtk_icon_theme_get_theme_name"

(** Gets the current resource path.

See [method@Gtk.IconTheme.set_resource_path]. *)
external get_resource_path : t -> string array option = "ml_gtk_icon_theme_get_resource_path"

(** Returns an array of integers describing the sizes at which
the icon is available without scaling.

A size of -1 means that the icon is available in a scalable
format. The array is zero-terminated. *)
external get_icon_sizes : t -> string -> int array = "ml_gtk_icon_theme_get_icon_sizes"

(** Lists the names of icons in the current icon theme. *)
external get_icon_names : t -> string array = "ml_gtk_icon_theme_get_icon_names"

(** Appends a directory to the search path.

See [method@Gtk.IconTheme.set_search_path]. *)
external add_search_path : t -> string -> unit = "ml_gtk_icon_theme_add_search_path"

(** Adds a resource path that will be looked at when looking
for icons, similar to search paths.

See [method@Gtk.IconTheme.set_resource_path].

This function should be used to make application-specific icons
available as part of the icon theme. *)
external add_resource_path : t -> string -> unit = "ml_gtk_icon_theme_add_resource_path"

(* Properties *)

