(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from text_tag_table.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_text_tag_table_new"
external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_text_tag_table_remove"
external lookup : t -> string -> Gtk.Widget.t = "ml_gtk_text_tag_table_lookup"
external get_size : t -> unit = "ml_gtk_text_tag_table_get_size"
external foreach : t -> unit -> unit -> unit = "ml_gtk_text_tag_table_foreach"
external add : t -> Gtk.Widget.t -> bool = "ml_gtk_text_tag_table_add"

(* Summary:
 * - 1 type declarations
 * - 6 external bindings
 *)
