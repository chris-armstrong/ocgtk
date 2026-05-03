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

class cell_renderer_accel : Cell_renderer_accel.t -> cell_renderer_accel_t

val new_ : unit -> cell_renderer_accel_t
