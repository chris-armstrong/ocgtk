(* GENERATED CODE - DO NOT EDIT *)
(* MapListModel: MapListModel *)

type t = [`map_list_model | `object_] Gobject.obj

(** Create a new MapListModel *)
external new_ : unit -> unit -> unit -> unit -> t = "ml_gtk_map_list_model_new"

(* Properties *)

(** Get property: has-map *)
external get_has_map : t -> bool = "ml_gtk_map_list_model_get_has_map"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_map_list_model_get_n_items"

(** Checks if a map function is currently set on @self. *)
external has_map : t -> bool = "ml_gtk_map_list_model_has_map"

