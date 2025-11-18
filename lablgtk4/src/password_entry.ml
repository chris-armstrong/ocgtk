(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from password_entry.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_password_entry_new"
external get_activates_default : t -> bool = "ml_gtk_password_entry_get_activates_default"
external set_activates_default : t -> bool -> unit = "ml_gtk_password_entry_set_activates_default"
external get_show_peek_icon : t -> bool = "ml_gtk_password_entry_get_show_peek_icon"
external set_show_peek_icon : t -> bool -> unit = "ml_gtk_password_entry_set_show_peek_icon"
external set_extra_menu : t -> unit -> unit = "ml_gtk_password_entry_set_extra_menu"
external get_extra_menu : t -> unit = "ml_gtk_password_entry_get_extra_menu"

external get_placeholder_text : t -> string = "ml_gtk_password_entry_get_placeholder_text"
external set_placeholder_text : t -> string option -> unit = "ml_gtk_password_entry_set_placeholder_text"

(* GtkEditable interface methods *)
external get_text : t -> string = "ml_gtk_editable_get_text"
external set_text : t -> string -> unit = "ml_gtk_editable_set_text"

(* Summary:
 * - 1 type declarations
 * - 7 external bindings
 *)
