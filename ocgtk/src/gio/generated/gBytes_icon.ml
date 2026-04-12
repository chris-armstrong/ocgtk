class type bytes_icon_t = object
    inherit GIcon.icon_t
    inherit GLoadable_icon.loadable_icon_t
    method as_bytes_icon : Bytes_icon.t
end

(* High-level class for BytesIcon *)
class bytes_icon (obj : Bytes_icon.t) : bytes_icon_t = object (self)
  inherit GIcon.icon (Icon.from_gobject obj)
  inherit GLoadable_icon.loadable_icon (Loadable_icon.from_gobject obj)

    method as_bytes_icon = obj
end

