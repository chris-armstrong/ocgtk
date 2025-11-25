(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserDialog *)

type t = [`app_chooser_dialog | `dialog | `window | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new AppChooserDialog *)
external new_ : Gtk.widget option -> Gtk_enums.dialogflags -> unit -> t = "ml_gtk_app_chooser_dialog_new"

(** Create a new AppChooserDialog *)
external new_for_content_type : Gtk.widget option -> Gtk_enums.dialogflags -> string -> t = "ml_gtk_app_chooser_dialog_new_for_content_type"

(* Properties *)

(** Sets the text to display at the top of the dialog.

If the heading is not set, the dialog displays a default text. *)
external set_heading : t -> string -> unit = "ml_gtk_app_chooser_dialog_set_heading"

(** Returns the `GtkAppChooserWidget` of this dialog. *)
external get_widget : t -> Gtk.widget = "ml_gtk_app_chooser_dialog_get_widget"

(** Returns the text to display at the top of the dialog. *)
external get_heading : t -> string option = "ml_gtk_app_chooser_dialog_get_heading"

