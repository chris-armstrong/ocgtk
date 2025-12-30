(* GENERATED CODE - DO NOT EDIT *)
(* ListStore: ListStore *)

type t = [`list_store | `object_] Gobject.obj

(** Create a new ListStore *)
external new_ : unit -> t = "ml_g_list_store_new"

(* Methods *)
(** Removes all items from @store. *)
external remove_all : t -> unit = "ml_g_list_store_remove_all"

(** Removes the item from @store that is at @position. @position must be
smaller than the current length of the list.

Use g_list_store_splice() to remove multiple items at the same time
efficiently. *)
external remove : t -> int -> unit = "ml_g_list_store_remove"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_list_store_get_n_items"

