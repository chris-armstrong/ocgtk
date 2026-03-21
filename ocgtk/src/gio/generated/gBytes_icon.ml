class type bytes_icon_t = object
    method as_bytes_icon : Bytes_icon.t
end

(* High-level class for BytesIcon *)
class bytes_icon (obj : Bytes_icon.t) : bytes_icon_t = object (self)

    method as_bytes_icon = obj
end

