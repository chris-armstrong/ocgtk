(* GENERATED CODE - DO NOT EDIT *)
(* Widget: NativeDialog *)

type t = Gtk.Widget.t

(* Properties *)

external get_modal : t -> bool = "ml_gtk_native_dialog_get_modal"

external set_modal : t -> bool -> unit = "ml_gtk_native_dialog_set_modal"

external get_title : t -> string = "ml_gtk_native_dialog_get_title"

external set_title : t -> string -> unit = "ml_gtk_native_dialog_set_title"

external get_visible : t -> bool = "ml_gtk_native_dialog_get_visible"

external set_visible : t -> bool -> unit = "ml_gtk_native_dialog_set_visible"

external show : t -> unit = "ml_gtk_native_dialog_show"

external set_transient_for : t -> Gtk.Widget.t option -> unit = "ml_gtk_native_dialog_set_transient_for"

external hide : t -> unit = "ml_gtk_native_dialog_hide"

external get_transient_for : t -> Gtk.Widget.t = "ml_gtk_native_dialog_get_transient_for"

external destroy : t -> unit = "ml_gtk_native_dialog_destroy"

