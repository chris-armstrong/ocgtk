(* GENERATED CODE - DO NOT EDIT *)
(* AttrFloat: AttrFloat *)

type t = [ `attr_float ] Gobject.obj
(** The `PangoAttrFloat` structure is used to represent attributes with a float
    or double value. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_value : t -> float = "ml_pango_attr_float_get_value"

(* Setters *)
external set_value : t -> float -> unit = "ml_pango_attr_float_set_value"
external make : float -> t = "ml_pango_attr_float_make"
