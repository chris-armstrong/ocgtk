class file_attribute_info_list : File_attribute_info_list.t ->
  object
    method add : string -> Gio_enums.fileattributetype -> Gio_enums.fileattributeinfoflags -> unit
    method dup : unit -> File_attribute_info_list.t
    method lookup : string -> File_attribute_info.t
    method ref : unit -> File_attribute_info_list.t
    method unref : unit -> unit
    method as_file_attribute_info_list : File_attribute_info_list.t
  end

