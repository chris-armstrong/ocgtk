class cursor : Cursor.t ->
  object
    method get_fallback : unit -> cursor option
    method get_hotspot_x : unit -> int
    method get_hotspot_y : unit -> int
    method get_name : unit -> string option
    method get_texture : unit -> GTexture.texture option
    method as_cursor : Cursor.t
  end

