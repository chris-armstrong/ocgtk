(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserButton *)

type t = Gtk.Widget.t

(** Create a new AppChooserButton *)
external new_ : string -> t = "ml_gtk_app_chooser_button_new"

(* Properties *)

(** Get property: heading *)
external get_heading : t -> string = "ml_gtk_app_chooser_button_get_heading"

(** Set property: heading *)
external set_heading : t -> string -> unit = "ml_gtk_app_chooser_button_set_heading"

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_app_chooser_button_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_app_chooser_button_set_modal"

(** Get property: show-default-item *)
external get_show_default_item : t -> bool = "ml_gtk_app_chooser_button_get_show_default_item"

(** Set property: show-default-item *)
external set_show_default_item : t -> bool -> unit = "ml_gtk_app_chooser_button_set_show_default_item"

(** Get property: show-dialog-item *)
external get_show_dialog_item : t -> bool = "ml_gtk_app_chooser_button_get_show_dialog_item"

(** Set property: show-dialog-item *)
external set_show_dialog_item : t -> bool -> unit = "ml_gtk_app_chooser_button_set_show_dialog_item"

external set_active_custom_item : t -> string -> unit = "ml_gtk_app_chooser_button_set_active_custom_item"

external append_separator : t -> unit = "ml_gtk_app_chooser_button_append_separator"

external append_custom_item : t -> string -> string -> unit -> unit = "ml_gtk_app_chooser_button_append_custom_item"

