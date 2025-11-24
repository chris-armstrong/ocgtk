(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Statusbar *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_statusbar_new"

external remove_all : t -> int -> unit = "ml_gtk_statusbar_remove_all"

external remove : t -> int -> int -> unit = "ml_gtk_statusbar_remove"

external push : t -> int -> string -> int = "ml_gtk_statusbar_push"

external pop : t -> int -> unit = "ml_gtk_statusbar_pop"

external get_context_id : t -> string -> int = "ml_gtk_statusbar_get_context_id"

