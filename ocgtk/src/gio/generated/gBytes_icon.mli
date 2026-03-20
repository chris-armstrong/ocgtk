class type bytes_icon_t = object
    method as_bytes_icon : Bytes_icon.t
end

class bytes_icon : Bytes_icon.t -> bytes_icon_t

