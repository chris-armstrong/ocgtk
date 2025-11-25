(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorDialogButton *)

type t = [`color_dialog_button | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new ColorDialogButton *)
external new_ : Gtk.widget option -> t = "ml_gtk_color_dialog_button_new"

(* Properties *)

(** Sets a `GtkColorDialog` object to use for
creating the color chooser dialog that is
presented when the user clicks the button. *)
external set_dialog : t -> Gtk.widget -> unit = "ml_gtk_color_dialog_button_set_dialog"

(** Returns the `GtkColorDialog` of @self. *)
external get_dialog : t -> Gtk.widget option = "ml_gtk_color_dialog_button_get_dialog"

