class type file_attribute_info_list_t = object
    method add : string -> Gio_enums.fileattributetype -> Gio_enums.fileattributeinfoflags -> unit
    method dup : unit -> File_attribute_info_list.t
    method lookup : string -> File_attribute_info.t
    method ref : unit -> File_attribute_info_list.t
    method unref : unit -> unit
    method as_file_attribute_info_list : File_attribute_info_list.t
end

(* High-level class for FileAttributeInfoList *)
class file_attribute_info_list (obj : File_attribute_info_list.t) : file_attribute_info_list_t = object (self)

  method add : string -> Gio_enums.fileattributetype -> Gio_enums.fileattributeinfoflags -> unit =
    fun name type_ flags ->
      (File_attribute_info_list.add obj name type_ flags)

  method dup : unit -> File_attribute_info_list.t =
    fun () ->
      (File_attribute_info_list.dup obj)

  method lookup : string -> File_attribute_info.t =
    fun name ->
      (File_attribute_info_list.lookup obj name)

  method ref : unit -> File_attribute_info_list.t =
    fun () ->
      (File_attribute_info_list.ref obj)

  method unref : unit -> unit =
    fun () ->
      (File_attribute_info_list.unref obj)

    method as_file_attribute_info_list = obj
end

