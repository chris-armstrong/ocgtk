(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IconTheme *)

type t = Gtk.widget

(** Create a new IconTheme *)
external new_ : unit -> t = "ml_gtk_icon_theme_new"

(* Properties *)

(** Get property: theme-name *)
external get_theme_name : t -> string = "ml_gtk_icon_theme_get_theme_name"

(** Set property: theme-name *)
external set_theme_name : t -> string -> unit = "ml_gtk_icon_theme_set_theme_name"

external has_icon : t -> string -> bool = "ml_gtk_icon_theme_has_icon"

external get_search_path : t -> unit = "ml_gtk_icon_theme_get_search_path"

external get_resource_path : t -> unit = "ml_gtk_icon_theme_get_resource_path"

external get_icon_sizes : t -> string -> unit = "ml_gtk_icon_theme_get_icon_sizes"

external get_icon_names : t -> unit = "ml_gtk_icon_theme_get_icon_names"

external add_search_path : t -> string -> unit = "ml_gtk_icon_theme_add_search_path"

external add_resource_path : t -> string -> unit = "ml_gtk_icon_theme_add_resource_path"

