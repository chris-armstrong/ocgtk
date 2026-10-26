class type cell_renderer_combo_t = object
  inherit Cell_renderer_text.cell_renderer_text_t
  method has_entry : bool
  method set_has_entry : bool -> unit
  method model : Tree_model.tree_model_t
  method set_model : Tree_model.tree_model_t -> unit
  method text_column : int
  method set_text_column : int -> unit
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
