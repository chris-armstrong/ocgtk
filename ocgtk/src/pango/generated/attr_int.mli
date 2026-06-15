(* GENERATED CODE - DO NOT EDIT *)
(* AttrInt: AttrInt *)

type t = [ `attr_int ] Gobject.obj
(** The `PangoAttrInt` structure is used to represent attributes with an integer
    or enumeration value. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_value : t -> int = "ml_pango_attr_int_get_value"

(* Setters *)
external set_value : t -> int -> unit = "ml_pango_attr_int_set_value"
external make : int -> t = "ml_pango_attr_int_make"
