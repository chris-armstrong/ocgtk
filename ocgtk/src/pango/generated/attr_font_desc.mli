(* GENERATED CODE - DO NOT EDIT *)
(* AttrFontDesc: AttrFontDesc *)

type t = [ `attr_font_desc ] Gobject.obj
(** The `PangoAttrFontDesc` structure is used to store an attribute that sets
    all aspects of the font description at once. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_desc : t -> Font_description.t = "ml_pango_attr_font_desc_get_desc"

(* Setters *)
external set_desc : t -> Font_description.t -> unit
  = "ml_pango_attr_font_desc_set_desc"

external make : Font_description.t -> t = "ml_pango_attr_font_desc_make"
