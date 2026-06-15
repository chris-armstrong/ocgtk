(* GENERATED CODE - DO NOT EDIT *)
(* AttrString: AttrString *)

type t = [ `attr_string ] Gobject.obj
(** The `PangoAttrString` structure is used to represent attributes with a
    string value. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_value : t -> string = "ml_pango_attr_string_get_value"

(* Setters *)
external set_value : t -> string -> unit = "ml_pango_attr_string_set_value"
external make : string -> t = "ml_pango_attr_string_make"
