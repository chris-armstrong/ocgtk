(* High-level class for Cursor *)
class cursor (obj : Cursor.t) = object (self)

  method get_fallback : unit -> cursor option =
    fun () ->
      Option.map (fun ret -> new cursor ret) (Cursor.get_fallback obj)

  method get_hotspot_x : unit -> int =
    fun () ->
      (Cursor.get_hotspot_x obj)

  method get_hotspot_y : unit -> int =
    fun () ->
      (Cursor.get_hotspot_y obj)

  method get_name : unit -> string option =
    fun () ->
      (Cursor.get_name obj)

  method get_texture : unit -> GTexture.texture option =
    fun () ->
      Option.map (fun ret -> new GTexture.texture ret) (Cursor.get_texture obj)

    method as_cursor = obj
end

