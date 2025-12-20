class file_info : File_info.t ->
  object
    method clear_status : unit -> unit
    method copy_into : <as_file_info: File_info.t; ..> -> unit
    method dup : unit -> file_info
    method get_attribute_as_string : string -> string option
    method get_attribute_boolean : string -> bool
    method get_attribute_byte_string : string -> string option
    method get_attribute_status : string -> Gio_enums.fileattributestatus
    method get_attribute_string : string -> string option
    method get_attribute_type : string -> Gio_enums.fileattributetype
    method get_content_type : unit -> string option
    method get_display_name : unit -> string
    method get_edit_name : unit -> string
    method get_etag : unit -> string option
    method get_file_type : unit -> Gio_enums.filetype
    method get_is_backup : unit -> bool
    method get_is_hidden : unit -> bool
    method get_is_symlink : unit -> bool
    method has_attribute : string -> bool
    method has_namespace : string -> bool
    method remove_attribute : string -> unit
    method set_attribute_boolean : string -> bool -> unit
    method set_attribute_byte_string : string -> string -> unit
    method set_attribute_mask : File_attribute_matcher.t -> unit
    method set_attribute_status : string -> Gio_enums.fileattributestatus -> bool
    method set_attribute_string : string -> string -> unit
    method set_content_type : string -> unit
    method set_display_name : string -> unit
    method set_edit_name : string -> unit
    method set_file_type : Gio_enums.filetype -> unit
    method set_is_hidden : bool -> unit
    method set_is_symlink : bool -> unit
    method unset_attribute_mask : unit -> unit
    method as_file_info : File_info.t
  end

