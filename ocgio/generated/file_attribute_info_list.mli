class type file_attribute_info_list_t = object
  method add :
    string -> Enums.fileattributetype -> Enums.fileattributeinfoflags -> unit

  method dup : unit -> Raw.File_attribute_info_list.t
  method lookup : string -> Raw.File_attribute_info.t
  method ref : unit -> Raw.File_attribute_info_list.t
  method as_file_attribute_info_list : Raw.File_attribute_info_list.t
end

class file_attribute_info_list :
  Raw.File_attribute_info_list.t ->
  file_attribute_info_list_t

val new_ : unit -> file_attribute_info_list_t
