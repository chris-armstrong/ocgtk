(* High-level class for FileInfo *)
class file_info (obj : File_info.t) = object (self)

  method clear_status : unit -> unit =
    fun () ->
      (File_info.clear_status obj)

  method copy_into : 'p1. (<as_file_info: File_info.t; ..> as 'p1) -> unit =
    fun dest_info ->
      let dest_info = dest_info#as_file_info in
      (File_info.copy_into obj dest_info)

  method dup : unit -> file_info =
    fun () ->
      new  file_info(File_info.dup obj)

  method get_attribute_as_string : string -> string option =
    fun attribute ->
      (File_info.get_attribute_as_string obj attribute)

  method get_attribute_boolean : string -> bool =
    fun attribute ->
      (File_info.get_attribute_boolean obj attribute)

  method get_attribute_byte_string : string -> string option =
    fun attribute ->
      (File_info.get_attribute_byte_string obj attribute)

  method get_attribute_status : string -> Gio_enums.fileattributestatus =
    fun attribute ->
      (File_info.get_attribute_status obj attribute)

  method get_attribute_string : string -> string option =
    fun attribute ->
      (File_info.get_attribute_string obj attribute)

  method get_attribute_type : string -> Gio_enums.fileattributetype =
    fun attribute ->
      (File_info.get_attribute_type obj attribute)

  method get_content_type : unit -> string option =
    fun () ->
      (File_info.get_content_type obj)

  method get_display_name : unit -> string =
    fun () ->
      (File_info.get_display_name obj)

  method get_edit_name : unit -> string =
    fun () ->
      (File_info.get_edit_name obj)

  method get_etag : unit -> string option =
    fun () ->
      (File_info.get_etag obj)

  method get_file_type : unit -> Gio_enums.filetype =
    fun () ->
      (File_info.get_file_type obj)

  method get_is_backup : unit -> bool =
    fun () ->
      (File_info.get_is_backup obj)

  method get_is_hidden : unit -> bool =
    fun () ->
      (File_info.get_is_hidden obj)

  method get_is_symlink : unit -> bool =
    fun () ->
      (File_info.get_is_symlink obj)

  method has_attribute : string -> bool =
    fun attribute ->
      (File_info.has_attribute obj attribute)

  method has_namespace : string -> bool =
    fun name_space ->
      (File_info.has_namespace obj name_space)

  method remove_attribute : string -> unit =
    fun attribute ->
      (File_info.remove_attribute obj attribute)

  method set_attribute_boolean : string -> bool -> unit =
    fun attribute attr_value ->
      (File_info.set_attribute_boolean obj attribute attr_value)

  method set_attribute_byte_string : string -> string -> unit =
    fun attribute attr_value ->
      (File_info.set_attribute_byte_string obj attribute attr_value)

  method set_attribute_mask : File_attribute_matcher.t -> unit =
    fun mask ->
      (File_info.set_attribute_mask obj mask)

  method set_attribute_status : string -> Gio_enums.fileattributestatus -> bool =
    fun attribute status ->
      (File_info.set_attribute_status obj attribute status)

  method set_attribute_string : string -> string -> unit =
    fun attribute attr_value ->
      (File_info.set_attribute_string obj attribute attr_value)

  method set_content_type : string -> unit =
    fun content_type ->
      (File_info.set_content_type obj content_type)

  method set_display_name : string -> unit =
    fun display_name ->
      (File_info.set_display_name obj display_name)

  method set_edit_name : string -> unit =
    fun edit_name ->
      (File_info.set_edit_name obj edit_name)

  method set_file_type : Gio_enums.filetype -> unit =
    fun type_ ->
      (File_info.set_file_type obj type_)

  method set_is_hidden : bool -> unit =
    fun is_hidden ->
      (File_info.set_is_hidden obj is_hidden)

  method set_is_symlink : bool -> unit =
    fun is_symlink ->
      (File_info.set_is_symlink obj is_symlink)

  method unset_attribute_mask : unit -> unit =
    fun () ->
      (File_info.unset_attribute_mask obj)

    method as_file_info = obj
end

