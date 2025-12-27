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

(** Checks whether an icon theme includes an icon
for a particular name. *)
external has_icon : t -> string -> bool = "ml_gtk_icon_theme_has_icon"

(** Gets the current icon theme name.

Returns (transfer full): the current icon theme name, *)
external get_theme_name : t -> string = "ml_gtk_icon_theme_get_theme_name"

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

