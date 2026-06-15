(* GENERATED CODE - DO NOT EDIT *)
(* AttrSize: AttrSize *)

type t = [ `attr_size ] Gobject.obj
(** The `PangoAttrSize` structure is used to represent attributes which set font
    size. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_size : t -> int = "ml_pango_attr_size_get_size"
external get_absolute : t -> int = "ml_pango_attr_size_get_absolute"

(* Setters *)
external set_size : t -> int -> unit = "ml_pango_attr_size_set_size"
external set_absolute : t -> int -> unit = "ml_pango_attr_size_set_absolute"
external make : int -> int -> t = "ml_pango_attr_size_make"
