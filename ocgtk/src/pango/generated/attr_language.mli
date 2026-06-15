(* GENERATED CODE - DO NOT EDIT *)
(* AttrLanguage: AttrLanguage *)

type t = [ `attr_language ] Gobject.obj
(** The `PangoAttrLanguage` structure is used to represent attributes that are
    languages. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_value : t -> Language.t = "ml_pango_attr_language_get_value"

(* Setters *)
external set_value : t -> Language.t -> unit
  = "ml_pango_attr_language_set_value"

external make : Language.t -> t = "ml_pango_attr_language_make"
