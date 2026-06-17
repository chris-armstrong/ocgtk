(* GENERATED CODE - DO NOT EDIT *)
(* ColorChooserWidget: ColorChooserWidget *)

type t = [`color_chooser_widget | `widget | `initially_unowned | `object_] Gobject.obj

(** Create a new ColorChooserWidget *)
external new_ : unit -> t = "ml_gtk_color_chooser_widget_new"

(* Methods *)
(* Properties *)

(** Get property: show-editor *)
external get_show_editor : t -> bool = "ml_gtk_color_chooser_widget_get_show_editor"

(** Set property: show-editor *)
external set_show_editor : t -> bool -> unit = "ml_gtk_color_chooser_widget_set_show_editor"

