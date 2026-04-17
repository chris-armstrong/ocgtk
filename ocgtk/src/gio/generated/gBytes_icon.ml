class type bytes_icon_t = object
  inherit GIcon.icon_t
  inherit GLoadable_icon.loadable_icon_t
  method get_bytes : unit -> Glib_bytes.t
  method as_bytes_icon : Bytes_icon.t
end

(* High-level class for BytesIcon *)
class bytes_icon (obj : Bytes_icon.t) : bytes_icon_t =
  object (self)
    inherit GIcon.icon (Icon.from_gobject obj)
    inherit GLoadable_icon.loadable_icon (Loadable_icon.from_gobject obj)
    method get_bytes : unit -> Glib_bytes.t = fun () -> Bytes_icon.get_bytes obj
    method as_bytes_icon = obj
  end

let new_ (bytes : Glib_bytes.t) : bytes_icon_t =
  let obj_ = Bytes_icon.new_ bytes in
  new bytes_icon obj_
