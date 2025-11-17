(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from link_button.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_link_button_new"
external new_ : unit -> t = "ml_gtk_link_button_new_with_label"
external get_visited : t -> bool = "ml_gtk_link_button_get_visited"
external set_visited : t -> bool -> unit = "ml_gtk_link_button_set_visited"
external set_uri : t -> string -> unit = "ml_gtk_link_button_set_uri"
external get_uri : t -> string = "ml_gtk_link_button_get_uri"

(* Summary:
 * - 1 type declarations
 * - 6 external bindings
 *)
