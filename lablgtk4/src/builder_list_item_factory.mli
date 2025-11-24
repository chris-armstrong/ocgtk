(* GENERATED CODE - DO NOT EDIT *)
(* Widget: BuilderListItemFactory *)

type t = Gtk.Widget.t

(** Create a new BuilderListItemFactory *)
external new_from_bytes : Gtk.Widget.t option -> unit -> t = "ml_gtk_builder_list_item_factory_new_from_bytes"

(** Create a new BuilderListItemFactory *)
external new_from_resource : Gtk.Widget.t option -> string -> t = "ml_gtk_builder_list_item_factory_new_from_resource"

(* Properties *)

(** Get property: resource *)
external get_resource : t -> string = "ml_gtk_builder_list_item_factory_get_resource"

external get_scope : t -> Gtk.Widget.t = "ml_gtk_builder_list_item_factory_get_scope"

