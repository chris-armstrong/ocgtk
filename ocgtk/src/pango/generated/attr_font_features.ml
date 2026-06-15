(* GENERATED CODE - DO NOT EDIT *)
(* AttrFontFeatures: AttrFontFeatures *)

type t = [ `attr_font_features ] Gobject.obj
(** The `PangoAttrFontFeatures` structure is used to represent OpenType font
    features as an attribute. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_features : t -> string = "ml_pango_attr_font_features_get_features"

(* Setters *)
external set_features : t -> string -> unit
  = "ml_pango_attr_font_features_set_features"

external make : string -> t = "ml_pango_attr_font_features_make"
