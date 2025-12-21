(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorDialogButton *)

type t = [`color_dialog_button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new ColorDialogButton *)
external new_ : Color_dialog.t option -> t = "ml_gtk_color_dialog_button_new"

(* Methods *)
(** Sets a `GtkColorDialog` object to use for
creating the color chooser dialog that is
presented when the user clicks the button. *)
external set_dialog : t -> Color_dialog.t -> unit = "ml_gtk_color_dialog_button_set_dialog"

(** Returns the `GtkColorDialog` of @self. *)
external get_dialog : t -> Color_dialog.t option = "ml_gtk_color_dialog_button_get_dialog"

(* Properties *)

