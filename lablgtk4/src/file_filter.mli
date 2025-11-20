(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileFilter *)

type t = Gtk.Widget.t

(** Create a new FileFilter *)
external new_ : unit -> t = "ml_gtk_file_filter_new"

(** Create a new FileFilter *)
external new_from_gvariant : unit -> t = "ml_gtk_file_filter_new_from_gvariant"

(* Properties *)

(** Get property: name *)
external get_name : t -> string = "ml_gtk_file_filter_get_name"

(** Set property: name *)
external set_name : t -> string -> unit = "ml_gtk_file_filter_set_name"

external get_attributes : t -> unit = "ml_gtk_file_filter_get_attributes"

external add_suffix : t -> string -> unit = "ml_gtk_file_filter_add_suffix"

external add_pixbuf_formats : t -> unit = "ml_gtk_file_filter_add_pixbuf_formats"

external add_pattern : t -> string -> unit = "ml_gtk_file_filter_add_pattern"

external add_mime_type : t -> string -> unit = "ml_gtk_file_filter_add_mime_type"

