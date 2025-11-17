(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from check_button.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_check_button_new"
external new_ : unit -> t = "ml_gtk_check_button_new_with_label"
external new_ : unit -> t = "ml_gtk_check_button_new_with_mnemonic"
external get_active : t -> bool = "ml_gtk_check_button_get_active"
external set_active : t -> bool -> unit = "ml_gtk_check_button_set_active"
external get_inconsistent : t -> bool = "ml_gtk_check_button_get_inconsistent"
external set_inconsistent : t -> bool -> unit = "ml_gtk_check_button_set_inconsistent"
external get_use_underline : t -> bool = "ml_gtk_check_button_get_use_underline"
external set_use_underline : t -> bool -> unit = "ml_gtk_check_button_set_use_underline"
external set_label : t -> string -> unit = "ml_gtk_check_button_set_label"
external set_group : t -> unit -> unit = "ml_gtk_check_button_set_group"
external set_child : t -> Gtk.Widget.t -> unit = "ml_gtk_check_button_set_child"
external get_label : t -> string = "ml_gtk_check_button_get_label"
external get_child : t -> Gtk.Widget.t = "ml_gtk_check_button_get_child"

(* Summary:
 * - 1 type declarations
 * - 14 external bindings
 *)
