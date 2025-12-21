(* GENERATED CODE - DO NOT EDIT *)
(* PropertyAction: PropertyAction *)

type t = [`property_action | `object_] Gobject.obj

(** Create a new PropertyAction *)
external new_ : string -> unit -> string -> t = "ml_g_property_action_new"

(* Methods *)
(* Properties *)

(** Get property: enabled *)
external get_enabled : t -> bool = "ml_gtk_property_action_get_enabled"

(** Get property: invert-boolean *)
external get_invert_boolean : t -> bool = "ml_gtk_property_action_get_invert_boolean"

(** Get property: name *)
external get_name : t -> string = "ml_gtk_property_action_get_name"

(** Get property: property-name *)
external get_property_name : t -> string = "ml_gtk_property_action_get_property_name"

