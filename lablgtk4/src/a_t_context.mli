(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ATContext *)

type t = Gtk.Widget.t

(** Create a new ATContext *)
external gtk_at_context_create : Gtk_enums.accessiblerole -> Gtk.Widget.t -> unit -> t = "ml_gtk_at_context_create"

(* Properties *)

external gtk_at_context_get_accessible_role : t -> Gtk_enums.accessiblerole = "ml_gtk_at_context_get_accessible_role"

external gtk_at_context_get_accessible : t -> Gtk.Widget.t = "ml_gtk_at_context_get_accessible"

