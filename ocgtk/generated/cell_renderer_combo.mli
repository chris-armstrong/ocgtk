class type cell_renderer_combo_t = object
  inherit GCell_renderer_text.cell_renderer_text_t
  method has_entry : bool
  method set_has_entry : bool -> unit
  method model : GTree_model.tree_model_t
  method set_model : GTree_model.tree_model_t -> unit
  method text_column : int
  method set_text_column : int -> unit
  method as_cell_renderer_combo : Cell_renderer_combo.t
end

class cell_renderer_combo : Cell_renderer_combo.t -> cell_renderer_combo_t

val new_ : unit -> cell_renderer_combo_t
