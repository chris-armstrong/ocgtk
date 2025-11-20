(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Builder *)

type t = Gtk.Widget.t

(** Create a new Builder *)
external new_ : unit -> t = "ml_gtk_builder_new"

(** Create a new Builder *)
external new_from_file : string -> t = "ml_gtk_builder_new_from_file"

(** Create a new Builder *)
external new_from_resource : string -> t = "ml_gtk_builder_new_from_resource"

(** Create a new Builder *)
external new_from_string : string -> unit -> t = "ml_gtk_builder_new_from_string"

(* Properties *)

(** Get property: translation-domain *)
external get_translation_domain : t -> string = "ml_gtk_builder_get_translation_domain"

(** Set property: translation-domain *)
external set_translation_domain : t -> string -> unit = "ml_gtk_builder_set_translation_domain"

external value_from_string_type : t -> unit -> string -> unit -> (bool, GError.t) result = "ml_gtk_builder_value_from_string_type"

external value_from_string : t -> unit -> string -> unit -> (bool, GError.t) result = "ml_gtk_builder_value_from_string"

external set_scope : t -> Gtk.Widget.t option -> unit = "ml_gtk_builder_set_scope"

external set_current_object : t -> unit -> unit = "ml_gtk_builder_set_current_object"

external get_scope : t -> Gtk.Widget.t = "ml_gtk_builder_get_scope"

external extend_with_template : t -> unit -> unit -> string -> unit -> (bool, GError.t) result = "ml_gtk_builder_extend_with_template"

external expose_object : t -> string -> unit -> unit = "ml_gtk_builder_expose_object"

external add_objects_from_string : t -> string -> unit -> unit -> (bool, GError.t) result = "ml_gtk_builder_add_objects_from_string"

external add_objects_from_resource : t -> string -> unit -> (bool, GError.t) result = "ml_gtk_builder_add_objects_from_resource"

external add_objects_from_file : t -> string -> unit -> (bool, GError.t) result = "ml_gtk_builder_add_objects_from_file"

external add_from_string : t -> string -> unit -> (bool, GError.t) result = "ml_gtk_builder_add_from_string"

external add_from_resource : t -> string -> (bool, GError.t) result = "ml_gtk_builder_add_from_resource"

external add_from_file : t -> string -> (bool, GError.t) result = "ml_gtk_builder_add_from_file"

