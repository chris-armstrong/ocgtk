(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellView *)

type t = [`cell_view | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new CellView *)
external new_ : unit -> t = "ml_gtk_cell_view_new"

(** Create a new CellView *)
external new_with_context : Cell_area_and__cell_area_context.Cell_area.t -> Cell_area_and__cell_area_context.Cell_area_context.t -> t = "ml_gtk_cell_view_new_with_context"

(** Create a new CellView *)
external new_with_markup : string -> t = "ml_gtk_cell_view_new_with_markup"

(** Create a new CellView *)
external new_with_text : string -> t = "ml_gtk_cell_view_new_with_text"

(** Create a new CellView *)
external new_with_texture : unit -> t = "ml_gtk_cell_view_new_with_texture"

(* Methods *)
(** Sets the model for @cell_view.  If @cell_view already has a model
set, it will remove it before setting the new model.  If @model is
%NULL, then it will unset the old model. *)
external set_model : t -> Tree_model.t option -> unit = "ml_gtk_cell_view_set_model"

(** Sets whether @cell_view should request space to fit the entire `GtkTreeModel`.

This is used by `GtkComboBox` to ensure that the cell view displayed on
the combo box’s button always gets enough space and does not resize
when selection changes. *)
external set_fit_model : t -> bool -> unit = "ml_gtk_cell_view_set_fit_model"

(** Sets whether @cell_view should draw all of its
cells in a sensitive state, this is used by `GtkComboBox` menus
to ensure that rows with insensitive cells that contain
children appear sensitive in the parent menu item. *)
external set_draw_sensitive : t -> bool -> unit = "ml_gtk_cell_view_set_draw_sensitive"

(** Sets the row of the model that is currently displayed
by the `GtkCellView`. If the path is unset, then the
contents of the cellview “stick” at their last value;
this is not normally a desired result, but may be
a needed intermediate state if say, the model for
the `GtkCellView` becomes temporarily empty. *)
external set_displayed_row : t -> Tree_path.t option -> unit = "ml_gtk_cell_view_set_displayed_row"

(** Returns the model for @cell_view. If no model is used %NULL is
returned. *)
external get_model : t -> Tree_model.t option = "ml_gtk_cell_view_get_model"

(** Gets whether @cell_view is configured to request space
to fit the entire `GtkTreeModel`. *)
external get_fit_model : t -> bool = "ml_gtk_cell_view_get_fit_model"

(** Gets whether @cell_view is configured to draw all of its
cells in a sensitive state. *)
external get_draw_sensitive : t -> bool = "ml_gtk_cell_view_get_draw_sensitive"

(** Returns a `GtkTreePath` referring to the currently
displayed row. If no row is currently displayed,
%NULL is returned. *)
external get_displayed_row : t -> Tree_path.t option = "ml_gtk_cell_view_get_displayed_row"

(* Properties *)

(** Get property: cell-area *)
external get_cell_area : t -> Cell_area_and__cell_area_context.Cell_area.t = "ml_gtk_cell_view_get_cell_area"

(** Get property: cell-area-context *)
external get_cell_area_context : t -> Cell_area_and__cell_area_context.Cell_area_context.t = "ml_gtk_cell_view_get_cell_area_context"

