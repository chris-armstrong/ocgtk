(* GENERATED CODE - DO NOT EDIT *)
(* Widget: RecentManager *)

type t = Gtk.Widget.t

(** Create a new RecentManager *)
external new_ : unit -> t = "ml_gtk_recent_manager_new"

(* Properties *)

(** Get property: filename *)
external get_filename : t -> string = "ml_gtk_recent_manager_get_filename"

(** Get property: size *)
external get_size : t -> int = "ml_gtk_recent_manager_get_size"

external remove_item : t -> string -> (bool, GError.t) result = "ml_gtk_recent_manager_remove_item"

external purge_items : t -> (int, GError.t) result = "ml_gtk_recent_manager_purge_items"

external move_item : t -> string -> string option -> (bool, GError.t) result = "ml_gtk_recent_manager_move_item"

external lookup_item : t -> string -> (Gtk.Widget.t, GError.t) result = "ml_gtk_recent_manager_lookup_item"

external has_item : t -> string -> bool = "ml_gtk_recent_manager_has_item"

external add_item : t -> string -> bool = "ml_gtk_recent_manager_add_item"

external add_full : t -> string -> unit -> bool = "ml_gtk_recent_manager_add_full"

