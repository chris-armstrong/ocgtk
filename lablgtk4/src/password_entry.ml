(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from password_entry.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_password_entry_new"
external get_activates_default : t -> bool = "ml_gtk_password_entry_get_activates_default"
external set_activates_default : t -> bool -> unit = "ml_gtk_password_entry_set_activates_default"
external get_extra_menu : t -> unit = "ml_gtk_password_entry_get_extra_menu"
external set_extra_menu : t -> unit -> unit = "ml_gtk_password_entry_set_extra_menu"
external get_placeholder_text : t -> unit = "ml_gtk_password_entry_get_placeholder_text"
external set_placeholder_text : t -> unit -> unit = "ml_gtk_password_entry_set_placeholder_text"
external get_show_peek_icon : t -> bool = "ml_gtk_password_entry_get_show_peek_icon"
external set_show_peek_icon : t -> bool -> unit = "ml_gtk_password_entry_set_show_peek_icon"

(* Summary:
 * - 1 type declarations
 * - 9 external bindings
 *)
