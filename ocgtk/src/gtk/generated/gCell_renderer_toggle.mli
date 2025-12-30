class cell_renderer_toggle : Cell_renderer_toggle.t ->
  object
    inherit GCell_renderer.cell_renderer
    inherit Gcell_renderer_toggle_signals.cell_renderer_toggle_signals
    method get_activatable : unit -> bool
    method get_active : unit -> bool
    method get_radio : unit -> bool
    method set_activatable : bool -> unit
    method set_active : bool -> unit
    method set_radio : bool -> unit
    method inconsistent : bool
    method set_inconsistent : bool -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_toggle : Cell_renderer_toggle.t
  end

