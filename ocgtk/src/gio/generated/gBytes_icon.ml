class type bytes_icon_t = object
    method get_bytes : unit -> Glib_bytes.t
    method as_bytes_icon : Bytes_icon.t
end

(* High-level class for BytesIcon *)
class bytes_icon (obj : Bytes_icon.t) : bytes_icon_t = object (self)

  method get_bytes : unit -> Glib_bytes.t =
    fun () ->
      (Bytes_icon.get_bytes obj)

    method as_bytes_icon = obj
end

let new_ (bytes : Glib_bytes.t) : bytes_icon_t =
  let obj_ = Bytes_icon.new_ bytes in
  new bytes_icon obj_

