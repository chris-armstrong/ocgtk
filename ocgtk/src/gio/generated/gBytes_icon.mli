class type bytes_icon_t = object
    inherit GIcon.icon_t
    inherit GLoadable_icon.loadable_icon_t
    method as_bytes_icon : Bytes_icon.t
end

class bytes_icon : Bytes_icon.t -> bytes_icon_t

