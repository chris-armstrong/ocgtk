(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from switch.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_switch_new"
external get_active : t -> bool = "ml_gtk_switch_get_active"
external set_active : t -> bool -> unit = "ml_gtk_switch_set_active"
external get_state : t -> bool = "ml_gtk_switch_get_state"
external set_state : t -> bool -> unit = "ml_gtk_switch_set_state"

(* Summary:
 * - 1 type declarations
 * - 5 external bindings
 *)
