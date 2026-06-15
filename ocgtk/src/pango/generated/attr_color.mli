(* GENERATED CODE - DO NOT EDIT *)
(* AttrColor: AttrColor *)

type t = [ `attr_color ] Gobject.obj
(** The `PangoAttrColor` structure is used to represent attributes that are
    colors. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_color : t -> Color.t = "ml_pango_attr_color_get_color"

(* Setters *)
external set_color : t -> Color.t -> unit = "ml_pango_attr_color_set_color"
external make : Color.t -> t = "ml_pango_attr_color_make"
