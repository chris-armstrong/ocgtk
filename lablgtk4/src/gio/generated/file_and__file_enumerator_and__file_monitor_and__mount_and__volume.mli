(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec File : sig
  type t = [`file] Gobject.obj

  (* Methods *)
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

  (** Increments the shadow count on @mount. Usually used by
  #GVolumeMonitor implementations when creating a shadow mount for
  @mount, see g_mount_is_shadowed() for more information. The caller
  will need to emit the #GMount::changed signal on @mount manually. *)
  external shadow : t -> unit = "ml_g_mount_shadow"

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

  (** Gets the UUID for the @mount. The reference is typically based on
  the file system UUID for the mount in question and should be
  considered an opaque string. Returns %NULL if there is no UUID
  available. *)
  external get_uuid : t -> string option = "ml_g_mount_get_uuid"

  (** Gets the sort key for @mount, if any. *)
  external get_sort_key : t -> string option = "ml_g_mount_get_sort_key"

  (** Gets the name of @mount. *)
  external get_name : t -> string = "ml_g_mount_get_name"

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

  (** Gets the UUID for the @volume. The reference is typically based on
  the file system UUID for the volume in question and should be
  considered an opaque string. Returns %NULL if there is no UUID
  available. *)
  external get_uuid : t -> string option = "ml_g_volume_get_uuid"

  (** Gets the sort key for @volume, if any. *)
  external get_sort_key : t -> string option = "ml_g_volume_get_sort_key"

  (** Gets the name of @volume. *)
  external get_name : t -> string = "ml_g_volume_get_name"

  (** Gets the identifier of the given kind for @volume.
  See the [introduction](#volume-identifiers) for more
  information about volume identifiers. *)
  external get_identifier : t -> string -> string option = "ml_g_volume_get_identifier"

  (** Checks if a volume can be mounted. *)
  external can_mount : t -> bool = "ml_g_volume_can_mount"

  (** Checks if a volume can be ejected. *)
  external can_eject : t -> bool = "ml_g_volume_can_eject"


end
