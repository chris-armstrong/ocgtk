(* GENERATED CODE - DO NOT EDIT *)
(* MapListModel: MapListModel *)

type t = [`map_list_model | `object_] Gobject.obj

(* Methods *)
(** Sets the model to be mapped.

GTK makes no effort to ensure that @model conforms to the item type
expected by the map function. It assumes that the caller knows what
they are doing and have set up an appropriate map function. *)
external set_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option -> unit = "ml_gtk_map_list_model_set_model"

(** Checks if a map function is currently set on @self. *)
external has_map : t -> bool = "ml_gtk_map_list_model_has_map"

(** Gets the model that is currently being mapped or %NULL if none. *)
external get_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option = "ml_gtk_map_list_model_get_model"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_map_list_model_get_n_items"

