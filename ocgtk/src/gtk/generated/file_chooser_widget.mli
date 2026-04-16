(* GENERATED CODE - DO NOT EDIT *)
(* FileChooserWidget: FileChooserWidget *)

type t =
  [ `file_chooser_widget | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : Gtk_enums.filechooseraction -> t
  = "ml_gtk_file_chooser_widget_new"
(** Create a new FileChooserWidget *)

(* Methods *)
(* Properties *)

external get_search_mode : t -> bool
  = "ml_gtk_file_chooser_widget_get_search_mode"
(** Get property: search-mode *)

external set_search_mode : t -> bool -> unit
  = "ml_gtk_file_chooser_widget_set_search_mode"
(** Set property: search-mode *)

external get_show_time : t -> bool = "ml_gtk_file_chooser_widget_get_show_time"
(** Get property: show-time *)

external get_subtitle : t -> string = "ml_gtk_file_chooser_widget_get_subtitle"
(** Get property: subtitle *)
