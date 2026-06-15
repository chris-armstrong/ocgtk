(* GENERATED CODE - DO NOT EDIT *)
(* AttrShape: AttrShape *)

type t = [ `attr_shape ] Gobject.obj
(** The `PangoAttrShape` structure is used to represent attributes which impose
    shape restrictions. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_ink_rect : t -> Rectangle.t = "ml_pango_attr_shape_get_ink_rect"

external get_logical_rect : t -> Rectangle.t
  = "ml_pango_attr_shape_get_logical_rect"

external get_destroy_func : t -> unit = "ml_pango_attr_shape_get_destroy_func"

(* Setters *)
external set_ink_rect : t -> Rectangle.t -> unit
  = "ml_pango_attr_shape_set_ink_rect"

external set_logical_rect : t -> Rectangle.t -> unit
  = "ml_pango_attr_shape_set_logical_rect"

external set_destroy_func : t -> unit -> unit
  = "ml_pango_attr_shape_set_destroy_func"

external make : Rectangle.t -> Rectangle.t -> unit -> t
  = "ml_pango_attr_shape_make"
