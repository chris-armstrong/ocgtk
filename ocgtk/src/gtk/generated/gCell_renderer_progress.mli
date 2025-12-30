class cell_renderer_progress : Cell_renderer_progress.t ->
  object
    inherit GCell_renderer.cell_renderer
    method inverted : bool
    method set_inverted : bool -> unit
    method pulse : int
    method set_pulse : int -> unit
    method text : string
    method set_text : string -> unit
    method text_xalign : float
    method set_text_xalign : float -> unit
    method text_yalign : float
    method set_text_yalign : float -> unit
    method value : int
    method set_value : int -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_progress : Cell_renderer_progress.t
  end

