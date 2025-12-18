(* GENERATED CODE - DO NOT EDIT *)
(* SliceListModel: SliceListModel *)

type t = [`slice_list_model | `object_] Gobject.obj

(** Create a new SliceListModel *)
external new_ : unit -> int -> int -> t = "ml_gtk_slice_list_model_new"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_slice_list_model_get_n_items"

(** Get property: offset *)
external get_offset : t -> int = "ml_gtk_slice_list_model_get_offset"

(** Set property: offset *)
external set_offset : t -> int -> unit = "ml_gtk_slice_list_model_set_offset"

(** Get property: size *)
external get_size : t -> int = "ml_gtk_slice_list_model_get_size"

(** Set property: size *)
external set_size : t -> int -> unit = "ml_gtk_slice_list_model_set_size"

