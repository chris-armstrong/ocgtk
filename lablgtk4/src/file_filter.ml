(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileFilter *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_file_filter_new"

external new_from_gvariant : unit -> t = "ml_gtk_file_filter_new_from_gvariant"

(* Properties *)

external get_name : t -> string = "ml_gtk_file_filter_get_name"

external set_name : t -> string -> unit = "ml_gtk_file_filter_set_name"

external get_attributes : t -> unit = "ml_gtk_file_filter_get_attributes"

external add_suffix : t -> string -> unit = "ml_gtk_file_filter_add_suffix"

external add_pixbuf_formats : t -> unit = "ml_gtk_file_filter_add_pixbuf_formats"

external add_pattern : t -> string -> unit = "ml_gtk_file_filter_add_pattern"

external add_mime_type : t -> string -> unit = "ml_gtk_file_filter_add_mime_type"

