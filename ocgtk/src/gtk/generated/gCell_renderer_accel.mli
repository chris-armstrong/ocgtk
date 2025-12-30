class cell_renderer_accel : Cell_renderer_accel.t ->
  object
    inherit GCell_renderer.cell_renderer
    inherit Gcell_renderer_accel_signals.cell_renderer_accel_signals
    method accel_key : int
    method set_accel_key : int -> unit
    method accel_mode : Gtk_enums.cellrendereraccelmode
    method set_accel_mode : Gtk_enums.cellrendereraccelmode -> unit
    method keycode : int
    method set_keycode : int -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_accel : Cell_renderer_accel.t
  end

