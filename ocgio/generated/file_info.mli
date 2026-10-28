(** Stores information about a file system object referenced by a [Gio.File].

    Its methods, signals and properties are on {!class-type-file_info_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.File_info}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FileInfo].}

    Stores information about a file system object referenced by a [Gio.File].

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
    attributes. *)
class type file_info_t = object
  (** {2:methods Methods} *)

  method clear_status : unit -> unit
  (** Clears the status information from [info]. *)

  method copy_into : file_info_t -> unit
  (** First clears all of the GFileAttribute of [dest_info], and then copies all
      of the file attributes from [src_info] to [dest_info]. *)

  method dup : unit -> file_info_t
  (** Duplicates a file info structure. *)

  method get_attribute_as_string : string -> string option
  [@@ocaml.doc
    "Gets the value of an attribute, formatted as a human readable string.\n\n\
     This escapes things as needed to make the string valid UTF-8 and readable \
     by\n\
     humans. It’s not meant to be a machine readable or reversible escaping\n\
     format.\n\n\
     To format file name attributes of type\n\
     [Gio.FileAttributeType.BYTE_STRING] for output as UTF-8, use\n\
     [GLib.filename_to_utf8] instead:\n\n\
     {[\n\
     const char *trash_orig_path_byte_string;\n\
     g_autofree char *trash_orig_path_utf8 = NULL;\n\n\
     trash_orig_path_byte_string = g_file_info_get_attribute_byte_string \
     (info, G_FILE_ATTRIBUTE_TRASH_ORIG_PATH);\n\
     trash_orig_path_utf8 = g_filename_to_utf8 (trash_orig_path_byte_string, \
     -1, NULL, NULL, NULL);\n\
     if (trash_orig_path_utf8 != NULL)\n\
    \  g_message (\"Some larger UTF-8 string with filename embedded as %s\", \
     trash_orig_path_utf8);\n\
     ]}"]

  method get_attribute_boolean : string -> bool
  (** Gets the value of a boolean attribute. If the attribute does not contain a
      boolean value, [false] will be returned. *)

  method get_attribute_byte_string : string -> string option
  (** Gets the value of a byte string attribute. If the attribute does not
      contain a byte string, [None] will be returned. *)

  method get_attribute_file_path : string -> string option
  (** Gets the value of a byte string attribute as a file path.

      If the attribute does not contain a byte string, [None] will be returned.

      This function is meant to be used by language bindings that have specific
      handling for Unix paths. *)

  method get_attribute_int32 : string -> Int32.t
  (** Gets a signed 32-bit integer contained within the attribute. If the
      attribute does not contain a signed 32-bit integer, or is invalid, 0 will
      be returned. *)

  method get_attribute_int64 : string -> int64
  (** Gets a signed 64-bit integer contained within the attribute. If the
      attribute does not contain a signed 64-bit integer, or is invalid, 0 will
      be returned. *)

  method get_attribute_object : string -> [ `object_ ] Gobject.obj option
  (** Gets the value of a [GObject] attribute. If the attribute does not contain
      a [GObject], [None] will be returned. *)

  method get_attribute_status : string -> Enums.fileattributestatus
  (** Gets the attribute status for an attribute key. *)

  method get_attribute_string : string -> string option
  (** Gets the value of a string attribute. If the attribute does not contain a
      string, [None] will be returned. *)

  method get_attribute_stringv : string -> string array option
  (** Gets the value of a stringv attribute. If the attribute does not contain a
      stringv, [None] will be returned. *)

  method get_attribute_type : string -> Enums.fileattributetype
  (** Gets the attribute type for an attribute key. *)

  method get_attribute_uint32 : string -> UInt32.t
  (** Gets an unsigned 32-bit integer contained within the attribute. If the
      attribute does not contain an unsigned 32-bit integer, or is invalid, 0
      will be returned. *)

  method get_attribute_uint64 : string -> UInt64.t
  (** Gets a unsigned 64-bit integer contained within the attribute. If the
      attribute does not contain an unsigned 64-bit integer, or is invalid, 0
      will be returned. *)

  method get_content_type : unit -> string option
  (** Gets the file's content type.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE]. *)

  method get_display_name : unit -> string
  (** Gets a display name for a file. This is guaranteed to always be set.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME]. *)

  method get_edit_name : unit -> string
  (** Gets the edit name for a file.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME]. *)

  method get_etag : unit -> string option
  (** Gets the \[entity tag\][Gio.File] for a given [GFileInfo]. See
      [G_FILE_ATTRIBUTE_ETAG_VALUE].

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_ETAG_VALUE]. *)

  method get_file_type : unit -> Enums.filetype
  (** Gets a file's type (whether it is a regular file, symlink, etc). This is
      different from the file's content type, see
      g_file_info_get_content_type().

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_TYPE]. *)

  method get_icon : unit -> Icon.icon_t option
  (** Gets the icon for a file.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_ICON]. *)

  method get_is_backup : unit -> bool
  (** Checks if a file is a backup file.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_IS_BACKUP]. *)

  method get_is_hidden : unit -> bool
  (** Checks if a file is hidden.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN]. *)

  method get_is_symlink : unit -> bool
  (** Checks if a file is a symlink.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK]. *)

  method get_name : unit -> string
  (** Gets the name for a file. This is guaranteed to always be set.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_NAME]. *)

  method get_size : unit -> int64
  (** Gets the file's size (in bytes). The size is retrieved through the value
      of the [G_FILE_ATTRIBUTE_STANDARD_SIZE] attribute and is converted from
      [UInt64.t] to #goffset before returning the result.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_SIZE]. *)

  method get_sort_order : unit -> Int32.t
  (** Gets the value of the sort_order attribute from the [GFileInfo]. See
      [G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER].

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER]. *)

  method get_symbolic_icon : unit -> Icon.icon_t option
  (** Gets the symbolic icon for a file.

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON]. *)

  method get_symlink_target : unit -> string option
  (** Gets the symlink target for a given [GFileInfo].

      It is an error to call this if the [GFileInfo] does not contain
      [G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET]. *)

  method has_attribute : string -> bool
  (** Checks if a file info structure has an attribute named [attribute]. *)

  method has_namespace : string -> bool
  (** Checks if a file info structure has an attribute in the specified
      [name_space]. *)

  method list_attributes : string option -> string array option
  (** Lists the file info structure's attributes. *)

  method remove_attribute : string -> unit
  (** Removes all cases of [attribute] from [info] if it exists. *)

  method set_attribute_boolean : string -> bool -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible. *)

  method set_attribute_byte_string : string -> string -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible. *)

  method set_attribute_file_path : string -> string -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible.

      This function is meant to be used by language bindings that have specific
      handling for Unix paths. *)

  method set_attribute_int32 : string -> Int32.t -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible. *)

  method set_attribute_int64 : string -> int64 -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible. *)

  method set_attribute_mask : Raw.File_attribute_matcher.t -> unit
  (** Sets [mask] on [info] to match specific attribute types. *)

  method set_attribute_object : string -> [ `object_ ] Gobject.obj -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible. *)

  method set_attribute_status : string -> Enums.fileattributestatus -> bool
  (** Sets the attribute status for an attribute key. This is only needed by
      external code that implement g_file_set_attributes_from_info() or similar
      functions.

      The attribute must exist in [info] for this to work. Otherwise [false] is
      returned and [info] is unchanged. *)

  method set_attribute_string : string -> string -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible. *)

  method set_attribute_stringv : string -> string array -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible.

      Sinze: 2.22 *)

  method set_attribute_uint32 : string -> UInt32.t -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible. *)

  method set_attribute_uint64 : string -> UInt64.t -> unit
  (** Sets the [attribute] to contain the given [attr_value], if possible. *)

  method set_content_type : string -> unit
  (** Sets the content type attribute for a given [GFileInfo]. See
      [G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE]. *)

  method set_display_name : string -> unit
  (** Sets the display name for the current [GFileInfo]. See
      [G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME]. *)

  method set_edit_name : string -> unit
  (** Sets the edit name for the current file. See
      [G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME]. *)

  method set_file_type : Enums.filetype -> unit
  (** Sets the file type in a [GFileInfo] to [type]. See
      [G_FILE_ATTRIBUTE_STANDARD_TYPE]. *)

  method set_icon : Icon.icon_t -> unit
  (** Sets the icon for a given [GFileInfo]. See
      [G_FILE_ATTRIBUTE_STANDARD_ICON]. *)

  method set_is_hidden : bool -> unit
  [@@ocaml.doc
    "Sets the \"is_hidden\" attribute in a [GFileInfo] according to [is_hidden].\n\
     See [G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN]."]

  method set_is_symlink : bool -> unit
  [@@ocaml.doc
    "Sets the \"is_symlink\" attribute in a [GFileInfo] according to \
     [is_symlink].\n\
     See [G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK]."]

  method set_name : string -> unit
  (** Sets the name attribute for the current [GFileInfo]. See
      [G_FILE_ATTRIBUTE_STANDARD_NAME]. *)

  method set_size : int64 -> unit
  (** Sets the [G_FILE_ATTRIBUTE_STANDARD_SIZE] attribute in the file info to
      the given size. *)

  method set_sort_order : Int32.t -> unit
  (** Sets the sort order attribute in the file info structure. See
      [G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER]. *)

  method set_symbolic_icon : Icon.icon_t -> unit
  (** Sets the symbolic icon for a given [GFileInfo]. See
      [G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON]. *)

  method set_symlink_target : string -> unit
  (** Sets the [G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET] attribute in the file
      info to the given symlink target. *)

  method unset_attribute_mask : unit -> unit
  (** Unsets a mask set by g_file_info_set_attribute_mask(), if one is set. *)

  (** {2:conversions Conversions} *)

  method as_file_info : Raw.File_info.t
end

class file_info : Raw.File_info.t -> file_info_t
(** Wraps a raw handle of {!Ocgio.Raw.File_info.t}. *)

(** {1:description Description}

    Stores information about a file system object referenced by a [Gio.File].

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
    attributes. *)

(** {1:constructors Constructors} *)

val new_ : unit -> file_info_t
(** Creates a new file info structure. *)
