(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileChooserNative *)

type t = Gtk.Widget.t

(** Create a new FileChooserNative *)
external new_ : string option -> Gtk.Widget.t option -> Gtk_enums.filechooseraction -> string option -> string option -> t = "ml_gtk_file_chooser_native_new"

(* Properties *)

(** Get property: accept-label *)
external get_accept_label : t -> string = "ml_gtk_file_chooser_native_get_accept_label"

(** Set property: accept-label *)
external set_accept_label : t -> string -> unit = "ml_gtk_file_chooser_native_set_accept_label"

(** Get property: cancel-label *)
external get_cancel_label : t -> string = "ml_gtk_file_chooser_native_get_cancel_label"

(** Set property: cancel-label *)
external set_cancel_label : t -> string -> unit = "ml_gtk_file_chooser_native_set_cancel_label"

