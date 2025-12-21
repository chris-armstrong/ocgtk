(* High-level class for FileDescriptorBased *)
class file_descriptor_based (obj : File_descriptor_based.t) = object (self)

  method get_fd : unit -> int =
    fun () ->
      (File_descriptor_based.get_fd obj)

    method as_file_descriptor_based = obj
end

