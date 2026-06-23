(* GENERATED CODE - DO NOT EDIT *)
(* AttrClass: AttrClass *)

type t = [ `attr_class ] Gobject.obj
(** The `PangoAttrClass` structure stores the type and operations for a
    particular type of attribute.

    The functions in this structure should not be called directly. Instead, one
    should use the wrapper functions provided for `PangoAttribute`. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_type : t -> Pango_enums.attrtype = "ml_pango_attr_class_get_type"

(* Setters *)
external set_type : t -> Pango_enums.attrtype -> unit
  = "ml_pango_attr_class_set_type"

external make : Pango_enums.attrtype -> t = "ml_pango_attr_class_make"
