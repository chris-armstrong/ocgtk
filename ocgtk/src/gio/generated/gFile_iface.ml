(* High-level class for FileIface *)
class file_iface (obj : File_iface.t) = object (self)

    method as_file_iface = obj
end

