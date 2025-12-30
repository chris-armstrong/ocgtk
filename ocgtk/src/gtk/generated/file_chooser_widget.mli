(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileChooserWidget *)

type t = [`file_chooser_widget | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new FileChooserWidget *)
external new_ : Gtk_enums.filechooseraction -> t = "ml_gtk_file_chooser_widget_new"

(* Methods *)
(* Properties *)

(** Get property: search-mode *)
external get_search_mode : t -> bool = "ml_gtk_file_chooser_widget_get_search_mode"

(** Set property: search-mode *)
external set_search_mode : t -> bool -> unit = "ml_gtk_file_chooser_widget_set_search_mode"

(** Get property: show-time *)
external get_show_time : t -> bool = "ml_gtk_file_chooser_widget_get_show_time"

(** Get property: subtitle *)
external get_subtitle : t -> string = "ml_gtk_file_chooser_widget_get_subtitle"

