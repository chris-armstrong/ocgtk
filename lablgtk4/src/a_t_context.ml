(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ATContext *)

type t = Gtk.widget

(** Create a new ATContext *)
external gtk_at_context_create : Gtk_enums.accessiblerole -> Gtk.widget -> unit -> t = "ml_gtk_at_context_create"

(* Properties *)

(** Retrieves the accessible role of this context. *)
external gtk_at_context_get_accessible_role : t -> Gtk_enums.accessiblerole = "ml_gtk_at_context_get_accessible_role"

(** Retrieves the `GtkAccessible` using this context. *)
external gtk_at_context_get_accessible : t -> Gtk.widget = "ml_gtk_at_context_get_accessible"

