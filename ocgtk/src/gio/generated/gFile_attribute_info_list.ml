(* High-level class for FileAttributeInfoList *)
class file_attribute_info_list (obj : File_attribute_info_list.t) = object (self)

  method add : string -> Gio_enums.fileattributetype -> Gio_enums.fileattributeinfoflags -> unit =
    fun name type_ flags ->
      (File_attribute_info_list.add obj name type_ flags)

  method dup : unit -> File_attribute_info_list.t =
    fun () ->
      (File_attribute_info_list.dup obj)

  method ref : unit -> File_attribute_info_list.t =
    fun () ->
      (File_attribute_info_list.ref obj)

  method unref : unit -> unit =
    fun () ->
      (File_attribute_info_list.unref obj)

    method as_file_attribute_info_list = obj
end

