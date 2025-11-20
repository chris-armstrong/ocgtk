(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IconTheme *)

type t = Gtk.Widget.t

(** Create a new IconTheme *)
external new_ : unit -> t = "ml_gtk_icon_theme_new"

(* Properties *)

(** Get property: theme-name *)
external get_theme_name : t -> string = "ml_gtk_icon_theme_get_theme_name"

(** Set property: theme-name *)
external set_theme_name : t -> string -> unit = "ml_gtk_icon_theme_set_theme_name"

external set_search_path : t -> unit -> unit = "ml_gtk_icon_theme_set_search_path"

external set_resource_path : t -> unit -> unit = "ml_gtk_icon_theme_set_resource_path"

external lookup_icon : t -> string -> unit -> int -> int -> Gtk_enums.textdirection -> Gtk_enums.iconlookupflags -> Gtk.Widget.t = "ml_gtk_icon_theme_lookup_icon_bytecode" "ml_gtk_icon_theme_lookup_icon_native"

external lookup_by_gicon : t -> unit -> int -> int -> Gtk_enums.textdirection -> Gtk_enums.iconlookupflags -> Gtk.Widget.t = "ml_gtk_icon_theme_lookup_by_gicon_bytecode" "ml_gtk_icon_theme_lookup_by_gicon_native"

external has_icon : t -> string -> bool = "ml_gtk_icon_theme_has_icon"

external has_gicon : t -> unit -> bool = "ml_gtk_icon_theme_has_gicon"

external get_search_path : t -> unit = "ml_gtk_icon_theme_get_search_path"

external get_resource_path : t -> unit = "ml_gtk_icon_theme_get_resource_path"

external get_icon_sizes : t -> string -> unit = "ml_gtk_icon_theme_get_icon_sizes"

external get_icon_names : t -> unit = "ml_gtk_icon_theme_get_icon_names"

external add_search_path : t -> string -> unit = "ml_gtk_icon_theme_add_search_path"

external add_resource_path : t -> string -> unit = "ml_gtk_icon_theme_add_resource_path"

