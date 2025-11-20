(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserDialog *)

type t = Gtk.Widget.t

(** Create a new AppChooserDialog *)
external new_ : Gtk.Widget.t option -> Gtk_enums.dialogflags -> unit -> t = "ml_gtk_app_chooser_dialog_new"

(** Create a new AppChooserDialog *)
external new_for_content_type : Gtk.Widget.t option -> Gtk_enums.dialogflags -> string -> t = "ml_gtk_app_chooser_dialog_new_for_content_type"

(* Properties *)

(** Get property: heading *)
external get_heading : t -> string = "ml_gtk_app_chooser_dialog_get_heading"

(** Set property: heading *)
external set_heading : t -> string -> unit = "ml_gtk_app_chooser_dialog_set_heading"

external get_widget : t -> Gtk.Widget.t = "ml_gtk_app_chooser_dialog_get_widget"

