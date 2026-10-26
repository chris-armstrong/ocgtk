class type file_attribute_info_list_t = object
  method add :
    string ->
    Gio_enums.fileattributetype ->
    Gio_enums.fileattributeinfoflags ->
    unit

  method dup : unit -> File_attribute_info_list.t
  method lookup : string -> File_attribute_info.t
  method ref : unit -> File_attribute_info_list.t
  method as_file_attribute_info_list : File_attribute_info_list.t
end

class file_attribute_info_list :
  File_attribute_info_list.t ->
  file_attribute_info_list_t

val new_ : unit -> file_attribute_info_list_t
