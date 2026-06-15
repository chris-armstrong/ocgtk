class type file_attribute_info_t = object
  method get_name : string
  method set_name : string -> unit
  method get_type : Gio_enums.fileattributetype
  method set_type : Gio_enums.fileattributetype -> unit
  method get_flags : Gio_enums.fileattributeinfoflags
  method set_flags : Gio_enums.fileattributeinfoflags -> unit
  method as_file_attribute_info : File_attribute_info.t
end

class file_attribute_info : File_attribute_info.t -> file_attribute_info_t

val make :
  string ->
  Gio_enums.fileattributetype ->
  Gio_enums.fileattributeinfoflags ->
  file_attribute_info_t
