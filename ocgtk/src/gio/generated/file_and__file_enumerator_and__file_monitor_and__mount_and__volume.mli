(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec File : sig
  type t = [`file] Gobject.obj

  (* Methods *)
  (** Finishes an unmount operation,
  see g_file_unmount_mountable_with_operation() for details.

  Finish an asynchronous unmount operation that was started
  with g_file_unmount_mountable_with_operation(). *)
  external unmount_mountable_with_operation_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_unmount_mountable_with_operation_finish"

  (** Finishes an unmount operation, see g_file_unmount_mountable() for details.

  Finish an asynchronous unmount operation that was started
  with g_file_unmount_mountable(). *)
  external unmount_mountable_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_unmount_mountable_finish"

  (** Finishes an asynchronous file trashing operation, started with
  g_file_trash_async(). *)
  external trash_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_trash_finish"

  (** Sends @file to the "Trashcan", if possible. This is similar to
  deleting it, but the user can recover it before emptying the trashcan.
  Not all file systems support trashing, so this call can return the
  %G_IO_ERROR_NOT_SUPPORTED error. Since GLib 2.66, the `x-gvfs-notrash` unix
  mount option can be used to disable g_file_trash() support for certain
  mounts, the %G_IO_ERROR_NOT_SUPPORTED error will be returned in that case.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external trash : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_trash"

  (** Checks if @file supports
  [thread-default contexts][g-main-context-push-thread-default-context].
  If this returns %FALSE, you cannot perform asynchronous operations on
  @file in a thread that has a thread-default context. *)
  external supports_thread_contexts : t -> bool = "ml_g_file_supports_thread_contexts"

  (** Finishes a stop operation, see g_file_stop_mountable() for details.

  Finish an asynchronous stop operation that was started
  with g_file_stop_mountable(). *)
  external stop_mountable_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_stop_mountable_finish"

  (** Finishes a start operation. See g_file_start_mountable() for details.

  Finish an asynchronous start operation that was started
  with g_file_start_mountable(). *)
  external start_mountable_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_start_mountable_finish"

  (** Finishes setting a display name started with
  g_file_set_display_name_async(). *)
  external set_display_name_finish : t -> Async_result.t -> (t, GError.t) result = "ml_g_file_set_display_name_finish"

  (** Renames @file to the specified display name.

  The display name is converted from UTF-8 to the correct encoding
  for the target filesystem if possible and the @file is renamed to this.

  If you want to implement a rename operation in the user interface the
  edit name (%G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME) should be used as the
  initial value in the rename widget, and then the result after editing
  should be passed to g_file_set_display_name().

  On success the resulting converted filename is returned.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external set_display_name : t -> string -> Cancellable.t option -> (t, GError.t) result = "ml_g_file_set_display_name"

  (** Tries to set all attributes in the #GFileInfo on the target
  values, not stopping on the first error.

  If there is any error during this operation then @error will
  be set to the first error. Error on particular fields are flagged
  by setting the "status" field in the attribute value to
  %G_FILE_ATTRIBUTE_STATUS_ERROR_SETTING, which means you can
  also detect further errors.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external set_attributes_from_info : t -> File_info.t -> Gio_enums.filequeryinfoflags -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_set_attributes_from_info"

  (** Finishes setting an attribute started in g_file_set_attributes_async(). *)
  external set_attributes_finish : t -> Async_result.t -> (bool * File_info.t, GError.t) result = "ml_g_file_set_attributes_finish"

  (** Sets @attribute of type %G_FILE_ATTRIBUTE_TYPE_STRING to @value.
  If @attribute is of a different type, this operation will fail.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external set_attribute_string : t -> string -> string -> Gio_enums.filequeryinfoflags -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_set_attribute_string"

  (** Sets @attribute of type %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING to @value.
  If @attribute is of a different type, this operation will fail,
  returning %FALSE.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external set_attribute_byte_string : t -> string -> string -> Gio_enums.filequeryinfoflags -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_set_attribute_byte_string"

  (** Resolves a relative path for @file to an absolute path.

  This call does no blocking I/O.

  If the @relative_path is an absolute path name, the resolution
  is done absolutely (without taking @file path as base). *)
  external resolve_relative_path : t -> string -> t = "ml_g_file_resolve_relative_path"

  (** Finishes an asynchronous file replace operation started with
  g_file_replace_readwrite_async(). *)
  external replace_readwrite_finish : t -> Async_result.t -> (File_io_stream.t, GError.t) result = "ml_g_file_replace_readwrite_finish"

  (** Returns an output stream for overwriting the file in readwrite mode,
  possibly creating a backup copy of the file first. If the file doesn't
  exist, it will be created.

  For details about the behaviour, see g_file_replace() which does the
  same thing but returns an output stream only.

  Note that in many non-local file cases read and write streams are not
  supported, so make sure you really need to do read and write streaming,
  rather than just opening for reading or writing. *)
  external replace_readwrite : t -> string option -> bool -> Gio_enums.filecreateflags -> Cancellable.t option -> (File_io_stream.t, GError.t) result = "ml_g_file_replace_readwrite"

  (** Finishes an asynchronous file replace operation started with
  g_file_replace_async(). *)
  external replace_finish : t -> Async_result.t -> (File_output_stream.t, GError.t) result = "ml_g_file_replace_finish"

  (** Finishes an asynchronous replace of the given @file. See
  g_file_replace_contents_async(). Sets @new_etag to the new entity
  tag for the document, if present. *)
  external replace_contents_finish : t -> Async_result.t -> (bool * string option, GError.t) result = "ml_g_file_replace_contents_finish"

  (** Returns an output stream for overwriting the file, possibly
  creating a backup copy of the file first. If the file doesn't exist,
  it will be created.

  This will try to replace the file in the safest way possible so
  that any errors during the writing will not affect an already
  existing copy of the file. For instance, for local files it
  may write to a temporary file and then atomically rename over
  the destination when the stream is closed.

  By default files created are generally readable by everyone,
  but if you pass %G_FILE_CREATE_PRIVATE in @flags the file
  will be made readable only to the current user, to the level that
  is supported on the target filesystem.

  If @cancellable is not %NULL, then the operation can be cancelled
  by triggering the cancellable object from another thread. If the
  operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
  returned.

  If you pass in a non-%NULL @etag value and @file already exists, then
  this value is compared to the current entity tag of the file, and if
  they differ an %G_IO_ERROR_WRONG_ETAG error is returned. This
  generally means that the file has been changed since you last read
  it. You can get the new etag from g_file_output_stream_get_etag()
  after you've finished writing and closed the #GFileOutputStream. When
  you load a new file you can use g_file_input_stream_query_info() to
  get the etag of the file.

  If @make_backup is %TRUE, this function will attempt to make a
  backup of the current file before overwriting it. If this fails
  a %G_IO_ERROR_CANT_CREATE_BACKUP error will be returned. If you
  want to replace anyway, try again with @make_backup set to %FALSE.

  If the file is a directory the %G_IO_ERROR_IS_DIRECTORY error will
  be returned, and if the file is some other form of non-regular file
  then a %G_IO_ERROR_NOT_REGULAR_FILE error will be returned. Some
  file systems don't allow all file names, and may return an
  %G_IO_ERROR_INVALID_FILENAME error, and if the name is to long
  %G_IO_ERROR_FILENAME_TOO_LONG will be returned. Other errors are
  possible too, and depend on what kind of filesystem the file is on. *)
  external replace : t -> string option -> bool -> Gio_enums.filecreateflags -> Cancellable.t option -> (File_output_stream.t, GError.t) result = "ml_g_file_replace"

  (** Finishes an asynchronous file read operation started with
  g_file_read_async(). *)
  external read_finish : t -> Async_result.t -> (File_input_stream.t, GError.t) result = "ml_g_file_read_finish"

  (** Opens a file for reading. The result is a #GFileInputStream that
  can be used to read the contents of the file.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.

  If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will be
  returned. If the file is a directory, the %G_IO_ERROR_IS_DIRECTORY
  error will be returned. Other errors are possible too, and depend
  on what kind of filesystem the file is on. *)
  external read : t -> Cancellable.t option -> (File_input_stream.t, GError.t) result = "ml_g_file_read"

  (** Obtain the list of attribute namespaces where new attributes
  can be created by a user. An example of this is extended
  attributes (in the "xattr" namespace).

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external query_writable_namespaces : t -> Cancellable.t option -> (File_attribute_info_list.t, GError.t) result = "ml_g_file_query_writable_namespaces"

  (** Obtain the list of settable attributes for the file.

  Returns the type and full attribute name of all the attributes
  that can be set on this file. This doesn't mean setting it will
  always succeed though, you might get an access failure, or some
  specific file may not support a specific attribute.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external query_settable_attributes : t -> Cancellable.t option -> (File_attribute_info_list.t, GError.t) result = "ml_g_file_query_settable_attributes"

  (** Finishes an asynchronous file info query.
  See g_file_query_info_async(). *)
  external query_info_finish : t -> Async_result.t -> (File_info.t, GError.t) result = "ml_g_file_query_info_finish"

  (** Gets the requested information about specified @file.
  The result is a #GFileInfo object that contains key-value
  attributes (such as the type or size of the file).

  The @attributes value is a string that specifies the file
  attributes that should be gathered. It is not an error if
  it's not possible to read a particular requested attribute
  from a file - it just won't be set. @attributes should be a
  comma-separated list of attributes or attribute wildcards.
  The wildcard "*" means all attributes, and a wildcard like
  "standard::*" means all attributes in the standard namespace.
  An example attribute query be "standard::*,owner::user".
  The standard attributes are available as defines, like
  %G_FILE_ATTRIBUTE_STANDARD_NAME.

  If @cancellable is not %NULL, then the operation can be cancelled
  by triggering the cancellable object from another thread. If the
  operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
  returned.

  For symlinks, normally the information about the target of the
  symlink is returned, rather than information about the symlink
  itself. However if you pass %G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS
  in @flags the information about the symlink itself will be returned.
  Also, for symlinks that point to non-existing files the information
  about the symlink itself will be returned.

  If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will be
  returned. Other errors are possible too, and depend on what kind of
  filesystem the file is on. *)
  external query_info : t -> string -> Gio_enums.filequeryinfoflags -> Cancellable.t option -> (File_info.t, GError.t) result = "ml_g_file_query_info"

  (** Finishes an asynchronous filesystem info query.
  See g_file_query_filesystem_info_async(). *)
  external query_filesystem_info_finish : t -> Async_result.t -> (File_info.t, GError.t) result = "ml_g_file_query_filesystem_info_finish"

  (** Similar to g_file_query_info(), but obtains information
  about the filesystem the @file is on, rather than the file itself.
  For instance the amount of space available and the type of
  the filesystem.

  The @attributes value is a string that specifies the attributes
  that should be gathered. It is not an error if it's not possible
  to read a particular requested attribute from a file - it just
  won't be set. @attributes should be a comma-separated list of
  attributes or attribute wildcards. The wildcard "*" means all
  attributes, and a wildcard like "filesystem::*" means all attributes
  in the filesystem namespace. The standard namespace for filesystem
  attributes is "filesystem". Common attributes of interest are
  %G_FILE_ATTRIBUTE_FILESYSTEM_SIZE (the total size of the filesystem
  in bytes), %G_FILE_ATTRIBUTE_FILESYSTEM_FREE (number of bytes available),
  and %G_FILE_ATTRIBUTE_FILESYSTEM_TYPE (type of the filesystem).

  If @cancellable is not %NULL, then the operation can be cancelled
  by triggering the cancellable object from another thread. If the
  operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
  returned.

  If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will
  be returned. Other errors are possible too, and depend on what
  kind of filesystem the file is on. *)
  external query_filesystem_info : t -> string -> Cancellable.t option -> (File_info.t, GError.t) result = "ml_g_file_query_filesystem_info"

  (** Utility function to inspect the #GFileType of a file. This is
  implemented using g_file_query_info() and as such does blocking I/O.

  The primary use case of this method is to check if a file is
  a regular file, directory, or symlink. *)
  external query_file_type : t -> Gio_enums.filequeryinfoflags -> Cancellable.t option -> Gio_enums.filetype = "ml_g_file_query_file_type"

  (** Utility function to check if a particular file exists. This is
  implemented using g_file_query_info() and as such does blocking I/O.

  Note that in many cases it is [racy to first check for file existence](https://en.wikipedia.org/wiki/Time_of_check_to_time_of_use)
  and then execute something based on the outcome of that, because the
  file might have been created or removed in between the operations. The
  general approach to handling that is to not check, but just do the
  operation and handle the errors as they come.

  As an example of race-free checking, take the case of reading a file,
  and if it doesn't exist, creating it. There are two racy versions: read
  it, and on error create it; and: check if it exists, if not create it.
  These can both result in two processes creating the file (with perhaps
  a partially written file as the result). The correct approach is to
  always try to create the file with g_file_create() which will either
  atomically create the file or fail with a %G_IO_ERROR_EXISTS error.

  However, in many cases an existence check is useful in a user interface,
  for instance to make a menu item sensitive/insensitive, so that you don't
  have to fool users that something is possible and then just show an error
  dialog. If you do this, you should make sure to also handle the errors
  that can happen due to races when you execute the operation. *)
  external query_exists : t -> Cancellable.t option -> bool = "ml_g_file_query_exists"

  (** Finishes a g_file_query_default_handler_async() operation. *)
  external query_default_handler_finish : t -> Async_result.t -> (App_info_and__app_launch_context.App_info.t, GError.t) result = "ml_g_file_query_default_handler_finish"

  (** Returns the #GAppInfo that is registered as the default
  application to handle the file specified by @file.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external query_default_handler : t -> Cancellable.t option -> (App_info_and__app_launch_context.App_info.t, GError.t) result = "ml_g_file_query_default_handler"

  (** Finishes a poll operation. See g_file_poll_mountable() for details.

  Finish an asynchronous poll operation that was polled
  with g_file_poll_mountable(). *)
  external poll_mountable_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_poll_mountable_finish"

  (** Exactly like g_file_get_path(), but caches the result via
  g_object_set_qdata_full().  This is useful for example in C
  applications which mix `g_file_*` APIs with native ones.  It
  also avoids an extra duplicated string when possible, so will be
  generally more efficient.

  This call does no blocking I/O. *)
  external peek_path : t -> string option = "ml_g_file_peek_path"

  (** Finishes an asynchronous file read operation started with
  g_file_open_readwrite_async(). *)
  external open_readwrite_finish : t -> Async_result.t -> (File_io_stream.t, GError.t) result = "ml_g_file_open_readwrite_finish"

  (** Opens an existing file for reading and writing. The result is
  a #GFileIOStream that can be used to read and write the contents
  of the file.

  If @cancellable is not %NULL, then the operation can be cancelled
  by triggering the cancellable object from another thread. If the
  operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
  returned.

  If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will
  be returned. If the file is a directory, the %G_IO_ERROR_IS_DIRECTORY
  error will be returned. Other errors are possible too, and depend on
  what kind of filesystem the file is on. Note that in many non-local
  file cases read and write streams are not supported, so make sure you
  really need to do read and write streaming, rather than just opening
  for reading or writing. *)
  external open_readwrite : t -> Cancellable.t option -> (File_io_stream.t, GError.t) result = "ml_g_file_open_readwrite"

  (** Finishes an asynchronous file movement, started with
  g_file_move_async(). *)
  external move_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_move_finish"

  (** Finishes a mount operation. See g_file_mount_mountable() for details.

  Finish an asynchronous mount operation that was started
  with g_file_mount_mountable(). *)
  external mount_mountable_finish : t -> Async_result.t -> (t, GError.t) result = "ml_g_file_mount_mountable_finish"

  (** Finishes a mount operation started by g_file_mount_enclosing_volume(). *)
  external mount_enclosing_volume_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_mount_enclosing_volume_finish"

  (** Obtains a file monitor for the given file. If no file notification
  mechanism exists, then regular polling of the file is used.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.

  If @flags contains %G_FILE_MONITOR_WATCH_HARD_LINKS then the monitor
  will also attempt to report changes made to the file via another
  filename (ie, a hard link). Without this flag, you can only rely on
  changes made through the filename contained in @file to be
  reported. Using this flag may result in an increase in resource
  usage, and may not have any effect depending on the #GFileMonitor
  backend and/or filesystem type. *)
  external monitor_file : t -> Gio_enums.filemonitorflags -> Cancellable.t option -> (File_monitor.t, GError.t) result = "ml_g_file_monitor_file"

  (** Obtains a directory monitor for the given file.
  This may fail if directory monitoring is not supported.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.

  It does not make sense for @flags to contain
  %G_FILE_MONITOR_WATCH_HARD_LINKS, since hard links can not be made to
  directories.  It is not possible to monitor all the files in a
  directory for changes made via hard links; if you want to do this then
  you must register individual watches with g_file_monitor(). *)
  external monitor_directory : t -> Gio_enums.filemonitorflags -> Cancellable.t option -> (File_monitor.t, GError.t) result = "ml_g_file_monitor_directory"

  (** Obtains a file or directory monitor for the given file,
  depending on the type of the file.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external monitor : t -> Gio_enums.filemonitorflags -> Cancellable.t option -> (File_monitor.t, GError.t) result = "ml_g_file_monitor"

  (** Finishes an asynchronous symbolic link creation, started with
  g_file_make_symbolic_link_async(). *)
  external make_symbolic_link_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_make_symbolic_link_finish"

  (** Creates a symbolic link named @file which contains the string
  @symlink_value.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external make_symbolic_link : t -> string -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_make_symbolic_link"

  (** Creates a directory and any parent directories that may not
  exist similar to 'mkdir -p'. If the file system does not support
  creating directories, this function will fail, setting @error to
  %G_IO_ERROR_NOT_SUPPORTED. If the directory itself already exists,
  this function will fail setting @error to %G_IO_ERROR_EXISTS, unlike
  the similar g_mkdir_with_parents().

  For a local #GFile the newly created directories will have the default
  (current) ownership and permissions of the current process.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external make_directory_with_parents : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_make_directory_with_parents"

  (** Finishes an asynchronous directory creation, started with
  g_file_make_directory_async(). *)
  external make_directory_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_make_directory_finish"

  (** Creates a directory. Note that this will only create a child directory
  of the immediate parent directory of the path or URI given by the #GFile.
  To recursively create directories, see g_file_make_directory_with_parents().
  This function will fail if the parent directory does not exist, setting
  @error to %G_IO_ERROR_NOT_FOUND. If the file system doesn't support
  creating directories, this function will fail, setting @error to
  %G_IO_ERROR_NOT_SUPPORTED.

  For a local #GFile the newly created directory will have the default
  (current) ownership and permissions of the current process.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external make_directory : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_make_directory"

  (** Checks to see if a file is native to the platform.

  A native file is one expressed in the platform-native filename format,
  e.g. "C:\Windows" or "/usr/bin/". This does not mean the file is local,
  as it might be on a locally mounted remote filesystem.

  On some systems non-native files may be available using the native
  filesystem via a userspace filesystem (FUSE), in these cases this call
  will return %FALSE, but g_file_get_path() will still return a native path.

  This call does no blocking I/O. *)
  external is_native : t -> bool = "ml_g_file_is_native"

  (** Creates a hash value for a #GFile.

  This call does no blocking I/O. *)
  external hash : t -> int = "ml_g_file_hash"

  (** Checks to see if a #GFile has a given URI scheme.

  This call does no blocking I/O. *)
  external has_uri_scheme : t -> string -> bool = "ml_g_file_has_uri_scheme"

  (** Checks whether @file has the prefix specified by @prefix.

  In other words, if the names of initial elements of @file's
  pathname match @prefix. Only full pathname elements are matched,
  so a path like /foo is not considered a prefix of /foobar, only
  of /foo/bar.

  A #GFile is not a prefix of itself. If you want to check for
  equality, use g_file_equal().

  This call does no I/O, as it works purely on names. As such it can
  sometimes return %FALSE even if @file is inside a @prefix (from a
  filesystem point of view), because the prefix of @file is an alias
  of @prefix. *)
  external has_prefix : t -> t -> bool = "ml_g_file_has_prefix"

  (** Checks if @file has a parent, and optionally, if it is @parent.

  If @parent is %NULL then this function returns %TRUE if @file has any
  parent at all.  If @parent is non-%NULL then %TRUE is only returned
  if @file is an immediate child of @parent. *)
  external has_parent : t -> t option -> bool = "ml_g_file_has_parent"

  (** Gets the URI scheme for a #GFile.
  RFC 3986 decodes the scheme as:
  |[
  URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
  ]|
  Common schemes include "file", "http", "ftp", etc.

  The scheme can be different from the one used to construct the #GFile,
  in that it might be replaced with one that is logically equivalent to the #GFile.

  This call does no blocking I/O. *)
  external get_uri_scheme : t -> string option = "ml_g_file_get_uri_scheme"

  (** Gets the URI for the @file.

  This call does no blocking I/O. *)
  external get_uri : t -> string = "ml_g_file_get_uri"

  (** Gets the parse name of the @file.
  A parse name is a UTF-8 string that describes the
  file such that one can get the #GFile back using
  g_file_parse_name().

  This is generally used to show the #GFile as a nice
  full-pathname kind of string in a user interface,
  like in a location entry.

  For local files with names that can safely be converted
  to UTF-8 the pathname is used, otherwise the IRI is used
  (a form of URI that allows UTF-8 characters unescaped).

  This call does no blocking I/O. *)
  external get_parse_name : t -> string = "ml_g_file_get_parse_name"

  (** Gets the parent directory for the @file.
  If the @file represents the root directory of the
  file system, then %NULL will be returned.

  This call does no blocking I/O. *)
  external get_parent : t -> t option = "ml_g_file_get_parent"

  (** Gets the child of @file for a given @display_name (i.e. a UTF-8
  version of the name). If this function fails, it returns %NULL
  and @error will be set. This is very useful when constructing a
  #GFile for a new file and the user entered the filename in the
  user interface, for instance when you select a directory and
  type a filename in the file selector.

  This call does no blocking I/O. *)
  external get_child_for_display_name : t -> string -> (t, GError.t) result = "ml_g_file_get_child_for_display_name"

  (** Gets a child of @file with basename equal to @name.

  Note that the file with that specific name might not exist, but
  you can still have a #GFile that points to it. You can use this
  for instance to create that file.

  This call does no blocking I/O. *)
  external get_child : t -> string -> t = "ml_g_file_get_child"

  (** Finishes an asynchronous find mount request.
  See g_file_find_enclosing_mount_async(). *)
  external find_enclosing_mount_finish : t -> Async_result.t -> (Mount.t, GError.t) result = "ml_g_file_find_enclosing_mount_finish"

  (** Gets a #GMount for the #GFile.

  #GMount is returned only for user interesting locations, see
  #GVolumeMonitor. If the #GFileIface for @file does not have a #mount,
  @error will be set to %G_IO_ERROR_NOT_FOUND and %NULL #will be returned.

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external find_enclosing_mount : t -> Cancellable.t option -> (Mount.t, GError.t) result = "ml_g_file_find_enclosing_mount"

  (** Checks if the two given #GFiles refer to the same file.

  Note that two #GFiles that differ can still refer to the same
  file on the filesystem due to various forms of filename
  aliasing.

  This call does no blocking I/O. *)
  external equal : t -> t -> bool = "ml_g_file_equal"

  (** Finishes an async enumerate children operation.
  See g_file_enumerate_children_async(). *)
  external enumerate_children_finish : t -> Async_result.t -> (File_enumerator.t, GError.t) result = "ml_g_file_enumerate_children_finish"

  (** Gets the requested information about the files in a directory.
  The result is a #GFileEnumerator object that will give out
  #GFileInfo objects for all the files in the directory.

  The @attributes value is a string that specifies the file
  attributes that should be gathered. It is not an error if
  it's not possible to read a particular requested attribute
  from a file - it just won't be set. @attributes should
  be a comma-separated list of attributes or attribute wildcards.
  The wildcard "*" means all attributes, and a wildcard like
  "standard::*" means all attributes in the standard namespace.
  An example attribute query be "standard::*,owner::user".
  The standard attributes are available as defines, like
  %G_FILE_ATTRIBUTE_STANDARD_NAME. %G_FILE_ATTRIBUTE_STANDARD_NAME should
  always be specified if you plan to call g_file_enumerator_get_child() or
  g_file_enumerator_iterate() on the returned enumerator.

  If @cancellable is not %NULL, then the operation can be cancelled
  by triggering the cancellable object from another thread. If the
  operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
  returned.

  If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will
  be returned. If the file is not a directory, the %G_IO_ERROR_NOT_DIRECTORY
  error will be returned. Other errors are possible too. *)
  external enumerate_children : t -> string -> Gio_enums.filequeryinfoflags -> Cancellable.t option -> (File_enumerator.t, GError.t) result = "ml_g_file_enumerate_children"

  (** Finishes an asynchronous eject operation started by
  g_file_eject_mountable_with_operation(). *)
  external eject_mountable_with_operation_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_eject_mountable_with_operation_finish"

  (** Finishes an asynchronous eject operation started by
  g_file_eject_mountable(). *)
  external eject_mountable_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_eject_mountable_finish"

  (** Duplicates a #GFile handle. This operation does not duplicate
  the actual file or directory represented by the #GFile; see
  g_file_copy() if attempting to copy a file.

  g_file_dup() is useful when a second handle is needed to the same underlying
  file, for use in a separate thread (#GFile is not thread-safe). For use
  within the same thread, use g_object_ref() to increment the existing object’s
  reference count.

  This call does no blocking I/O. *)
  external dup : t -> t = "ml_g_file_dup"

  (** Finishes deleting a file started with g_file_delete_async(). *)
  external delete_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_delete_finish"

  (** Deletes a file. If the @file is a directory, it will only be
  deleted if it is empty. This has the same semantics as g_unlink().

  If @file doesn’t exist, %G_IO_ERROR_NOT_FOUND will be returned. This allows
  for deletion to be implemented avoiding
  [time-of-check to time-of-use races](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use):
  |[
  g_autoptr(GError) local_error = NULL;
  if (!g_file_delete (my_file, my_cancellable, &local_error) &&
      !g_error_matches (local_error, G_IO_ERROR, G_IO_ERROR_NOT_FOUND))
    {
      // deletion failed for some reason other than the file not existing:
      // so report the error
      g_warning ("Failed to delete %s: %s",
                 g_file_peek_path (my_file), local_error->message);
    }
  ]|

  If @cancellable is not %NULL, then the operation can be cancelled by
  triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
  external delete : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_delete"

  (** Finishes an asynchronous file create operation started with
  g_file_create_readwrite_async(). *)
  external create_readwrite_finish : t -> Async_result.t -> (File_io_stream.t, GError.t) result = "ml_g_file_create_readwrite_finish"

  (** Creates a new file and returns a stream for reading and
  writing to it. The file must not already exist.

  By default files created are generally readable by everyone,
  but if you pass %G_FILE_CREATE_PRIVATE in @flags the file
  will be made readable only to the current user, to the level
  that is supported on the target filesystem.

  If @cancellable is not %NULL, then the operation can be cancelled
  by triggering the cancellable object from another thread. If the
  operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
  returned.

  If a file or directory with this name already exists, the
  %G_IO_ERROR_EXISTS error will be returned. Some file systems don't
  allow all file names, and may return an %G_IO_ERROR_INVALID_FILENAME
  error, and if the name is too long, %G_IO_ERROR_FILENAME_TOO_LONG
  will be returned. Other errors are possible too, and depend on what
  kind of filesystem the file is on.

  Note that in many non-local file cases read and write streams are
  not supported, so make sure you really need to do read and write
  streaming, rather than just opening for reading or writing. *)
  external create_readwrite : t -> Gio_enums.filecreateflags -> Cancellable.t option -> (File_io_stream.t, GError.t) result = "ml_g_file_create_readwrite"

  (** Finishes an asynchronous file create operation started with
  g_file_create_async(). *)
  external create_finish : t -> Async_result.t -> (File_output_stream.t, GError.t) result = "ml_g_file_create_finish"

  (** Creates a new file and returns an output stream for writing to it.
  The file must not already exist.

  By default files created are generally readable by everyone,
  but if you pass %G_FILE_CREATE_PRIVATE in @flags the file
  will be made readable only to the current user, to the level
  that is supported on the target filesystem.

  If @cancellable is not %NULL, then the operation can be cancelled
  by triggering the cancellable object from another thread. If the
  operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
  returned.

  If a file or directory with this name already exists the
  %G_IO_ERROR_EXISTS error will be returned. Some file systems don't
  allow all file names, and may return an %G_IO_ERROR_INVALID_FILENAME
  error, and if the name is to long %G_IO_ERROR_FILENAME_TOO_LONG will
  be returned. Other errors are possible too, and depend on what kind
  of filesystem the file is on. *)
  external create : t -> Gio_enums.filecreateflags -> Cancellable.t option -> (File_output_stream.t, GError.t) result = "ml_g_file_create"

  (** Finishes copying the file started with g_file_copy_async(). *)
  external copy_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_copy_finish"

  (** Copies the file attributes from @source to @destination.

  Normally only a subset of the file attributes are copied,
  those that are copies in a normal file copy operation
  (which for instance does not include e.g. owner). However
  if %G_FILE_COPY_ALL_METADATA is specified in @flags, then
  all the metadata that is possible to copy is copied. This
  is useful when implementing move by copy + delete source. *)
  external copy_attributes : t -> t -> Gio_enums.filecopyflags -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_copy_attributes"

  (** Prepares the file attribute query string for copying to @file.

  This function prepares an attribute query string to be
  passed to g_file_query_info() to get a list of attributes
  normally copied with the file (see g_file_copy_attributes()
  for the detailed description). This function is used by the
  implementation of g_file_copy_attributes() and is useful
  when one needs to query and set the attributes in two
  stages (e.g., for recursive move of a directory). *)
  external build_attribute_list_for_copy : t -> Gio_enums.filecopyflags -> Cancellable.t option -> (string, GError.t) result = "ml_g_file_build_attribute_list_for_copy"

  (** Finishes an asynchronous file append operation started with
  g_file_append_to_async(). *)
  external append_to_finish : t -> Async_result.t -> (File_output_stream.t, GError.t) result = "ml_g_file_append_to_finish"

  (** Gets an output stream for appending data to the file.
  If the file doesn't already exist it is created.

  By default files created are generally readable by everyone,
  but if you pass %G_FILE_CREATE_PRIVATE in @flags the file
  will be made readable only to the current user, to the level that
  is supported on the target filesystem.

  If @cancellable is not %NULL, then the operation can be cancelled
  by triggering the cancellable object from another thread. If the
  operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
  returned.

  Some file systems don't allow all file names, and may return an
  %G_IO_ERROR_INVALID_FILENAME error. If the file is a directory the
  %G_IO_ERROR_IS_DIRECTORY error will be returned. Other errors are
  possible too, and depend on what kind of filesystem the file is on. *)
  external append_to : t -> Gio_enums.filecreateflags -> Cancellable.t option -> (File_output_stream.t, GError.t) result = "ml_g_file_append_to"


end

and File_enumerator
 : sig
  type t = [`file_enumerator | `object_] Gobject.obj

  (* Methods *)
  (** Sets the file enumerator as having pending operations. *)
  external set_pending : t -> bool -> unit = "ml_g_file_enumerator_set_pending"

  (** Returns information for the next file in the enumerated object.
  Will block until the information is available. The #GFileInfo
  returned from this function will contain attributes that match the
  attribute string that was passed when the #GFileEnumerator was created.

  See the documentation of #GFileEnumerator for information about the
  order of returned files.

  On error, returns %NULL and sets @error to the error. If the
  enumerator is at the end, %NULL will be returned and @error will
  be unset. *)
  external next_file : t -> Cancellable.t option -> (File_info.t option, GError.t) result = "ml_g_file_enumerator_next_file"

  (** Checks if the file enumerator has been closed. *)
  external is_closed : t -> bool = "ml_g_file_enumerator_is_closed"

  (** Checks if the file enumerator has pending operations. *)
  external has_pending : t -> bool = "ml_g_file_enumerator_has_pending"

  (** Get the #GFile container which is being enumerated. *)
  external get_container : t -> File.t = "ml_g_file_enumerator_get_container"

  (** Return a new #GFile which refers to the file named by @info in the source
  directory of @enumerator.  This function is primarily intended to be used
  inside loops with g_file_enumerator_next_file().

  To use this, %G_FILE_ATTRIBUTE_STANDARD_NAME must have been listed in the
  attributes list used when creating the #GFileEnumerator.

  This is a convenience method that's equivalent to:
  |[<!-- language="C" -->
    gchar *name = g_file_info_get_name (info);
    GFile *child = g_file_get_child (g_file_enumerator_get_container (enumr),
                                     name);
  ]| *)
  external get_child : t -> File_info.t -> File.t = "ml_g_file_enumerator_get_child"

  (** Finishes closing a file enumerator, started from g_file_enumerator_close_async().

  If the file enumerator was already closed when g_file_enumerator_close_async()
  was called, then this function will report %G_IO_ERROR_CLOSED in @error, and
  return %FALSE. If the file enumerator had pending operation when the close
  operation was started, then this function will report %G_IO_ERROR_PENDING, and
  return %FALSE.  If @cancellable was not %NULL, then the operation may have been
  cancelled by triggering the cancellable object from another thread. If the operation
  was cancelled, the error %G_IO_ERROR_CANCELLED will be set, and %FALSE will be
  returned. *)
  external close_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_file_enumerator_close_finish"

  (** Releases all resources used by this enumerator, making the
  enumerator return %G_IO_ERROR_CLOSED on all calls.

  This will be automatically called when the last reference
  is dropped, but you might want to call this function to make
  sure resources are released as early as possible. *)
  external close : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_file_enumerator_close"

  (* Properties *)


end

and File_monitor
 : sig
  type t = [`file_monitor | `object_] Gobject.obj

  (* Methods *)
  (** Sets the rate limit to which the @monitor will report
  consecutive change events to the same file. *)
  external set_rate_limit : t -> int -> unit = "ml_g_file_monitor_set_rate_limit"

  (** Returns whether the monitor is canceled. *)
  external is_cancelled : t -> bool = "ml_g_file_monitor_is_cancelled"

  (** Emits the #GFileMonitor::changed signal if a change
  has taken place. Should be called from file monitor
  implementations only.

  Implementations are responsible to call this method from the
  [thread-default main context][g-main-context-push-thread-default] of the
  thread that the monitor was created in. *)
  external emit_event : t -> File.t -> File.t -> Gio_enums.filemonitorevent -> unit = "ml_g_file_monitor_emit_event"

  (** Cancels a file monitor. *)
  external cancel : t -> bool = "ml_g_file_monitor_cancel"

  (* Properties *)

  (** Get property: cancelled *)
  external get_cancelled : t -> bool = "ml_gtk_file_monitor_get_cancelled"


end

and Mount
 : sig
  type t = [`mount] Gobject.obj

  (* Methods *)
  (** Decrements the shadow count on @mount. Usually used by
  #GVolumeMonitor implementations when destroying a shadow mount for
  @mount, see g_mount_is_shadowed() for more information. The caller
  will need to emit the #GMount::changed signal on @mount manually. *)
  external unshadow : t -> unit = "ml_g_mount_unshadow"

  (** Finishes unmounting a mount. If any errors occurred during the operation,
  @error will be set to contain the errors and %FALSE will be returned. *)
  external unmount_with_operation_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_mount_unmount_with_operation_finish"

  (** Finishes unmounting a mount. If any errors occurred during the operation,
  @error will be set to contain the errors and %FALSE will be returned. *)
  external unmount_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_mount_unmount_finish"

  (** Increments the shadow count on @mount. Usually used by
  #GVolumeMonitor implementations when creating a shadow mount for
  @mount, see g_mount_is_shadowed() for more information. The caller
  will need to emit the #GMount::changed signal on @mount manually. *)
  external shadow : t -> unit = "ml_g_mount_shadow"

  (** Finishes remounting a mount. If any errors occurred during the operation,
  @error will be set to contain the errors and %FALSE will be returned. *)
  external remount_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_mount_remount_finish"

  (** Determines if @mount is shadowed. Applications or libraries should
  avoid displaying @mount in the user interface if it is shadowed.

  A mount is said to be shadowed if there exists one or more user
  visible objects (currently #GMount objects) with a root that is
  inside the root of @mount.

  One application of shadow mounts is when exposing a single file
  system that is used to address several logical volumes. In this
  situation, a #GVolumeMonitor implementation would create two
  #GVolume objects (for example, one for the camera functionality of
  the device and one for a SD card reader on the device) with
  activation URIs `gphoto2://[usb:001,002]/store1/`
  and `gphoto2://[usb:001,002]/store2/`. When the
  underlying mount (with root
  `gphoto2://[usb:001,002]/`) is mounted, said
  #GVolumeMonitor implementation would create two #GMount objects
  (each with their root matching the corresponding volume activation
  root) that would shadow the original mount.

  The proxy monitor in GVfs 2.26 and later, automatically creates and
  manage shadow mounts (and shadows the underlying mount) if the
  activation root on a #GVolume is set. *)
  external is_shadowed : t -> bool = "ml_g_mount_is_shadowed"

  (** Tries to guess the type of content stored on @mount. Returns one or
  more textual identifiers of well-known content types (typically
  prefixed with "x-content/"), e.g. x-content/image-dcf for camera
  memory cards. See the
  [shared-mime-info](http://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec)
  specification for more on x-content types.

  This is a synchronous operation and as such may block doing IO;
  see g_mount_guess_content_type() for the asynchronous version. *)
  external guess_content_type_sync : t -> bool -> Cancellable.t option -> (string array, GError.t) result = "ml_g_mount_guess_content_type_sync"

  (** Finishes guessing content types of @mount. If any errors occurred
  during the operation, @error will be set to contain the errors and
  %FALSE will be returned. In particular, you may get an
  %G_IO_ERROR_NOT_SUPPORTED if the mount does not support content
  guessing. *)
  external guess_content_type_finish : t -> Async_result.t -> (string array, GError.t) result = "ml_g_mount_guess_content_type_finish"

  (** Gets the volume for the @mount. *)
  external get_volume : t -> Volume.t option = "ml_g_mount_get_volume"

  (** Gets the UUID for the @mount. The reference is typically based on
  the file system UUID for the mount in question and should be
  considered an opaque string. Returns %NULL if there is no UUID
  available. *)
  external get_uuid : t -> string option = "ml_g_mount_get_uuid"

  (** Gets the symbolic icon for @mount. *)
  external get_symbolic_icon : t -> Icon.t = "ml_g_mount_get_symbolic_icon"

  (** Gets the sort key for @mount, if any. *)
  external get_sort_key : t -> string option = "ml_g_mount_get_sort_key"

  (** Gets the root directory on @mount. *)
  external get_root : t -> File.t = "ml_g_mount_get_root"

  (** Gets the name of @mount. *)
  external get_name : t -> string = "ml_g_mount_get_name"

  (** Gets the icon for @mount. *)
  external get_icon : t -> Icon.t = "ml_g_mount_get_icon"

  (** Gets the drive for the @mount.

  This is a convenience method for getting the #GVolume and then
  using that object to get the #GDrive. *)
  external get_drive : t -> Drive.t option = "ml_g_mount_get_drive"

  (** Gets the default location of @mount. The default location of the given
  @mount is a path that reflects the main entry point for the user (e.g.
  the home directory, or the root of the volume). *)
  external get_default_location : t -> File.t = "ml_g_mount_get_default_location"

  (** Finishes ejecting a mount. If any errors occurred during the operation,
  @error will be set to contain the errors and %FALSE will be returned. *)
  external eject_with_operation_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_mount_eject_with_operation_finish"

  (** Finishes ejecting a mount. If any errors occurred during the operation,
  @error will be set to contain the errors and %FALSE will be returned. *)
  external eject_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_mount_eject_finish"

  (** Checks if @mount can be unmounted. *)
  external can_unmount : t -> bool = "ml_g_mount_can_unmount"

  (** Checks if @mount can be ejected. *)
  external can_eject : t -> bool = "ml_g_mount_can_eject"


end

and Volume
 : sig
  type t = [`volume] Gobject.obj

  (* Methods *)
  (** Returns whether the volume should be automatically mounted. *)
  external should_automount : t -> bool = "ml_g_volume_should_automount"

  (** Finishes mounting a volume. If any errors occurred during the operation,
  @error will be set to contain the errors and %FALSE will be returned.

  If the mount operation succeeded, g_volume_get_mount() on @volume
  is guaranteed to return the mount right after calling this
  function; there's no need to listen for the 'mount-added' signal on
  #GVolumeMonitor. *)
  external mount_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_volume_mount_finish"

  (** Gets the UUID for the @volume. The reference is typically based on
  the file system UUID for the volume in question and should be
  considered an opaque string. Returns %NULL if there is no UUID
  available. *)
  external get_uuid : t -> string option = "ml_g_volume_get_uuid"

  (** Gets the symbolic icon for @volume. *)
  external get_symbolic_icon : t -> Icon.t = "ml_g_volume_get_symbolic_icon"

  (** Gets the sort key for @volume, if any. *)
  external get_sort_key : t -> string option = "ml_g_volume_get_sort_key"

  (** Gets the name of @volume. *)
  external get_name : t -> string = "ml_g_volume_get_name"

  (** Gets the mount for the @volume. *)
  external get_mount : t -> Mount.t option = "ml_g_volume_get_mount"

  (** Gets the identifier of the given kind for @volume.
  See the [introduction](#volume-identifiers) for more
  information about volume identifiers. *)
  external get_identifier : t -> string -> string option = "ml_g_volume_get_identifier"

  (** Gets the icon for @volume. *)
  external get_icon : t -> Icon.t = "ml_g_volume_get_icon"

  (** Gets the drive for the @volume. *)
  external get_drive : t -> Drive.t option = "ml_g_volume_get_drive"

  (** Gets the activation root for a #GVolume if it is known ahead of
  mount time. Returns %NULL otherwise. If not %NULL and if @volume
  is mounted, then the result of g_mount_get_root() on the
  #GMount object obtained from g_volume_get_mount() will always
  either be equal or a prefix of what this function returns. In
  other words, in code

  |[<!-- language="C" -->
    GMount *mount;
    GFile *mount_root
    GFile *volume_activation_root;

    mount = g_volume_get_mount (volume); // mounted, so never NULL
    mount_root = g_mount_get_root (mount);
    volume_activation_root = g_volume_get_activation_root (volume); // assume not NULL
  ]|
  then the expression
  |[<!-- language="C" -->
    (g_file_has_prefix (volume_activation_root, mount_root) ||
     g_file_equal (volume_activation_root, mount_root))
  ]|
  will always be %TRUE.

  Activation roots are typically used in #GVolumeMonitor
  implementations to find the underlying mount to shadow, see
  g_mount_is_shadowed() for more details. *)
  external get_activation_root : t -> File.t option = "ml_g_volume_get_activation_root"

  (** Gets the kinds of [identifiers](#volume-identifiers) that @volume has.
  Use g_volume_get_identifier() to obtain the identifiers themselves. *)
  external enumerate_identifiers : t -> string array = "ml_g_volume_enumerate_identifiers"

  (** Finishes ejecting a volume. If any errors occurred during the operation,
  @error will be set to contain the errors and %FALSE will be returned. *)
  external eject_with_operation_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_volume_eject_with_operation_finish"

  (** Finishes ejecting a volume. If any errors occurred during the operation,
  @error will be set to contain the errors and %FALSE will be returned. *)
  external eject_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_volume_eject_finish"

  (** Checks if a volume can be mounted. *)
  external can_mount : t -> bool = "ml_g_volume_can_mount"

  (** Checks if a volume can be ejected. *)
  external can_eject : t -> bool = "ml_g_volume_can_eject"


end
