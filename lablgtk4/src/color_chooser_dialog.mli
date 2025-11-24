(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorChooserDialog *)

type t = Gtk.widget

(** Create a new ColorChooserDialog *)
external new_ : string option -> Gtk.widget option -> t = "ml_gtk_color_chooser_dialog_new"

(* Properties *)

(** Get property: show-editor *)
external get_show_editor : t -> bool = "ml_gtk_color_chooser_dialog_get_show_editor"

(** Set property: show-editor *)
external set_show_editor : t -> bool -> unit = "ml_gtk_color_chooser_dialog_set_show_editor"

