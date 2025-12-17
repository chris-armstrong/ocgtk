(* GENERATED CODE - DO NOT EDIT *)
(* BuilderListItemFactory: BuilderListItemFactory *)

type t = [`builder_list_item_factory | `list_item_factory | `object_] Gobject.obj

(** Create a new BuilderListItemFactory *)
external new_from_bytes : Builder_scope.t option -> unit -> t = "ml_gtk_builder_list_item_factory_new_from_bytes"

(** Create a new BuilderListItemFactory *)
external new_from_resource : Builder_scope.t option -> string -> t = "ml_gtk_builder_list_item_factory_new_from_resource"

(* Properties *)

(** Gets the scope used when constructing listitems. *)
external get_scope : t -> Builder_scope.t option = "ml_gtk_builder_list_item_factory_get_scope"

(** If the data references a resource, gets the path of that resource. *)
external get_resource : t -> string option = "ml_gtk_builder_list_item_factory_get_resource"

