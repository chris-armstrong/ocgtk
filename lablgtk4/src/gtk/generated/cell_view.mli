(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellView *)

type t = [`cell_view | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

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

(* Properties *)

(** Get property: draw-sensitive *)
external get_draw_sensitive : t -> bool = "ml_gtk_cell_view_get_draw_sensitive"

(** Set property: draw-sensitive *)
external set_draw_sensitive : t -> bool -> unit = "ml_gtk_cell_view_set_draw_sensitive"

(** Get property: fit-model *)
external get_fit_model : t -> bool = "ml_gtk_cell_view_get_fit_model"

(** Set property: fit-model *)
external set_fit_model : t -> bool -> unit = "ml_gtk_cell_view_set_fit_model"

(** Sets the model for @cell_view.  If @cell_view already has a model
set, it will remove it before setting the new model.  If @model is
%NULL, then it will unset the old model. *)
external set_model : t -> Tree_model.t option -> unit = "ml_gtk_cell_view_set_model"

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

(** Returns a `GtkTreePath` referring to the currently
displayed row. If no row is currently displayed,
%NULL is returned. *)
external get_displayed_row : t -> Tree_path.t option = "ml_gtk_cell_view_get_displayed_row"

