(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ComboBox *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_combo_box_new"

external new_with_entry : unit -> t = "ml_gtk_combo_box_new_with_entry"

external new_with_model : Gtk.Widget.t -> t = "ml_gtk_combo_box_new_with_model"

external new_with_model_and_entry : Gtk.Widget.t -> t = "ml_gtk_combo_box_new_with_model_and_entry"

(* Properties *)

external get_active : t -> int = "ml_gtk_combo_box_get_active"

external set_active : t -> int -> unit = "ml_gtk_combo_box_set_active"

external get_active_id : t -> string = "ml_gtk_combo_box_get_active_id"

external set_active_id : t -> string -> unit = "ml_gtk_combo_box_set_active_id"

external get_entry_text_column : t -> int = "ml_gtk_combo_box_get_entry_text_column"

external set_entry_text_column : t -> int -> unit = "ml_gtk_combo_box_set_entry_text_column"

external get_has_entry : t -> bool = "ml_gtk_combo_box_get_has_entry"

external get_has_frame : t -> bool = "ml_gtk_combo_box_get_has_frame"

external set_has_frame : t -> bool -> unit = "ml_gtk_combo_box_set_has_frame"

external get_id_column : t -> int = "ml_gtk_combo_box_get_id_column"

external set_id_column : t -> int -> unit = "ml_gtk_combo_box_set_id_column"

external get_popup_fixed_width : t -> bool = "ml_gtk_combo_box_get_popup_fixed_width"

external set_popup_fixed_width : t -> bool -> unit = "ml_gtk_combo_box_set_popup_fixed_width"

external get_popup_shown : t -> bool = "ml_gtk_combo_box_get_popup_shown"

external set_model : t -> Gtk.Widget.t option -> unit = "ml_gtk_combo_box_set_model"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_combo_box_set_child"

external set_button_sensitivity : t -> Gtk_enums.sensitivitytype -> unit = "ml_gtk_combo_box_set_button_sensitivity"

external set_active_iter : t -> Gtk.Widget.t option -> unit = "ml_gtk_combo_box_set_active_iter"

external popup : t -> unit = "ml_gtk_combo_box_popup"

external popdown : t -> unit = "ml_gtk_combo_box_popdown"

external get_model : t -> Gtk.Widget.t = "ml_gtk_combo_box_get_model"

external get_child : t -> Gtk.Widget.t = "ml_gtk_combo_box_get_child"

external get_button_sensitivity : t -> Gtk_enums.sensitivitytype = "ml_gtk_combo_box_get_button_sensitivity"

external get_active_iter : t -> Gtk.Widget.t -> bool = "ml_gtk_combo_box_get_active_iter"

