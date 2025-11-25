(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserButton *)

type t = [`app_chooser_button | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new AppChooserButton *)
external new_ : string -> t = "ml_gtk_app_chooser_button_new"

(* Properties *)

(** Sets whether the dropdown menu of this button should show an
entry to trigger a `GtkAppChooserDialog`. *)
external set_show_dialog_item : t -> bool -> unit = "ml_gtk_app_chooser_button_set_show_dialog_item"

(** Sets whether the dropdown menu of this button should show the
default application for the given content type at top. *)
external set_show_default_item : t -> bool -> unit = "ml_gtk_app_chooser_button_set_show_default_item"

(** Sets whether the dialog should be modal. *)
external set_modal : t -> bool -> unit = "ml_gtk_app_chooser_button_set_modal"

(** Sets the text to display at the top of the dialog.

If the heading is not set, the dialog displays a default text. *)
external set_heading : t -> string -> unit = "ml_gtk_app_chooser_button_set_heading"

(** Selects a custom item.

See [method@Gtk.AppChooserButton.append_custom_item].

Use [method@Gtk.AppChooser.refresh] to bring the selection
to its initial state. *)
external set_active_custom_item : t -> string -> unit = "ml_gtk_app_chooser_button_set_active_custom_item"

(** Returns whether the dropdown menu shows an item
for a `GtkAppChooserDialog`. *)
external get_show_dialog_item : t -> bool = "ml_gtk_app_chooser_button_get_show_dialog_item"

(** Returns whether the dropdown menu should show the default
application at the top. *)
external get_show_default_item : t -> bool = "ml_gtk_app_chooser_button_get_show_default_item"

(** Gets whether the dialog is modal. *)
external get_modal : t -> bool = "ml_gtk_app_chooser_button_get_modal"

(** Returns the text to display at the top of the dialog. *)
external get_heading : t -> string = "ml_gtk_app_chooser_button_get_heading"

(** Appends a separator to the list of applications that is shown
in the popup. *)
external append_separator : t -> unit = "ml_gtk_app_chooser_button_append_separator"

