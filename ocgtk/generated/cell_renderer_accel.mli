class type cell_renderer_accel_t = object
  inherit Cell_renderer_text.cell_renderer_text_t

  method on_accel_cleared :
    ?after:bool ->
    callback:(path_string:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_accel_edited :
    ?after:bool ->
    callback:
      (path_string:string ->
      accel_key:int ->
      accel_mods:Ocgdk.Enums.modifiertype ->
      hardware_keycode:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method accel_key : int
  method set_accel_key : int -> unit
  method accel_mode : Enums.cellrendereraccelmode
  method set_accel_mode : Enums.cellrendereraccelmode -> unit
  method accel_mods : Ocgdk.Enums.modifiertype
  method set_accel_mods : Ocgdk.Enums.modifiertype -> unit
  method keycode : int
  method set_keycode : int -> unit
  method as_cell_renderer_accel : Raw.Cell_renderer_accel.t
end

class cell_renderer_accel : Raw.Cell_renderer_accel.t -> cell_renderer_accel_t

val new_ : unit -> cell_renderer_accel_t
