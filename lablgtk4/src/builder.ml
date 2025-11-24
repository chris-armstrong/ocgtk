(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Builder *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_builder_new"

external new_from_file : string -> t = "ml_gtk_builder_new_from_file"

external new_from_resource : string -> t = "ml_gtk_builder_new_from_resource"

external new_from_string : string -> unit -> t = "ml_gtk_builder_new_from_string"

(* Properties *)

external get_translation_domain : t -> string = "ml_gtk_builder_get_translation_domain"

external set_translation_domain : t -> string -> unit = "ml_gtk_builder_set_translation_domain"

external set_scope : t -> Gtk.widget option -> unit = "ml_gtk_builder_set_scope"

external get_scope : t -> Gtk.widget = "ml_gtk_builder_get_scope"

external add_from_resource : t -> string -> (bool, GError.t) result = "ml_gtk_builder_add_from_resource"

external add_from_file : t -> string -> (bool, GError.t) result = "ml_gtk_builder_add_from_file"

