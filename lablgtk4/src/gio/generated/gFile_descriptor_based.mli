class file_descriptor_based : File_descriptor_based.t ->
  object
    method get_fd : unit -> int
    method as_file_descriptor_based : File_descriptor_based.t
  end

