(* GENERATED CODE - DO NOT EDIT *)
(* PropertyAction: PropertyAction *)

type t = [`property_action | `object_] Gobject.obj

(** Create a new PropertyAction *)
external new_ : string -> [`object_] Gobject.obj -> string -> t = "ml_g_property_action_new"

(* Methods *)
(* Properties *)

(** Get property: enabled *)
external get_enabled : t -> bool = "ml_g_property_action_get_enabled"

(** Get property: invert-boolean *)
external get_invert_boolean : t -> bool = "ml_g_property_action_get_invert_boolean"

(** Get property: name *)
external get_name : t -> string = "ml_g_property_action_get_name"

(** Get property: parameter-type *)
external get_parameter_type : t -> Gvariant_type.t = "ml_g_property_action_get_parameter_type"

(** Get property: state *)
external get_state : t -> Gvariant.t = "ml_g_property_action_get_state"

(** Get property: state-type *)
external get_state_type : t -> Gvariant_type.t = "ml_g_property_action_get_state_type"

