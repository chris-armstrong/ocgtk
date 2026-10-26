class type file_info_t = object
  method clear_status : unit -> unit
  method copy_into : file_info_t -> unit
  method dup : unit -> file_info_t
  method get_attribute_as_string : string -> string option
  method get_attribute_boolean : string -> bool
  method get_attribute_byte_string : string -> string option
  method get_attribute_file_path : string -> string option
  method get_attribute_int32 : string -> Int32.t
  method get_attribute_int64 : string -> int64
  method get_attribute_object : string -> [ `object_ ] Gobject.obj option
  method get_attribute_status : string -> Enums.fileattributestatus
  method get_attribute_string : string -> string option
  method get_attribute_stringv : string -> string array option
  method get_attribute_type : string -> Enums.fileattributetype
  method get_attribute_uint32 : string -> UInt32.t
  method get_attribute_uint64 : string -> UInt64.t
  method get_content_type : unit -> string option
  method get_display_name : unit -> string
  method get_edit_name : unit -> string
  method get_etag : unit -> string option
  method get_file_type : unit -> Enums.filetype
  method get_icon : unit -> Icon.icon_t option
  method get_is_backup : unit -> bool
  method get_is_hidden : unit -> bool
  method get_is_symlink : unit -> bool
  method get_name : unit -> string
  method get_size : unit -> int64
  method get_sort_order : unit -> Int32.t
  method get_symbolic_icon : unit -> Icon.icon_t option
  method get_symlink_target : unit -> string option
  method has_attribute : string -> bool
  method has_namespace : string -> bool
  method list_attributes : string option -> string array option
  method remove_attribute : string -> unit
  method set_attribute_boolean : string -> bool -> unit
  method set_attribute_byte_string : string -> string -> unit
  method set_attribute_file_path : string -> string -> unit
  method set_attribute_int32 : string -> Int32.t -> unit
  method set_attribute_int64 : string -> int64 -> unit
  method set_attribute_mask : Raw.File_attribute_matcher.t -> unit
  method set_attribute_object : string -> [ `object_ ] Gobject.obj -> unit
  method set_attribute_status : string -> Enums.fileattributestatus -> bool
  method set_attribute_string : string -> string -> unit
  method set_attribute_stringv : string -> string array -> unit
  method set_attribute_uint32 : string -> UInt32.t -> unit
  method set_attribute_uint64 : string -> UInt64.t -> unit
  method set_content_type : string -> unit
  method set_display_name : string -> unit
  method set_edit_name : string -> unit
  method set_file_type : Enums.filetype -> unit
  method set_icon : Icon.icon_t -> unit
  method set_is_hidden : bool -> unit
  method set_is_symlink : bool -> unit
  method set_name : string -> unit
  method set_size : int64 -> unit
  method set_sort_order : Int32.t -> unit
  method set_symbolic_icon : Icon.icon_t -> unit
  method set_symlink_target : string -> unit
  method unset_attribute_mask : unit -> unit
  method as_file_info : Raw.File_info.t
end

(* High-level class for FileInfo *)
class file_info (obj : Raw.File_info.t) : file_info_t =
  object (self)
    method clear_status : unit -> unit =
      fun () -> Raw.File_info.clear_status obj

    method copy_into : file_info_t -> unit =
      fun dest_info ->
        let dest_info = dest_info#as_file_info in
        Raw.File_info.copy_into obj dest_info

    method dup : unit -> file_info_t =
      fun () -> new file_info (Raw.File_info.dup obj)

    method get_attribute_as_string : string -> string option =
      fun attribute -> Raw.File_info.get_attribute_as_string obj attribute

    method get_attribute_boolean : string -> bool =
      fun attribute -> Raw.File_info.get_attribute_boolean obj attribute

    method get_attribute_byte_string : string -> string option =
      fun attribute -> Raw.File_info.get_attribute_byte_string obj attribute

    method get_attribute_file_path : string -> string option =
      fun attribute -> Raw.File_info.get_attribute_file_path obj attribute

    method get_attribute_int32 : string -> Int32.t =
      fun attribute -> Raw.File_info.get_attribute_int32 obj attribute

    method get_attribute_int64 : string -> int64 =
      fun attribute -> Raw.File_info.get_attribute_int64 obj attribute

    method get_attribute_object : string -> [ `object_ ] Gobject.obj option =
      fun attribute -> Raw.File_info.get_attribute_object obj attribute

    method get_attribute_status : string -> Enums.fileattributestatus =
      fun attribute -> Raw.File_info.get_attribute_status obj attribute

    method get_attribute_string : string -> string option =
      fun attribute -> Raw.File_info.get_attribute_string obj attribute

    method get_attribute_stringv : string -> string array option =
      fun attribute -> Raw.File_info.get_attribute_stringv obj attribute

    method get_attribute_type : string -> Enums.fileattributetype =
      fun attribute -> Raw.File_info.get_attribute_type obj attribute

    method get_attribute_uint32 : string -> UInt32.t =
      fun attribute -> Raw.File_info.get_attribute_uint32 obj attribute

    method get_attribute_uint64 : string -> UInt64.t =
      fun attribute -> Raw.File_info.get_attribute_uint64 obj attribute

    method get_content_type : unit -> string option =
      fun () -> Raw.File_info.get_content_type obj

    method get_display_name : unit -> string =
      fun () -> Raw.File_info.get_display_name obj

    method get_edit_name : unit -> string =
      fun () -> Raw.File_info.get_edit_name obj

    method get_etag : unit -> string option =
      fun () -> Raw.File_info.get_etag obj

    method get_file_type : unit -> Enums.filetype =
      fun () -> Raw.File_info.get_file_type obj

    method get_icon : unit -> Icon.icon_t option =
      fun () ->
        Option.map (fun ret -> new Icon.icon ret) (Raw.File_info.get_icon obj)

    method get_is_backup : unit -> bool =
      fun () -> Raw.File_info.get_is_backup obj

    method get_is_hidden : unit -> bool =
      fun () -> Raw.File_info.get_is_hidden obj

    method get_is_symlink : unit -> bool =
      fun () -> Raw.File_info.get_is_symlink obj

    method get_name : unit -> string = fun () -> Raw.File_info.get_name obj
    method get_size : unit -> int64 = fun () -> Raw.File_info.get_size obj

    method get_sort_order : unit -> Int32.t =
      fun () -> Raw.File_info.get_sort_order obj

    method get_symbolic_icon : unit -> Icon.icon_t option =
      fun () ->
        Option.map
          (fun ret -> new Icon.icon ret)
          (Raw.File_info.get_symbolic_icon obj)

    method get_symlink_target : unit -> string option =
      fun () -> Raw.File_info.get_symlink_target obj

    method has_attribute : string -> bool =
      fun attribute -> Raw.File_info.has_attribute obj attribute

    method has_namespace : string -> bool =
      fun name_space -> Raw.File_info.has_namespace obj name_space

    method list_attributes : string option -> string array option =
      fun name_space -> Raw.File_info.list_attributes obj name_space

    method remove_attribute : string -> unit =
      fun attribute -> Raw.File_info.remove_attribute obj attribute

    method set_attribute_boolean : string -> bool -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_boolean obj attribute attr_value

    method set_attribute_byte_string : string -> string -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_byte_string obj attribute attr_value

    method set_attribute_file_path : string -> string -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_file_path obj attribute attr_value

    method set_attribute_int32 : string -> Int32.t -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_int32 obj attribute attr_value

    method set_attribute_int64 : string -> int64 -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_int64 obj attribute attr_value

    method set_attribute_mask : Raw.File_attribute_matcher.t -> unit =
      fun mask -> Raw.File_info.set_attribute_mask obj mask

    method set_attribute_object : string -> [ `object_ ] Gobject.obj -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_object obj attribute attr_value

    method set_attribute_status : string -> Enums.fileattributestatus -> bool =
      fun attribute status ->
        Raw.File_info.set_attribute_status obj attribute status

    method set_attribute_string : string -> string -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_string obj attribute attr_value

    method set_attribute_stringv : string -> string array -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_stringv obj attribute attr_value

    method set_attribute_uint32 : string -> UInt32.t -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_uint32 obj attribute attr_value

    method set_attribute_uint64 : string -> UInt64.t -> unit =
      fun attribute attr_value ->
        Raw.File_info.set_attribute_uint64 obj attribute attr_value

    method set_content_type : string -> unit =
      fun content_type -> Raw.File_info.set_content_type obj content_type

    method set_display_name : string -> unit =
      fun display_name -> Raw.File_info.set_display_name obj display_name

    method set_edit_name : string -> unit =
      fun edit_name -> Raw.File_info.set_edit_name obj edit_name

    method set_file_type : Enums.filetype -> unit =
      fun type_ -> Raw.File_info.set_file_type obj type_

    method set_icon : Icon.icon_t -> unit =
      fun icon ->
        let icon = icon#as_icon in
        Raw.File_info.set_icon obj icon

    method set_is_hidden : bool -> unit =
      fun is_hidden -> Raw.File_info.set_is_hidden obj is_hidden

    method set_is_symlink : bool -> unit =
      fun is_symlink -> Raw.File_info.set_is_symlink obj is_symlink

    method set_name : string -> unit =
      fun name -> Raw.File_info.set_name obj name

    method set_size : int64 -> unit =
      fun size -> Raw.File_info.set_size obj size

    method set_sort_order : Int32.t -> unit =
      fun sort_order -> Raw.File_info.set_sort_order obj sort_order

    method set_symbolic_icon : Icon.icon_t -> unit =
      fun icon ->
        let icon = icon#as_icon in
        Raw.File_info.set_symbolic_icon obj icon

    method set_symlink_target : string -> unit =
      fun symlink_target -> Raw.File_info.set_symlink_target obj symlink_target

    method unset_attribute_mask : unit -> unit =
      fun () -> Raw.File_info.unset_attribute_mask obj

    method as_file_info = obj
  end

let new_ () : file_info_t = new file_info (Raw.File_info.new_ ())
