class type cell_renderer_accel_t = object
  inherit GCell_renderer_text.cell_renderer_text_t

  method on_accel_cleared :
    callback:(path_string:string -> unit) -> Gobject.Signal.handler_id

  method on_accel_edited :
    callback:
      (path_string:string ->
      accel_key:int ->
      accel_mods:Ocgtk_gdk.Gdk_enums.modifiertype ->
      hardware_keycode:int ->
      unit) ->
    Gobject.Signal.handler_id

  method accel_key : int
  method set_accel_key : int -> unit
  method accel_mode : Gtk_enums.cellrendereraccelmode
  method set_accel_mode : Gtk_enums.cellrendereraccelmode -> unit
  method accel_mods : Ocgtk_gdk.Gdk.modifiertype
  method set_accel_mods : Ocgtk_gdk.Gdk.modifiertype -> unit
  method keycode : int
  method set_keycode : int -> unit
  method as_cell_renderer_accel : Cell_renderer_accel.t
end

(* High-level class for CellRendererAccel *)
class cell_renderer_accel (obj : Cell_renderer_accel.t) : cell_renderer_accel_t
  =
  object (self)
    inherit GCell_renderer_text.cell_renderer_text (obj :> Cell_renderer_text.t)

    method on_accel_cleared ~callback =
      Cell_renderer_accel.on_accel_cleared self#as_cell_renderer_accel ~callback

    method on_accel_edited ~callback =
      Cell_renderer_accel.on_accel_edited self#as_cell_renderer_accel ~callback

    method accel_key = Cell_renderer_accel.get_accel_key obj
    method set_accel_key v = Cell_renderer_accel.set_accel_key obj v
    method accel_mode = Cell_renderer_accel.get_accel_mode obj
    method set_accel_mode v = Cell_renderer_accel.set_accel_mode obj v
    method accel_mods = Cell_renderer_accel.get_accel_mods obj
    method set_accel_mods v = Cell_renderer_accel.set_accel_mods obj v
    method keycode = Cell_renderer_accel.get_keycode obj
    method set_keycode v = Cell_renderer_accel.set_keycode obj v
    method as_cell_renderer_accel = obj
  end

let new_ () : cell_renderer_accel_t =
  new cell_renderer_accel (Cell_renderer_accel.new_ ())
