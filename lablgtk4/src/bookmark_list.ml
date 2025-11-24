(* GENERATED CODE - DO NOT EDIT *)
(* Widget: BookmarkList *)

type t = Gtk.Widget.t

external new_ : string option -> string option -> t = "ml_gtk_bookmark_list_new"

(* Properties *)

external get_attributes : t -> string = "ml_gtk_bookmark_list_get_attributes"

external set_attributes : t -> string -> unit = "ml_gtk_bookmark_list_set_attributes"

external get_filename : t -> string = "ml_gtk_bookmark_list_get_filename"

external get_io_priority : t -> int = "ml_gtk_bookmark_list_get_io_priority"

external set_io_priority : t -> int -> unit = "ml_gtk_bookmark_list_set_io_priority"

external get_loading : t -> bool = "ml_gtk_bookmark_list_get_loading"

external get_n_items : t -> int = "ml_gtk_bookmark_list_get_n_items"

external is_loading : t -> bool = "ml_gtk_bookmark_list_is_loading"

