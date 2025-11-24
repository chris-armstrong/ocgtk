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

external set_scope : t -> Gtk.Widget.t option -> unit = "ml_gtk_builder_set_scope"

external get_scope : t -> Gtk.Widget.t = "ml_gtk_builder_get_scope"

external add_from_resource : t -> string -> (bool, GError.t) result = "ml_gtk_builder_add_from_resource"

external add_from_file : t -> string -> (bool, GError.t) result = "ml_gtk_builder_add_from_file"

