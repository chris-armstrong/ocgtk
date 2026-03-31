class type cursor_t = object
    method get_fallback : unit -> cursor_t option
    method get_hotspot_x : unit -> int
    method get_hotspot_y : unit -> int
    method get_name : unit -> string option
    method get_texture : unit -> GTexture.texture_t option
    method as_cursor : Cursor.t
end

(* High-level class for Cursor *)
class cursor (obj : Cursor.t) : cursor_t = object (self)

  method get_fallback : unit -> cursor_t option =
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

  method get_texture : unit -> GTexture.texture_t option =
    fun () ->
      Option.map (fun ret -> new GTexture.texture ret) (Cursor.get_texture obj)

    method as_cursor = obj
end

let new_from_name (name : string) (fallback : cursor_t option) : cursor_t =
  let fallback = Option.map (fun c -> c#as_cursor) fallback in
  let obj_ = Cursor.new_from_name name fallback in
  new cursor obj_

let new_from_texture (texture : GTexture.texture_t) (hotspot_x : int) (hotspot_y : int) (fallback : cursor_t option) : cursor_t =
  let texture = texture#as_texture in
  let fallback = Option.map (fun c -> c#as_cursor) fallback in
  let obj_ = Cursor.new_from_texture texture hotspot_x hotspot_y fallback in
  new cursor obj_

