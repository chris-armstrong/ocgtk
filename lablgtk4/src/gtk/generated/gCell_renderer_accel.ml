(* Signal class defined in gcell_renderer_accel_signals.ml *)

(* High-level class for CellRendererAccel *)
class cell_renderer_accel (obj : Cell_renderer_accel.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_accel.as_cell_renderer obj)
  inherit Gcell_renderer_accel_signals.cell_renderer_accel_signals obj

  method accel_key = Cell_renderer_accel.get_accel_key obj
  method set_accel_key v = Cell_renderer_accel.set_accel_key obj v

  method keycode = Cell_renderer_accel.get_keycode obj
  method set_keycode v = Cell_renderer_accel.set_keycode obj v

  method as_cell_renderer = (Cell_renderer_accel.as_cell_renderer obj)
    method as_cell_renderer_accel = obj
end

