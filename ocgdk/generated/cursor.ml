class type cursor_t = object
  method get_fallback : unit -> cursor_t option
  method get_hotspot_x : unit -> int
  method get_hotspot_y : unit -> int
  method get_name : unit -> string option
  method get_texture : unit -> Texture.texture_t option
  method as_cursor : Raw.Cursor.t
end

(* High-level class for Cursor *)
class cursor (obj : Raw.Cursor.t) : cursor_t =
  object (self)
    method get_fallback : unit -> cursor_t option =
      fun () ->
        Option.map (fun ret -> new cursor ret) (Raw.Cursor.get_fallback obj)

    method get_hotspot_x : unit -> int = fun () -> Raw.Cursor.get_hotspot_x obj
    method get_hotspot_y : unit -> int = fun () -> Raw.Cursor.get_hotspot_y obj
    method get_name : unit -> string option = fun () -> Raw.Cursor.get_name obj

    method get_texture : unit -> Texture.texture_t option =
      fun () ->
        Option.map
          (fun ret -> new Texture.texture ret)
          (Raw.Cursor.get_texture obj)

    method as_cursor = obj
  end

let new_from_name (name : string) (fallback : cursor_t option) : cursor_t =
  let fallback = Option.map (fun c -> c#as_cursor) fallback in
  let obj_ = Raw.Cursor.new_from_name name fallback in
  new cursor obj_

let new_from_texture (texture : Texture.texture_t) (hotspot_x : int)
    (hotspot_y : int) (fallback : cursor_t option) : cursor_t =
  let texture = texture#as_texture in
  let fallback = Option.map (fun c -> c#as_cursor) fallback in
  let obj_ = Raw.Cursor.new_from_texture texture hotspot_x hotspot_y fallback in
  new cursor obj_
