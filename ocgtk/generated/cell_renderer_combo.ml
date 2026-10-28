class type cell_renderer_combo_t = object
  inherit Cell_renderer_text.cell_renderer_text_t

  (** {2:properties Properties} *)

  method has_entry : bool
  (** If [true], the cell renderer will include an entry and allow to enter
      values other than the ones in the popup list. *)

  method set_has_entry : bool -> unit
  (** If [true], the cell renderer will include an entry and allow to enter
      values other than the ones in the popup list. *)

  method model : Tree_model.tree_model_t
  (** Holds a tree model containing the possible values for the combo box. Use
      the text_column property to specify the column holding the values. *)

  method set_model : Tree_model.tree_model_t -> unit
  (** Holds a tree model containing the possible values for the combo box. Use
      the text_column property to specify the column holding the values. *)

  method text_column : int
  (** Specifies the model column which holds the possible values for the combo
      box.

      Note that this refers to the model specified in the model property, not
      the model backing the tree view to which this cell renderer is attached.

      [GtkCellRendererCombo] automatically adds a text cell renderer for this
      column to its combo box. *)

  method set_text_column : int -> unit
  (** Specifies the model column which holds the possible values for the combo
      box.

      Note that this refers to the model specified in the model property, not
      the model backing the tree view to which this cell renderer is attached.

      [GtkCellRendererCombo] automatically adds a text cell renderer for this
      column to its combo box. *)

  (** {2:conversions Conversions} *)

  method as_cell_renderer_combo : Raw.Cell_renderer_combo.t
end

(* High-level class for CellRendererCombo *)
class cell_renderer_combo (obj : Raw.Cell_renderer_combo.t) :
  cell_renderer_combo_t =
  object (self)
    inherit
      Cell_renderer_text.cell_renderer_text (obj :> Raw.Cell_renderer_text.t)

    method has_entry = Raw.Cell_renderer_combo.get_has_entry obj
    method set_has_entry v = Raw.Cell_renderer_combo.set_has_entry obj v

    method model =
      new Tree_model.tree_model (Raw.Cell_renderer_combo.get_model obj)

    method set_model : Tree_model.tree_model_t -> unit =
      fun v -> Raw.Cell_renderer_combo.set_model obj v#as_tree_model

    method text_column = Raw.Cell_renderer_combo.get_text_column obj
    method set_text_column v = Raw.Cell_renderer_combo.set_text_column obj v
    method as_cell_renderer_combo = obj
  end

let new_ () : cell_renderer_combo_t =
  new cell_renderer_combo (Raw.Cell_renderer_combo.new_ ())
