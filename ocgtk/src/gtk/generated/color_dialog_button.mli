(* GENERATED CODE - DO NOT EDIT *)
(* ColorDialogButton: ColorDialogButton *)

type t = [`color_dialog_button | `widget | `initially_unowned | `object_] Gobject.obj

(** Create a new ColorDialogButton *)
external new_ : Color_dialog.t option -> t = "ml_gtk_color_dialog_button_new"

(* Methods *)
(** Sets the color of the button. *)
external set_rgba : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> unit = "ml_gtk_color_dialog_button_set_rgba"

(** Sets a `GtkColorDialog` object to use for
creating the color chooser dialog that is
presented when the user clicks the button. *)
external set_dialog : t -> Color_dialog.t -> unit = "ml_gtk_color_dialog_button_set_dialog"

(** Returns the color of the button.

This function is what should be used to obtain
the color that was chosen by the user. To get
informed about changes, listen to "notify::rgba". *)
external get_rgba : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t = "ml_gtk_color_dialog_button_get_rgba"

(** Returns the `GtkColorDialog` of @self. *)
external get_dialog : t -> Color_dialog.t option = "ml_gtk_color_dialog_button_get_dialog"

(* Properties *)

