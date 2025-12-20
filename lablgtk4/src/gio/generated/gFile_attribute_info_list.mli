class file_attribute_info_list : File_attribute_info_list.t ->
  object
    method dup : unit -> File_attribute_info_list.t
    method ref : unit -> File_attribute_info_list.t
    method unref : unit -> unit
    method as_file_attribute_info_list : File_attribute_info_list.t
  end

