(** Stores information about a file system object referenced by a [Gio.File].

    Functionality for manipulating basic metadata for files. [GFileInfo]
    implements methods for getting information that all files should contain,
    and allows for manipulation of extended attributes.

    See the file attributes document for more information on how GIO handles
    file attributes.

    To obtain a [GFileInfo] for a [Gio.File], use [Gio.File.query_info] (or its
    async variant). To obtain a [GFileInfo] for a file input or output stream,
    use [Gio.FileInputStream.query_info] or [Gio.FileOutputStream.query_info]
    (or their async variants).

    To change the actual attributes of a file, you should then set the attribute
    in the [GFileInfo] and call [Gio.File.set_attributes_from_info] or
    [Gio.File.set_attributes_async] on a [GFile].

    However, not all attributes can be changed in the file. For instance, the
    actual size of a file cannot be changed via [Gio.FileInfo.set_size]. You may
    call [Gio.File.query_settable_attributes] and
    [Gio.File.query_writable_namespaces] to discover the settable attributes of
    a particular file at runtime.

    The direct accessors, such as [Gio.FileInfo.get_name], are slightly more
    optimized than the generic attribute accessors, such as
    [Gio.FileInfo.get_attribute_byte_string].This optimization will matter only
    if calling the API in a tight loop.

    It is an error to call these accessors without specifying their required
    file attributes when creating the [GFileInfo]. Use
    [Gio.FileInfo.has_attribute] or [Gio.FileInfo.list_attributes] to check what
    attributes are specified for a [GFileInfo].

    [Gio.FileAttributeMatcher] allows for searching through a [GFileInfo] for
    attributes.

    Its methods, signals and properties are on {!class-type-file_info_t}. The
    functions it is built on are in {!Ocgio.Raw.File_info}. *)

(** The methods, signals and properties of a [GFileInfo]. *)
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

class file_info : Raw.File_info.t -> file_info_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.File_info.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GFileInfo], give one already wrapped. *)

val new_ : unit -> file_info_t
