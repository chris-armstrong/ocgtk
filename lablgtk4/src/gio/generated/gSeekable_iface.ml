(* High-level class for SeekableIface *)
class seekable_iface (obj : Seekable_iface.t) = object (self)

    method as_seekable_iface = obj
end

