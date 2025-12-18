(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ComboBox *)

type t = [`combo_box | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ComboBox *)
external new_ : unit -> t = "ml_gtk_combo_box_new"

(** Create a new ComboBox *)
external new_with_entry : unit -> t = "ml_gtk_combo_box_new_with_entry"

(** Create a new ComboBox *)
external new_with_model : Tree_model.t -> t = "ml_gtk_combo_box_new_with_model"

(** Create a new ComboBox *)
external new_with_model_and_entry : Tree_model.t -> t = "ml_gtk_combo_box_new_with_model_and_entry"

(* Properties *)

(** Get property: active *)
external get_active : t -> int = "ml_gtk_combo_box_get_active"

(** Set property: active *)
external set_active : t -> int -> unit = "ml_gtk_combo_box_set_active"

(** Get property: active-id *)
external get_active_id : t -> string = "ml_gtk_combo_box_get_active_id"

(** Set property: active-id *)
external set_active_id : t -> string -> unit = "ml_gtk_combo_box_set_active_id"

(** Get property: entry-text-column *)
external get_entry_text_column : t -> int = "ml_gtk_combo_box_get_entry_text_column"

(** Set property: entry-text-column *)
external set_entry_text_column : t -> int -> unit = "ml_gtk_combo_box_set_entry_text_column"

(** Get property: has-entry *)
external get_has_entry : t -> bool = "ml_gtk_combo_box_get_has_entry"

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_combo_box_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_combo_box_set_has_frame"

(** Get property: id-column *)
external get_id_column : t -> int = "ml_gtk_combo_box_get_id_column"

(** Set property: id-column *)
external set_id_column : t -> int -> unit = "ml_gtk_combo_box_set_id_column"

(** Get property: popup-fixed-width *)
external get_popup_fixed_width : t -> bool = "ml_gtk_combo_box_get_popup_fixed_width"

(** Set property: popup-fixed-width *)
external set_popup_fixed_width : t -> bool -> unit = "ml_gtk_combo_box_set_popup_fixed_width"

(** Get property: popup-shown *)
external get_popup_shown : t -> bool = "ml_gtk_combo_box_get_popup_shown"

(** Sets the model used by @combo_box to be @model.

Will unset a previously set model (if applicable). If model is %NULL,
then it will unset the model.

Note that this function does not clear the cell renderers, you have to
call [method@Gtk.CellLayout.clear] yourself if you need to set up different
cell renderers for the new model. *)
external set_model : t -> Tree_model.t option -> unit = "ml_gtk_combo_box_set_model"

(** Sets the child widget of @combo_box. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_combo_box_set_child"

(** Sets whether the dropdown button of the combo box should update
its sensitivity depending on the model contents. *)
external set_button_sensitivity : t -> Gtk_enums.sensitivitytype -> unit = "ml_gtk_combo_box_set_button_sensitivity"

(** Sets the current active item to be the one referenced by @iter.

If @iter is %NULL, the active item is unset. *)
external set_active_iter : t -> Tree_iter.t option -> unit = "ml_gtk_combo_box_set_active_iter"

(** Pops up the menu or dropdown list of @combo_box.

This function is mostly intended for use by accessibility technologies;
applications should have little use for it.

Before calling this, @combo_box must be mapped, or nothing will happen. *)
external popup : t -> unit = "ml_gtk_combo_box_popup"

(** Hides the menu or dropdown list of @combo_box.

This function is mostly intended for use by accessibility technologies;
applications should have little use for it. *)
external popdown : t -> unit = "ml_gtk_combo_box_popdown"

(** Returns the `GtkTreeModel` of @combo_box. *)
external get_model : t -> Tree_model.t option = "ml_gtk_combo_box_get_model"

(** Gets the child widget of @combo_box. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_combo_box_get_child"

(** Returns whether the combo box sets the dropdown button
sensitive or not when there are no items in the model. *)
external get_button_sensitivity : t -> Gtk_enums.sensitivitytype = "ml_gtk_combo_box_get_button_sensitivity"

(** Sets @iter to point to the currently active item.

If no item is active, @iter is left unchanged. *)
external get_active_iter : t -> bool * Tree_iter.t = "ml_gtk_combo_box_get_active_iter"

