(* GENERATED CODE - DO NOT EDIT *)
(* Widget: BuilderListItemFactory *)

type t = Gtk.widget

(** Create a new BuilderListItemFactory *)
external new_from_bytes : Gtk.widget option -> unit -> t = "ml_gtk_builder_list_item_factory_new_from_bytes"

(** Create a new BuilderListItemFactory *)
external new_from_resource : Gtk.widget option -> string -> t = "ml_gtk_builder_list_item_factory_new_from_resource"

(* Properties *)

(** Gets the scope used when constructing listitems. *)
external get_scope : t -> Gtk.widget option = "ml_gtk_builder_list_item_factory_get_scope"

(** If the data references a resource, gets the path of that resource. *)
external get_resource : t -> string option = "ml_gtk_builder_list_item_factory_get_resource"

