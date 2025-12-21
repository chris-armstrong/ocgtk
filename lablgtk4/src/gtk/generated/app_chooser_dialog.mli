(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserDialog *)

type t = [`app_chooser_dialog | `dialog | `window | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new AppChooserDialog *)
external new_ : Application_and__window_and__window_group.Window.t option -> unit -> unit -> t = "ml_gtk_app_chooser_dialog_new"

(** Create a new AppChooserDialog *)
external new_for_content_type : Application_and__window_and__window_group.Window.t option -> unit -> string -> t = "ml_gtk_app_chooser_dialog_new_for_content_type"

(* Methods *)
(** Sets the text to display at the top of the dialog.

If the heading is not set, the dialog displays a default text. *)
external set_heading : t -> string -> unit = "ml_gtk_app_chooser_dialog_set_heading"

(** Returns the `GtkAppChooserWidget` of this dialog. *)
external get_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_app_chooser_dialog_get_widget"

(** Returns the text to display at the top of the dialog. *)
external get_heading : t -> string option = "ml_gtk_app_chooser_dialog_get_heading"

(* Properties *)

