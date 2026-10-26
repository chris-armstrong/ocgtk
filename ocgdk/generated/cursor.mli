class type cursor_t = object
  method get_fallback : unit -> cursor_t option
  method get_hotspot_x : unit -> int
  method get_hotspot_y : unit -> int
  method get_name : unit -> string option
  method get_texture : unit -> GTexture.texture_t option
  method as_cursor : Cursor.t
end

class cursor : Cursor.t -> cursor_t

val new_from_name : string -> cursor_t option -> cursor_t

val new_from_texture :
  GTexture.texture_t -> int -> int -> cursor_t option -> cursor_t
