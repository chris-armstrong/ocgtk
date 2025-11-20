(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StringList *)

type t = Gtk.Widget.t

(** Create a new StringList *)
external new_ : unit -> t = "ml_gtk_string_list_new"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_string_list_get_n_items"

external take : t -> string -> unit = "ml_gtk_string_list_take"

external splice : t -> int -> int -> unit -> unit = "ml_gtk_string_list_splice"

external remove : t -> int -> unit = "ml_gtk_string_list_remove"

external get_string : t -> int -> string = "ml_gtk_string_list_get_string"

external append : t -> string -> unit = "ml_gtk_string_list_append"

