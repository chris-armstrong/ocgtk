(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorDialogButton *)

type t = Gtk.Widget.t

(** Create a new ColorDialogButton *)
external new_ : Gtk.Widget.t option -> t = "ml_gtk_color_dialog_button_new"

(* Properties *)

external set_rgba : t -> unit -> unit = "ml_gtk_color_dialog_button_set_rgba"

external set_dialog : t -> Gtk.Widget.t -> unit = "ml_gtk_color_dialog_button_set_dialog"

external get_dialog : t -> Gtk.Widget.t = "ml_gtk_color_dialog_button_get_dialog"

