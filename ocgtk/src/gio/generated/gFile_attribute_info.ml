class type file_attribute_info_t = object
  method get_name : string
  method set_name : string -> unit
  method get_type : Gio_enums.fileattributetype
  method set_type : Gio_enums.fileattributetype -> unit
  method get_flags : Gio_enums.fileattributeinfoflags
  method set_flags : Gio_enums.fileattributeinfoflags -> unit
  method as_file_attribute_info : File_attribute_info.t
end

(* High-level class for FileAttributeInfo *)
class file_attribute_info (obj : File_attribute_info.t) : file_attribute_info_t
  =
  object (self)
    method get_name : string = File_attribute_info.get_name obj

    method set_name : string -> unit =
      fun v -> File_attribute_info.set_name obj v

    method get_type : Gio_enums.fileattributetype =
      File_attribute_info.get_type obj

    method set_type : Gio_enums.fileattributetype -> unit =
      fun v -> File_attribute_info.set_type obj v

    method get_flags : Gio_enums.fileattributeinfoflags =
      File_attribute_info.get_flags obj

    method set_flags : Gio_enums.fileattributeinfoflags -> unit =
      fun v -> File_attribute_info.set_flags obj v

    method as_file_attribute_info = obj
  end

let make (name : string) (type_ : Gio_enums.fileattributetype)
    (flags : Gio_enums.fileattributeinfoflags) : file_attribute_info_t =
  new file_attribute_info (File_attribute_info.make name type_ flags)
