(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StringList *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_string_list_new"

(* Properties *)

external get_n_items : t -> int = "ml_gtk_string_list_get_n_items"

external remove : t -> int -> unit = "ml_gtk_string_list_remove"

external get_string : t -> int -> string = "ml_gtk_string_list_get_string"

external append : t -> string -> unit = "ml_gtk_string_list_append"

