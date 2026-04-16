class type file_descriptor_based_t = object
  method get_fd : unit -> int
  method as_file_descriptor_based : File_descriptor_based.t
end

class file_descriptor_based : File_descriptor_based.t -> file_descriptor_based_t
