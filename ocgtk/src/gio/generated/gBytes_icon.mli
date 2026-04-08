class type bytes_icon_t = object
    method get_bytes : unit -> Glib_bytes.t
    method as_bytes_icon : Bytes_icon.t
end

class bytes_icon : Bytes_icon.t -> bytes_icon_t

val new_ : Glib_bytes.t -> bytes_icon_t
