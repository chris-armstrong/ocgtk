(* GENERATED CODE - DO NOT EDIT *)
(* BookmarkList: BookmarkList *)

type t = [`bookmark_list | `object_] Gobject.obj

(** Create a new BookmarkList *)
external new_ : string option -> string option -> t = "ml_gtk_bookmark_list_new"

(* Properties *)

(** Get property: attributes *)
external get_attributes : t -> string = "ml_gtk_bookmark_list_get_attributes"

(** Set property: attributes *)
external set_attributes : t -> string -> unit = "ml_gtk_bookmark_list_set_attributes"

(** Get property: filename *)
external get_filename : t -> string = "ml_gtk_bookmark_list_get_filename"

(** Get property: io-priority *)
external get_io_priority : t -> int = "ml_gtk_bookmark_list_get_io_priority"

(** Set property: io-priority *)
external set_io_priority : t -> int -> unit = "ml_gtk_bookmark_list_set_io_priority"

(** Get property: loading *)
external get_loading : t -> bool = "ml_gtk_bookmark_list_get_loading"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_bookmark_list_get_n_items"

(** Returns %TRUE if the files are currently being loaded.

Files will be added to @self from time to time while loading is
going on. The order in which are added is undefined and may change
in between runs. *)
external is_loading : t -> bool = "ml_gtk_bookmark_list_is_loading"

