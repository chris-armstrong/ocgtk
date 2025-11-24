(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CenterBox *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_center_box_new"

(* Properties *)

external get_shrink_center_last : t -> bool = "ml_gtk_center_box_get_shrink_center_last"

external set_shrink_center_last : t -> bool -> unit = "ml_gtk_center_box_set_shrink_center_last"

external set_start_widget : t -> Gtk.widget option -> unit = "ml_gtk_center_box_set_start_widget"

external set_end_widget : t -> Gtk.widget option -> unit = "ml_gtk_center_box_set_end_widget"

external set_center_widget : t -> Gtk.widget option -> unit = "ml_gtk_center_box_set_center_widget"

external set_baseline_position : t -> Gtk_enums.baselineposition -> unit = "ml_gtk_center_box_set_baseline_position"

external get_start_widget : t -> Gtk.widget = "ml_gtk_center_box_get_start_widget"

external get_end_widget : t -> Gtk.widget = "ml_gtk_center_box_get_end_widget"

external get_center_widget : t -> Gtk.widget = "ml_gtk_center_box_get_center_widget"

external get_baseline_position : t -> Gtk_enums.baselineposition = "ml_gtk_center_box_get_baseline_position"

