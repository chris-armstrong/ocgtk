class type cursor_t = object
  (** {2:methods Methods} *)

  method get_fallback : unit -> cursor_t option
  (** Returns the fallback for this [cursor].

      The fallback will be used if this cursor is not available on a given
      [GdkDisplay]. For named cursors, this can happen when using nonstandard
      names or when using an incomplete cursor theme. For textured cursors, this
      can happen when the texture is too large or when the [GdkDisplay] it is
      used on does not support textured cursors. *)

  method get_hotspot_x : unit -> int
  (** Returns the horizontal offset of the hotspot.

      The hotspot indicates the pixel that will be directly above the cursor.

      Note that named cursors may have a nonzero hotspot, but this function will
      only return the hotspot position for cursors created with
      [Gdk.Cursor.new_from_texture]. *)

  method get_hotspot_y : unit -> int
  (** Returns the vertical offset of the hotspot.

      The hotspot indicates the pixel that will be directly above the cursor.

      Note that named cursors may have a nonzero hotspot, but this function will
      only return the hotspot position for cursors created with
      [Gdk.Cursor.new_from_texture]. *)

  method get_name : unit -> string option
  (** Returns the name of the cursor.

      If the cursor is not a named cursor, [NULL] will be returned. *)

  method get_texture : unit -> Texture.texture_t option
  (** Returns the texture for the cursor.

      If the cursor is a named cursor, [NULL] will be returned. *)

  (** {2:conversions Conversions} *)

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
