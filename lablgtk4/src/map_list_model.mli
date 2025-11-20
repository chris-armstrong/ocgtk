(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MapListModel *)

type t = Gtk.Widget.t

(** Create a new MapListModel *)
external new_ : unit -> unit -> unit -> unit -> t = "ml_gtk_map_list_model_new"

(* Properties *)

(** Get property: has-map *)
external get_has_map : t -> bool = "ml_gtk_map_list_model_get_has_map"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_map_list_model_get_n_items"

external set_model : t -> unit -> unit = "ml_gtk_map_list_model_set_model"

external set_map_func : t -> unit -> unit -> unit -> unit = "ml_gtk_map_list_model_set_map_func"

external has_map : t -> bool = "ml_gtk_map_list_model_has_map"

