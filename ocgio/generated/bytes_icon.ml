class type bytes_icon_t = object
  inherit Icon.icon_t
  inherit Loadable_icon.loadable_icon_t
  method get_bytes : unit -> Glib_bytes.t
  method as_bytes_icon : Raw.Bytes_icon.t
end

(* High-level class for BytesIcon *)
class bytes_icon (obj : Raw.Bytes_icon.t) : bytes_icon_t =
  object (self)
    inherit Icon.icon (Raw.Icon.from_gobject obj)
    inherit Loadable_icon.loadable_icon (Raw.Loadable_icon.from_gobject obj)

    method get_bytes : unit -> Glib_bytes.t =
      fun () -> Raw.Bytes_icon.get_bytes obj

    method as_bytes_icon = obj
  end

let new_ (bytes : Glib_bytes.t) : bytes_icon_t =
  let obj_ = Raw.Bytes_icon.new_ bytes in
  new bytes_icon obj_
