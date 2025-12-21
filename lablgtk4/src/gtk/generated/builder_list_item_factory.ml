(* GENERATED CODE - DO NOT EDIT *)
(* BuilderListItemFactory: BuilderListItemFactory *)

type t = [`builder_list_item_factory | `list_item_factory | `object_] Gobject.obj

(** Create a new BuilderListItemFactory *)
external new_from_bytes : unit -> unit -> t = "ml_gtk_builder_list_item_factory_new_from_bytes"

(** Create a new BuilderListItemFactory *)
external new_from_resource : unit -> string -> t = "ml_gtk_builder_list_item_factory_new_from_resource"

(* Methods *)
(** If the data references a resource, gets the path of that resource. *)
external get_resource : t -> string option = "ml_gtk_builder_list_item_factory_get_resource"

(* Properties *)

