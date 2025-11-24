(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserDialog *)

type t = Gtk.widget

external new_ : Gtk.widget option -> Gtk_enums.dialogflags -> unit -> t = "ml_gtk_app_chooser_dialog_new"

external new_for_content_type : Gtk.widget option -> Gtk_enums.dialogflags -> string -> t = "ml_gtk_app_chooser_dialog_new_for_content_type"

(* Properties *)

external get_heading : t -> string = "ml_gtk_app_chooser_dialog_get_heading"

external set_heading : t -> string -> unit = "ml_gtk_app_chooser_dialog_set_heading"

external get_widget : t -> Gtk.widget = "ml_gtk_app_chooser_dialog_get_widget"

