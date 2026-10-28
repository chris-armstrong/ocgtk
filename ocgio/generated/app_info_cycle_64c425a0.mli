(** The classes of {!Ocgio.App_info}, {!Ocgio.App_launch_context},
    {!Ocgio.Drive}, {!Ocgio.File}, {!Ocgio.File_enumerator},
    {!Ocgio.File_monitor}, {!Ocgio.Mount}, {!Ocgio.Volume}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

class type app_info_t = object
  (** {2:methods Methods} *)

  method add_supports_type : string -> (bool, GError.t) result
  (** Adds a content type to the application information to indicate the
      application is capable of opening files with the given content type. *)

  method can_delete : unit -> bool
  (** Obtains the information whether the [Gio.AppInfo] can be deleted. See
      [Gio.AppInfo.delete]. *)

  method can_remove_supports_type : unit -> bool
  (** Checks if a supported content type can be removed from an application. *)

  method delete : unit -> bool
  (** Tries to delete a [Gio.AppInfo].

      On some platforms, there may be a difference between user-defined
      [Gio.AppInfo]s which can be deleted, and system-wide ones which cannot.
      See [Gio.AppInfo.can_delete]. *)

  method dup : unit -> app_info_t
  (** Creates a duplicate of a [Gio.AppInfo]. *)

  method equal : app_info_t -> bool
  (** Checks if two [Gio.AppInfo]s are equal.

      Note that the check {i may not} compare each individual field, and only
      does an identity check. In case detecting changes in the contents is
      needed, program code must additionally compare relevant fields. *)

  method get_commandline : unit -> string option
  (** Gets the commandline with which the application will be started. *)

  method get_description : unit -> string option
  (** Gets a human-readable description of an installed application. *)

  method get_display_name : unit -> string
  (** Gets the display name of the application. The display name is often more
      descriptive to the user than the name itself. *)

  method get_executable : unit -> string
  (** Gets the executable’s name for the installed application.

      This is intended to be used for debugging or labelling what program is
      going to be run. To launch the executable, use [Gio.AppInfo.launch] and
      related functions, rather than spawning the return value from this
      function. *)

  method get_icon : unit -> Icon.icon_t option
  (** Gets the icon for the application. *)

  method get_id : unit -> string option
  (** Gets the ID of an application. An id is a string that identifies the
      application. The exact format of the id is platform dependent. For
      instance, on Unix this is the desktop file id from the xdg menu
      specification.

      Note that the returned ID may be [None], depending on how the [appinfo]
      has been constructed. *)

  method get_name : unit -> string
  (** Gets the installed name of the application. *)

  method get_supported_types : unit -> string array
  (** Retrieves the list of content types that [app_info] claims to support. If
      this information is not provided by the environment, this function will
      return [None].

      This function does not take in consideration associations added with
      [Gio.AppInfo.add_supports_type], but only those exported directly by the
      application. *)

  method launch :
    file_t list option -> app_launch_context_t option -> (bool, GError.t) result
  (** Launches the application. Passes [files] to the launched application as
      arguments, using the optional [context] to get information about the
      details of the launcher (like what screen it is on). On error, [error]
      will be set accordingly.

      To launch the application without arguments pass a [None] [files] list.

      Note that even if the launch is successful the application launched can
      fail to start if it runs into problems during startup. There is no way to
      detect this.

      Some URIs can be changed when passed through a GFile (for instance
      unsupported URIs with strange formats like mailto:), so if you have a
      textual URI you want to pass in as argument, consider using
      [Gio.AppInfo.launch_uris] instead.

      The launched application inherits the environment of the launching
      process, but it can be modified with [Gio.AppLaunchContext.setenv] and
      [Gio.AppLaunchContext.unsetenv].

      On UNIX, this function sets the [GIO_LAUNCHED_DESKTOP_FILE] environment
      variable with the path of the launched desktop file and
      [GIO_LAUNCHED_DESKTOP_FILE_PID] to the process id of the launched process.
      This can be used to ignore [GIO_LAUNCHED_DESKTOP_FILE], should it be
      inherited by further processes. The [DISPLAY], [XDG_ACTIVATION_TOKEN] and
      [DESKTOP_STARTUP_ID] environment variables are also set, based on
      information provided in [context]. *)

  method launch_uris :
    string list option -> app_launch_context_t option -> (bool, GError.t) result
  (** Launches the application. This passes the [uris] to the launched
      application as arguments, using the optional [context] to get information
      about the details of the launcher (like what screen it is on). On error,
      [error] will be set accordingly. If the application only supports one URI
      per invocation as part of their command-line, multiple instances of the
      application will be spawned.

      To launch the application without arguments pass a [None] [uris] list.

      Note that even if the launch is successful the application launched can
      fail to start if it runs into problems during startup. There is no way to
      detect this. *)

  method launch_uris_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes a [Gio.AppInfo.launch_uris_async] operation. *)

  method remove_supports_type : string -> (bool, GError.t) result
  (** Removes a supported type from an application, if possible. *)

  method set_as_default_for_extension : string -> (bool, GError.t) result
  (** Sets the application as the default handler for the given file extension.
  *)

  method set_as_default_for_type : string -> (bool, GError.t) result
  (** Sets the application as the default handler for a given type. *)

  method set_as_last_used_for_type : string -> (bool, GError.t) result
  (** Sets the application as the last used application for a given type. This
      will make the application appear as first in the list returned by
      [Gio.AppInfo.get_recommended_for_type], regardless of the default
      application for that content type. *)

  method should_show : unit -> bool
  (** Checks if the application info should be shown in menus that list
      available applications. *)

  method supports_files : unit -> bool
  (** Checks if the application accepts files as arguments. *)

  method supports_uris : unit -> bool
  (** Checks if the application supports reading files and directories from
      URIs. *)

  (** {2:conversions Conversions} *)

  method as_app_info : Raw.App_info.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [AppInfo].}\n\n\
     Information about an installed application and methods to launch\n\
     it (with file arguments).\n\n\
     [GAppInfo] and [GAppLaunchContext] are used for describing and launching\n\
     applications installed on the system.\n\n\
     As of GLib 2.20, URIs will always be converted to POSIX paths\n\
     (using [Gio.File.get_path]) when using [Gio.AppInfo.launch]\n\
     even if the application requested an URI and not a POSIX path. For example\n\
     for a desktop-file based application with the following Exec key:\n\n\
     {[\n\
     Exec=totem %U\n\
     ]}\n\n\
     and a single URI, [sftp://foo/file.avi], then\n\
     [/home/user/.gvfs/sftp on foo/file.avi] will be passed. This will only work\n\
     if a set of suitable GIO extensions (such as GVfs 2.26 compiled with FUSE\n\
     support), is available and operational; if this is not the case, the URI\n\
     will be passed unmodified to the application. Some URIs, such as [mailto:],\n\
     of course cannot be mapped to a POSIX path (in GVfs there’s no FUSE mount\n\
     for it); such URIs will be passed unmodified to the application.\n\n\
     Specifically for GVfs 2.26 and later, the POSIX URI will be mapped\n\
     back to the GIO URI in the [Gio.File] constructors (since GVfs\n\
     implements the GVfs extension point). As such, if the application\n\
     needs to examine the URI, it needs to use [Gio.File.get_uri]\n\
     or similar on [Gio.File]. In other words, an application cannot\n\
     assume that the URI passed to e.g. [Gio.File.new_for_commandline_arg]\n\
     is equal to the result of [Gio.File.get_uri]. The following snippet\n\
     illustrates this:\n\n\
     {[\n\
     GFile *f;\n\
     char *uri;\n\n\
     file = g_file_new_for_commandline_arg (uri_from_commandline);\n\n\
     uri = g_file_get_uri (file);\n\
     strcmp (uri, uri_from_commandline) == 0;\n\
     g_free (uri);\n\n\
     if (g_file_has_uri_scheme (file, \"cdda\"))\n\
    \  {\n\
    \    // do something special with uri\n\
    \  }\n\
     g_object_unref (file);\n\
     ]}\n\n\
     This code will work when both [cdda://sr0/Track 1.wav] and\n\
     [/home/user/.gvfs/cdda on sr0/Track 1.wav] is passed to the\n\
     application. It should be noted that it’s generally not safe\n\
     for applications to rely on the format of a particular URIs.\n\
     Different launcher applications (e.g. file managers) may have\n\
     different ideas of what a given URI means."]

(** {b The methods, signals and properties of a [AppLaunchContext].}

    Integrating the launch with the launching application. This is used to
    handle for instance startup notification and launching the new application
    on the same screen as the launching window. *)
and app_launch_context_t = object
  (** {2:signals Signals} *)

  method on_launch_failed :
    ?after:bool ->
    callback:(startup_notify_id:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** The [Gio.AppLaunchContext::launch-failed] signal is emitted when a
      [Gio.AppInfo] launch fails. The startup notification id is provided, so
      that the launcher can cancel the startup notification.

      Because a launch operation may involve spawning multiple instances of the
      target application, you should expect this signal to be emitted multiple
      times, one for each spawned instance. *)

  method on_launch_started :
    ?after:bool ->
    callback:(info:app_info_t -> platform_data:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** The [Gio.AppLaunchContext::launch-started] signal is emitted when a
      [Gio.AppInfo] is about to be launched. If non-null the [platform_data] is
      an GVariant dictionary mapping strings to variants (ie [a{sv}]), which
      contains additional, platform-specific data about this launch. On UNIX, at
      least the [startup-notification-id] keys will be present.

      The value of the [startup-notification-id] key (type [s]) is a startup
      notification ID corresponding to the format from the
      \[startup-notification
      specification\](https://specifications.freedesktop.org/startup-notification-spec/startup-notification-0.1.txt).
      It allows tracking the progress of the launchee through startup.

      It is guaranteed that this signal is followed by either a
      [Gio.AppLaunchContext::launched] or [Gio.AppLaunchContext::launch-failed]
      signal.

      Because a launch operation may involve spawning multiple instances of the
      target application, you should expect this signal to be emitted multiple
      times, one for each spawned instance. *)

  method on_launched :
    ?after:bool ->
    callback:(info:app_info_t -> platform_data:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** The [Gio.AppLaunchContext::launched] signal is emitted when a
      [Gio.AppInfo] is successfully launched.

      Because a launch operation may involve spawning multiple instances of the
      target application, you should expect this signal to be emitted multiple
      times, one time for each spawned instance.

      The [platform_data] is an GVariant dictionary mapping strings to variants
      (ie [a{sv}]), which contains additional, platform-specific data about this
      launch. On UNIX, at least the [pid] and [startup-notification-id] keys
      will be present.

      Since 2.72 the [pid] may be 0 if the process id wasn’t known (for example
      if the process was launched via D-Bus). The [pid] may not be set at all in
      subsequent releases.

      On Windows, [pid] is guaranteed to be valid only for the duration of the
      [Gio.AppLaunchContext::launched] signal emission; after the signal is
      emitted, GLib will call [GLib.spawn_close_pid]. If you need to keep the
      [GLib.Pid] after the signal has been emitted, then you can duplicate [pid]
      using [DuplicateHandle()]. *)

  (** {2:methods Methods} *)

  method get_display : app_info_t -> file_t list -> string option
  (** Gets the display string for the [context]. This is used to ensure new
      applications are started on the same display as the launching application,
      by setting the [DISPLAY] environment variable. *)

  method get_environment : unit -> string array
  (** Gets the complete environment variable list to be passed to the child
      process when [context] is used to launch an application. This is a
      null-terminated array of strings, where each string has the form
      [KEY=VALUE]. *)

  method get_startup_notify_id :
    app_info_t option -> file_t list option -> string option
  (** Initiates startup notification for the application and returns the
      [XDG_ACTIVATION_TOKEN] or [DESKTOP_STARTUP_ID] for the launched operation,
      if supported.

      The returned token may be referred to equivalently as an ‘activation
      token’ (using Wayland terminology) or a ‘startup sequence ID’ (using X11
      terminology). The two
      {{:https://gitlab.freedesktop.org/wayland/wayland-protocols/-/blob/main/staging/xdg-activation/x11-interoperation.rst}are
       interoperable}.

      Activation tokens are defined in the
      {{:https://wayland.app/protocols/xdg-activation-v1}XDG Activation
       Protocol}, and startup notification IDs are defined in the
      freedesktop.org Startup Notification Protocol.

      Support for the XDG Activation Protocol was added in GLib 2.76. Since GLib
      2.82 [info] and [files] can be [None]. If that’s not supported by the
      backend, the returned token will be [None]. *)

  method launch_failed : string -> unit
  (** Called when an application has failed to launch, so that it can cancel the
      application startup notification started in
      [Gio.AppLaunchContext.get_startup_notify_id]. *)

  method setenv : string -> string -> unit
  (** Arranges for [variable] to be set to [value] in the child’s environment
      when [context] is used to launch an application. *)

  method unsetenv : string -> unit
  (** Arranges for [variable] to be unset in the child’s environment when
      [context] is used to launch an application. *)

  (** {2:conversions Conversions} *)

  method as_app_launch_context : Raw.App_launch_context.t
end

(** {b The methods, signals and properties of a [Drive].}

    [GDrive] represents a piece of hardware connected to the machine. It’s
    generally only created for removable hardware or hardware with removable
    media. For example, an optical disc drive, or a USB flash drive.

    [GDrive] is a container class for [Gio.Volume] objects that stem from the
    same piece of media. As such, [GDrive] abstracts a drive with (or without)
    removable media and provides operations for querying whether media is
    available, determining whether media change is automatically detected and
    ejecting the media.

    If the [GDrive] reports that media isn’t automatically detected, one can
    poll for media; typically one should not do this periodically as a poll for
    media operation is potentially expensive and may spin up the drive creating
    noise.

    [GDrive] supports starting and stopping drives with authentication support
    for the former. This can be used to support a diverse set of use cases
    including connecting/disconnecting iSCSI devices, powering down external
    disk enclosures and starting/stopping multi-disk devices such as RAID
    devices. Note that the actual semantics and side-effects of
    starting/stopping a [GDrive] may vary according to implementation. To choose
    the correct verbs in e.g. a file manager, use
    [Gio.Drive.get_start_stop_type].

    For porting from GnomeVFS note that there is no equivalent of [GDrive] in
    that API. *)
and drive_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the drive's state has changed. *)

  method on_disconnected :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal is emitted when the [GDrive] have been disconnected. If the
      recipient is holding references to the object they should release them so
      the object can be finalized. *)

  method on_eject_button :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the physical eject button (if any) of a drive has been
      pressed. *)

  method on_stop_button :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the physical stop button (if any) of a drive has been
      pressed. *)

  (** {2:methods Methods} *)

  method can_eject : unit -> bool
  (** Checks if a drive can be ejected. *)

  method can_poll_for_media : unit -> bool
  (** Checks if a drive can be polled for media changes. *)

  method can_start : unit -> bool
  (** Checks if a drive can be started. *)

  method can_start_degraded : unit -> bool
  (** Checks if a drive can be started degraded. *)

  method can_stop : unit -> bool
  (** Checks if a drive can be stopped. *)

  method eject_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes ejecting a drive. *)

  method eject_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes ejecting a drive. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned. *)

  method enumerate_identifiers : unit -> string array
  (** Gets the kinds of identifiers that [drive] has. Use
      g_drive_get_identifier() to obtain the identifiers themselves. *)

  method get_icon : unit -> Icon.icon_t
  (** Gets the icon for [drive]. *)

  method get_identifier : string -> string option
  (** Gets the identifier of the given kind for [drive]. The only identifier
      currently available is [G_DRIVE_IDENTIFIER_KIND_UNIX_DEVICE]. *)

  method get_name : unit -> string
  (** Gets the name of [drive]. *)

  method get_sort_key : unit -> string option
  (** Gets the sort key for [drive], if any. *)

  method get_start_stop_type : unit -> Enums.drivestartstoptype
  (** Gets a hint about how a drive can be started/stopped. *)

  method get_symbolic_icon : unit -> Icon.icon_t
  (** Gets the icon for [drive]. *)

  method get_volumes : unit -> volume_t list
  (** Get a list of mountable volumes for [drive]. *)

  method has_media : unit -> bool
  (** Checks if the [drive] has media. Note that the OS may not be polling the
      drive for media changes; see g_drive_is_media_check_automatic() for more
      details. *)

  method has_volumes : unit -> bool
  (** Check if [drive] has any mountable volumes. *)

  method is_media_check_automatic : unit -> bool
  (** Checks if [drive] is capable of automatically detecting media changes. *)

  method is_media_removable : unit -> bool
  (** Checks if the [drive] supports removable media. *)

  method is_removable : unit -> bool
  (** Checks if the [GDrive] and/or its media is considered removable by the
      user. See g_drive_is_media_removable(). *)

  method poll_for_media_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an operation started with g_drive_poll_for_media() on a drive. *)

  method start_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes starting a drive. *)

  method stop_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes stopping a drive. *)

  (** {2:conversions Conversions} *)

  method as_drive : Raw.Drive.t
end

(** {b The methods, signals and properties of a [File].}

    [GFile] is a high level abstraction for manipulating files on a virtual file
    system. [GFile]s are lightweight, immutable objects that do no I/O upon
    creation. It is necessary to understand that [GFile] objects do not
    represent files, merely an identifier for a file. All file content I/O is
    implemented as streaming operations (see [Gio.InputStream] and
    [Gio.OutputStream]).

    To construct a [GFile], you can use:

    - [Gio.File.new_for_path] if you have a path.
    - [Gio.File.new_for_uri] if you have a URI.
    - [Gio.File.new_for_commandline_arg] or
      [Gio.File.new_for_commandline_arg_and_cwd] for a command line argument.
    - [Gio.File.new_tmp] to create a temporary file from a template.
    - [Gio.File.new_tmp_async] to asynchronously create a temporary file.
    - [Gio.File.new_tmp_dir_async] to asynchronously create a temporary
      directory.
    - [Gio.File.parse_name] from a UTF-8 string gotten from
      [Gio.File.get_parse_name].
    - [Gio.File.new_build_filename] or [Gio.File.new_build_filenamev] to create
      a file from path elements.

    One way to think of a [GFile] is as an abstraction of a pathname. For normal
    files the system pathname is what is stored internally, but as [GFile]s are
    extensible it could also be something else that corresponds to a pathname in
    a userspace implementation of a filesystem.

    [GFile]s make up hierarchies of directories and files that correspond to the
    files on a filesystem. You can move through the file system with [GFile]
    using [Gio.File.get_parent] to get an identifier for the parent directory,
    [Gio.File.get_child] to get a child within a directory, and
    [Gio.File.resolve_relative_path] to resolve a relative path between two
    [GFile]s. There can be multiple hierarchies, so you may not end up at the
    same root if you repeatedly call [Gio.File.get_parent] on two different
    files.

    All [GFile]s have a basename (get with [Gio.File.get_basename]). These names
    are byte strings that are used to identify the file on the filesystem
    (relative to its parent directory) and there is no guarantees that they have
    any particular charset encoding or even make any sense at all. If you want
    to use filenames in a user interface you should use the display name that
    you can get by requesting the [G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME]
    attribute with [Gio.File.query_info]. This is guaranteed to be in UTF-8 and
    can be used in a user interface. But always store the real basename or the
    [GFile] to use to actually access the file, because there is no way to go
    from a display name to the actual name.

    Using [GFile] as an identifier has the same weaknesses as using a path in
    that there may be multiple aliases for the same file. For instance, hard or
    soft links may cause two different [GFile]s to refer to the same file. Other
    possible causes for aliases are: case insensitive filesystems, short and
    long names on FAT/NTFS, or bind mounts in Linux. If you want to check if two
    [GFile]s point to the same file you can query for the
    [G_FILE_ATTRIBUTE_ID_FILE] attribute. Note that [GFile] does some trivial
    canonicalization of pathnames passed in, so that trivial differences in the
    path string used at creation (duplicated slashes, slash at end of path, [.]
    or [..] path segments, etc) does not create different [GFile]s.

    Many [GFile] operations have both synchronous and asynchronous versions to
    suit your application. Asynchronous versions of synchronous functions simply
    have [_async()] appended to their function names. The asynchronous I/O
    functions call a [Gio.AsyncReadyCallback] which is then used to finalize the
    operation, producing a [Gio.AsyncResult] which is then passed to the
    function’s matching [_finish()] operation.

    It is highly recommended to use asynchronous calls when running within a
    shared main loop, such as in the main thread of an application. This avoids
    I/O operations blocking other sources on the main loop from being
    dispatched. Synchronous I/O operations should be performed from worker
    threads. See the introduction to asynchronous programming section for more.

    Some [GFile] operations almost always take a noticeable amount of time, and
    so do not have synchronous analogs. Notable cases include:

    - [Gio.File.mount_mountable] to mount a mountable file.
    - [Gio.File.unmount_mountable_with_operation] to unmount a mountable file.
    - [Gio.File.eject_mountable_with_operation] to eject a mountable file.

    {b Entity Tags}

    One notable feature of [GFile]s are entity tags, or ‘etags’ for short.
    Entity tags are somewhat like a more abstract version of the traditional
    mtime, and can be used to quickly determine if the file has been modified
    from the version on the file system. See the HTTP 1.1 specification for HTTP
    [ETag] headers, which are a very similar concept. *)
and file_t = object
  (** {2:methods Methods} *)

  method append_to :
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_output_stream.file_output_stream_t, GError.t) result
  (** Gets an output stream for appending data to the file. If the file doesn't
      already exist it is created.

      By default files created are generally readable by everyone, but if you
      pass [G_FILE_CREATE_PRIVATE] in [flags] the file will be made readable
      only to the current user, to the level that is supported on the target
      filesystem.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.

      Some file systems don't allow all file names, and may return an
      [G_IO_ERROR_INVALID_FILENAME] error. If the file is a directory the
      [G_IO_ERROR_IS_DIRECTORY] error will be returned. Other errors are
      possible too, and depend on what kind of filesystem the file is on. *)

  method append_to_finish :
    Async_result.async_result_t ->
    (File_output_stream.file_output_stream_t, GError.t) result
  (** Finishes an asynchronous file append operation started with
      g_file_append_to_async(). *)

  method build_attribute_list_for_copy :
    Enums.filecopyflags ->
    Cancellable.cancellable_t option ->
    (string, GError.t) result
  (** Prepares the file attribute query string for copying to [file].

      This function prepares an attribute query string to be passed to
      g_file_query_info() to get a list of attributes normally copied with the
      file (see g_file_copy_attributes() for the detailed description). This
      function is used by the implementation of g_file_copy_attributes() and is
      useful when one needs to query and set the attributes in two stages (e.g.,
      for recursive move of a directory). *)

  method copy_attributes :
    file_t ->
    Enums.filecopyflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  (** Copies the file attributes from [source] to [destination].

      Normally only a subset of the file attributes are copied, those that are
      copies in a normal file copy operation (which for instance does not
      include e.g. owner). However if [G_FILE_COPY_ALL_METADATA] is specified in
      [flags], then all the metadata that is possible to copy is copied. This is
      useful when implementing move by copy + delete source. *)

  method copy_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes copying the file started with g_file_copy_async(). *)

  method create :
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_output_stream.file_output_stream_t, GError.t) result
  (** Creates a new file and returns an output stream for writing to it. The
      file must not already exist.

      By default files created are generally readable by everyone, but if you
      pass [G_FILE_CREATE_PRIVATE] in [flags] the file will be made readable
      only to the current user, to the level that is supported on the target
      filesystem.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.

      If a file or directory with this name already exists the
      [G_IO_ERROR_EXISTS] error will be returned. Some file systems don't allow
      all file names, and may return an [G_IO_ERROR_INVALID_FILENAME] error, and
      if the name is to long [G_IO_ERROR_FILENAME_TOO_LONG] will be returned.
      Other errors are possible too, and depend on what kind of filesystem the
      file is on. *)

  method create_finish :
    Async_result.async_result_t ->
    (File_output_stream.file_output_stream_t, GError.t) result
  (** Finishes an asynchronous file create operation started with
      g_file_create_async(). *)

  method create_readwrite :
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_io_stream.file_io_stream_t, GError.t) result
  (** Creates a new file and returns a stream for reading and writing to it. The
      file must not already exist.

      By default files created are generally readable by everyone, but if you
      pass [G_FILE_CREATE_PRIVATE] in [flags] the file will be made readable
      only to the current user, to the level that is supported on the target
      filesystem.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.

      If a file or directory with this name already exists, the
      [G_IO_ERROR_EXISTS] error will be returned. Some file systems don't allow
      all file names, and may return an [G_IO_ERROR_INVALID_FILENAME] error, and
      if the name is too long, [G_IO_ERROR_FILENAME_TOO_LONG] will be returned.
      Other errors are possible too, and depend on what kind of filesystem the
      file is on.

      Note that in many non-local file cases read and write streams are not
      supported, so make sure you really need to do read and write streaming,
      rather than just opening for reading or writing. *)

  method create_readwrite_finish :
    Async_result.async_result_t ->
    (File_io_stream.file_io_stream_t, GError.t) result
  (** Finishes an asynchronous file create operation started with
      g_file_create_readwrite_async(). *)

  method delete : Cancellable.cancellable_t option -> (bool, GError.t) result
  [@@ocaml.doc
    "Deletes a file. If the [file] is a directory, it will only be\n\
     deleted if it is empty. This has the same semantics as g_unlink().\n\n\
     If [file] doesn’t exist, [G_IO_ERROR_NOT_FOUND] will be returned. This \
     allows\n\
     for deletion to be implemented avoiding\n\
     {{:https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use}time-of-check \
     to time-of-use races}:\n\n\
     {[\n\
     g_autoptr(GError) local_error = NULL;\n\
     if (!g_file_delete (my_file, my_cancellable, &local_error) &&\n\
    \    !g_error_matches (local_error, G_IO_ERROR, G_IO_ERROR_NOT_FOUND))\n\
    \  {\n\
    \    // deletion failed for some reason other than the file not existing:\n\
    \    // so report the error\n\
    \    g_warning (\"Failed to delete %s: %s\",\n\
    \               g_file_peek_path (my_file), local_error->message);\n\
    \  }\n\
     ]}\n\n\
     If [cancellable] is not [None], then the operation can be cancelled by\n\
     triggering the cancellable object from another thread. If the operation\n\
     was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned."]

  method delete_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes deleting a file started with g_file_delete_async(). *)

  method dup : unit -> file_t
  (** Duplicates a [GFile] handle. This operation does not duplicate the actual
      file or directory represented by the [GFile]; see g_file_copy() if
      attempting to copy a file.

      g_file_dup() is useful when a second handle is needed to the same
      underlying file, for use in a separate thread ([GFile] is not
      thread-safe). For use within the same thread, use g_object_ref() to
      increment the existing object’s reference count.

      This call does no blocking I/O. *)

  method eject_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous eject operation started by
      g_file_eject_mountable(). *)

  method eject_mountable_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous eject operation started by
      g_file_eject_mountable_with_operation(). *)

  method enumerate_children :
    string ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (file_enumerator_t, GError.t) result
  [@@ocaml.doc
    "Gets the requested information about the files in a directory.\n\
     The result is a [GFileEnumerator] object that will give out\n\
     [GFileInfo] objects for all the files in the directory.\n\n\
     The [attributes] value is a string that specifies the file\n\
     attributes that should be gathered. It is not an error if\n\
     it's not possible to read a particular requested attribute\n\
     from a file - it just won't be set. [attributes] should\n\
     be a comma-separated list of attributes or attribute wildcards.\n\
     The wildcard \"{i \" means all attributes, and a wildcard like\n\
     \"standard::}\" means all attributes in the standard namespace.\n\
     An example attribute query be \"standard::*,owner::user\".\n\
     The standard attributes are available as defines, like\n\
     [G_FILE_ATTRIBUTE_STANDARD_NAME]. [G_FILE_ATTRIBUTE_STANDARD_NAME] should\n\
     always be specified if you plan to call g_file_enumerator_get_child() or\n\
     g_file_enumerator_iterate() on the returned enumerator.\n\n\
     If [cancellable] is not [None], then the operation can be cancelled\n\
     by triggering the cancellable object from another thread. If the\n\
     operation was cancelled, the error [G_IO_ERROR_CANCELLED] will be\n\
     returned.\n\n\
     If the file does not exist, the [G_IO_ERROR_NOT_FOUND] error will\n\
     be returned. If the file is not a directory, the [G_IO_ERROR_NOT_DIRECTORY]\n\
     error will be returned. Other errors are possible too."]

  method enumerate_children_finish :
    Async_result.async_result_t -> (file_enumerator_t, GError.t) result
  (** Finishes an async enumerate children operation. See
      g_file_enumerate_children_async(). *)

  method equal : file_t -> bool
  (** Checks if the two given [GFiles] refer to the same file.

      Note that two [GFiles] that differ can still refer to the same file on the
      filesystem due to various forms of filename aliasing.

      This call does no blocking I/O. *)

  method find_enclosing_mount :
    Cancellable.cancellable_t option -> (mount_t, GError.t) result
  (** Gets a [GMount] for the [GFile].

      [GMount] is returned only for user interesting locations, see
      [GVolumeMonitor]. If the [GFileIface] for [file] does not have a #mount,
      [error] will be set to [G_IO_ERROR_NOT_FOUND] and [None] #will be
      returned.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method find_enclosing_mount_finish :
    Async_result.async_result_t -> (mount_t, GError.t) result
  (** Finishes an asynchronous find mount request. See
      g_file_find_enclosing_mount_async(). *)

  method get_basename : unit -> string option
  (** Gets the base name (the last component of the path) for a given [GFile].

      If called for the top level of a system (such as the filesystem root or a
      uri like sftp://host/) it will return a single directory separator (and on
      Windows, possibly a drive letter).

      The base name is a byte string (not UTF-8). It has no defined encoding or
      rules other than it may not contain zero bytes. If you want to use
      filenames in a user interface you should use the display name that you can
      get by requesting the [G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME] attribute
      with g_file_query_info().

      This call does no blocking I/O. *)

  method get_child : string -> file_t
  (** Gets a child of [file] with basename equal to [name].

      Note that the file with that specific name might not exist, but you can
      still have a [GFile] that points to it. You can use this for instance to
      create that file.

      This call does no blocking I/O. *)

  method get_child_for_display_name : string -> (file_t, GError.t) result
  (** Gets the child of [file] for a given [display_name] (i.e. a UTF-8 version
      of the name). If this function fails, it returns [None] and [error] will
      be set. This is very useful when constructing a [GFile] for a new file and
      the user entered the filename in the user interface, for instance when you
      select a directory and type a filename in the file selector.

      This call does no blocking I/O. *)

  method get_parent : unit -> file_t option
  (** Gets the parent directory for the [file]. If the [file] represents the
      root directory of the file system, then [None] will be returned.

      This call does no blocking I/O. *)

  method get_parse_name : unit -> string
  (** Gets the parse name of the [file]. A parse name is a UTF-8 string that
      describes the file such that one can get the [GFile] back using
      g_file_parse_name().

      This is generally used to show the [GFile] as a nice full-pathname kind of
      string in a user interface, like in a location entry.

      For local files with names that can safely be converted to UTF-8 the
      pathname is used, otherwise the IRI is used (a form of URI that allows
      UTF-8 characters unescaped).

      This call does no blocking I/O. *)

  method get_path : unit -> string option
  (** Gets the local pathname for [GFile], if one exists. If non-[None], this is
      guaranteed to be an absolute, canonical path. It might contain symlinks.

      This call does no blocking I/O. *)

  method get_relative_path : file_t -> string option
  (** Gets the path for [descendant] relative to [parent].

      This call does no blocking I/O. *)

  method get_uri : unit -> string
  (** Gets the URI for the [file].

      This call does no blocking I/O. *)

  method get_uri_scheme : unit -> string option
  [@@ocaml.doc
    "Gets the URI scheme for a [GFile].\n\
     RFC 3986 decodes the scheme as:\n\n\
     {[\n\
     URI = scheme \":\" hier-part [ \"?\" query ] [ \"#\" fragment ]\n\
     ]}\n\n\
     Common schemes include \"file\", \"http\", \"ftp\", etc.\n\n\
     The scheme can be different from the one used to construct the [GFile],\n\
     in that it might be replaced with one that is logically equivalent to the \
     [GFile].\n\n\
     This call does no blocking I/O."]

  method has_parent : file_t option -> bool
  (** Checks if [file] has a parent, and optionally, if it is [parent].

      If [parent] is [None] then this function returns [true] if [file] has any
      parent at all. If [parent] is non-[None] then [true] is only returned if
      [file] is an immediate child of [parent]. *)

  method has_prefix : file_t -> bool
  (** Checks whether [file] has the prefix specified by [prefix].

      In other words, if the names of initial elements of [file]'s pathname
      match [prefix]. Only full pathname elements are matched, so a path like
      /foo is not considered a prefix of /foobar, only of /foo/bar.

      A [GFile] is not a prefix of itself. If you want to check for equality,
      use g_file_equal().

      This call does no I/O, as it works purely on names. As such it can
      sometimes return [false] even if [file] is inside a [prefix] (from a
      filesystem point of view), because the prefix of [file] is an alias of
      [prefix]. *)

  method has_uri_scheme : string -> bool
  (** Checks to see if a [GFile] has a given URI scheme.

      This call does no blocking I/O. *)

  method hash : unit -> int
  (** Creates a hash value for a [GFile].

      This call does no blocking I/O. *)

  method is_native : unit -> bool
  [@@ocaml.doc
    "Checks to see if a file is native to the platform.\n\n\
     A native file is one expressed in the platform-native filename format,\n\
     e.g. \"C:\\Windows\" or \"/usr/bin/\". This does not mean the file is \
     local,\n\
     as it might be on a locally mounted remote filesystem.\n\n\
     On some systems non-native files may be available using the native\n\
     filesystem via a userspace filesystem (FUSE), in these cases this call\n\
     will return [false], but g_file_get_path() will still return a native \
     path.\n\n\
     This call does no blocking I/O."]

  method make_directory :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Creates a directory.

      Note that this will only create a child directory of the immediate parent
      directory of the path or URI given by the [GFile]. To recursively create
      directories, see g_file_make_directory_with_parents().

      This function will fail if the parent directory does not exist, setting
      [error] to [G_IO_ERROR_NOT_FOUND]. If the file system doesn't support
      creating directories, this function will fail, setting [error] to
      [G_IO_ERROR_NOT_SUPPORTED]. If the directory already exists,
      [Gio.IOErrorEnum.EXISTS] will be returned.

      For a local [GFile] the newly created directory will have the default
      (current) ownership and permissions of the current process.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method make_directory_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous directory creation, started with
      g_file_make_directory_async(). *)

  method make_directory_with_parents :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Creates a directory and any parent directories that may not exist similar
      to 'mkdir -p'. If the file system does not support creating directories,
      this function will fail, setting [error] to [G_IO_ERROR_NOT_SUPPORTED]. If
      the directory itself already exists, this function will fail setting
      [error] to [G_IO_ERROR_EXISTS], unlike the similar g_mkdir_with_parents().

      For a local [GFile] the newly created directories will have the default
      (current) ownership and permissions of the current process.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method make_symbolic_link :
    string -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Creates a symbolic link named [file] which contains the string
      [symlink_value].

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method make_symbolic_link_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous symbolic link creation, started with
      g_file_make_symbolic_link_async(). *)

  method monitor :
    Enums.filemonitorflags ->
    Cancellable.cancellable_t option ->
    (file_monitor_t, GError.t) result
  (** Obtains a file or directory monitor for the given file, depending on the
      type of the file.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method monitor_directory :
    Enums.filemonitorflags ->
    Cancellable.cancellable_t option ->
    (file_monitor_t, GError.t) result
  (** Obtains a directory monitor for the given file. This may fail if directory
      monitoring is not supported.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.

      It does not make sense for [flags] to contain
      [G_FILE_MONITOR_WATCH_HARD_LINKS], since hard links can not be made to
      directories. It is not possible to monitor all the files in a directory
      for changes made via hard links; if you want to do this then you must
      register individual watches with g_file_monitor(). *)

  method monitor_file :
    Enums.filemonitorflags ->
    Cancellable.cancellable_t option ->
    (file_monitor_t, GError.t) result
  (** Obtains a file monitor for the given file. If no file notification
      mechanism exists, then regular polling of the file is used.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.

      If [flags] contains [G_FILE_MONITOR_WATCH_HARD_LINKS] then the monitor
      will also attempt to report changes made to the file via another filename
      (ie, a hard link). Without this flag, you can only rely on changes made
      through the filename contained in [file] to be reported. Using this flag
      may result in an increase in resource usage, and may not have any effect
      depending on the [GFileMonitor] backend and/or filesystem type. *)

  method mount_enclosing_volume_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes a mount operation started by g_file_mount_enclosing_volume(). *)

  method mount_mountable_finish :
    Async_result.async_result_t -> (file_t, GError.t) result
  (** Finishes a mount operation. See g_file_mount_mountable() for details.

      Finish an asynchronous mount operation that was started with
      g_file_mount_mountable(). *)

  method move_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous file movement, started with g_file_move_async().
  *)

  method open_readwrite :
    Cancellable.cancellable_t option ->
    (File_io_stream.file_io_stream_t, GError.t) result
  (** Opens an existing file for reading and writing. The result is a
      [GFileIOStream] that can be used to read and write the contents of the
      file.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.

      If the file does not exist, the [G_IO_ERROR_NOT_FOUND] error will be
      returned. If the file is a directory, the [G_IO_ERROR_IS_DIRECTORY] error
      will be returned. Other errors are possible too, and depend on what kind
      of filesystem the file is on. Note that in many non-local file cases read
      and write streams are not supported, so make sure you really need to do
      read and write streaming, rather than just opening for reading or writing.
  *)

  method open_readwrite_finish :
    Async_result.async_result_t ->
    (File_io_stream.file_io_stream_t, GError.t) result
  (** Finishes an asynchronous file read operation started with
      g_file_open_readwrite_async(). *)

  method peek_path : unit -> string option
  (** Exactly like g_file_get_path(), but caches the result via
      g_object_set_qdata_full(). This is useful for example in C applications
      which mix [g_file_*] APIs with native ones. It also avoids an extra
      duplicated string when possible, so will be generally more efficient.

      This call does no blocking I/O. *)

  method poll_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes a poll operation. See g_file_poll_mountable() for details.

      Finish an asynchronous poll operation that was polled with
      g_file_poll_mountable(). *)

  method query_default_handler :
    Cancellable.cancellable_t option -> (app_info_t, GError.t) result
  (** Returns the [GAppInfo] that is registered as the default application to
      handle the file specified by [file].

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method query_default_handler_finish :
    Async_result.async_result_t -> (app_info_t, GError.t) result
  (** Finishes a g_file_query_default_handler_async() operation. *)

  method query_exists : Cancellable.cancellable_t option -> bool
  (** Utility function to check if a particular file exists.

      The fallback implementation of this API is using [Gio.File.query_info] and
      therefore may do blocking I/O. To asynchronously query the existence of a
      file, use [Gio.File.query_info_async].

      Note that in many cases it is
      {{:https://en.wikipedia.org/wiki/Time_of_check_to_time_of_use}racy to
       first check for file existence} and then execute something based on the
      outcome of that, because the file might have been created or removed in
      between the operations. The general approach to handling that is to not
      check, but just do the operation and handle the errors as they come.

      As an example of race-free checking, take the case of reading a file, and
      if it doesn't exist, creating it. There are two racy versions: read it,
      and on error create it; and: check if it exists, if not create it. These
      can both result in two processes creating the file (with perhaps a
      partially written file as the result). The correct approach is to always
      try to create the file with g_file_create() which will either atomically
      create the file or fail with a [G_IO_ERROR_EXISTS] error.

      However, in many cases an existence check is useful in a user interface,
      for instance to make a menu item sensitive/insensitive, so that you don't
      have to fool users that something is possible and then just show an error
      dialog. If you do this, you should make sure to also handle the errors
      that can happen due to races when you execute the operation. *)

  method query_file_type :
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    Enums.filetype
  (** Utility function to inspect the [GFileType] of a file. This is implemented
      using g_file_query_info() and as such does blocking I/O.

      The primary use case of this method is to check if a file is a regular
      file, directory, or symlink. *)

  method query_filesystem_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result
  [@@ocaml.doc
    "Similar to g_file_query_info(), but obtains information\n\
     about the filesystem the [file] is on, rather than the file itself.\n\
     For instance the amount of space available and the type of\n\
     the filesystem.\n\n\
     The [attributes] value is a string that specifies the attributes\n\
     that should be gathered. It is not an error if it's not possible\n\
     to read a particular requested attribute from a file - it just\n\
     won't be set. [attributes] should be a comma-separated list of\n\
     attributes or attribute wildcards. The wildcard \"{i \" means all\n\
     attributes, and a wildcard like \"filesystem::}\" means all attributes\n\
     in the filesystem namespace. The standard namespace for filesystem\n\
     attributes is \"filesystem\". Common attributes of interest are\n\
     [G_FILE_ATTRIBUTE_FILESYSTEM_SIZE] (the total size of the filesystem\n\
     in bytes), [G_FILE_ATTRIBUTE_FILESYSTEM_FREE] (number of bytes available),\n\
     and [G_FILE_ATTRIBUTE_FILESYSTEM_TYPE] (type of the filesystem).\n\n\
     If [cancellable] is not [None], then the operation can be cancelled\n\
     by triggering the cancellable object from another thread. If the\n\
     operation was cancelled, the error [G_IO_ERROR_CANCELLED] will be\n\
     returned.\n\n\
     If the file does not exist, the [G_IO_ERROR_NOT_FOUND] error will\n\
     be returned. Other errors are possible too, and depend on what\n\
     kind of filesystem the file is on."]

  method query_filesystem_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
  (** Finishes an asynchronous filesystem info query. See
      g_file_query_filesystem_info_async(). *)

  method query_info :
    string ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result
  [@@ocaml.doc
    "Gets the requested information about specified [file].\n\n\
     The result is a [Gio.FileInfo] object that contains key-value\n\
     attributes (such as the type or size of the file).\n\n\
     The [attributes] value is a string that specifies the file\n\
     attributes that should be gathered. It is not an error if\n\
     it’s not possible to read a particular requested attribute\n\
     from a file — it just won't be set. In particular this means that if a file\n\
     is inaccessible (due to being in a folder with restrictive permissions), \
     for\n\
     example, you can expect the returned [Gio.FileInfo] to have very few\n\
     attributes set. You should check whether an attribute is set using\n\
     [Gio.FileInfo.has_attribute] before trying to retrieve its value.\n\n\
     It is guaranteed that if any of the following attributes are listed in\n\
     [attributes], they will always be set in the returned [Gio.FileInfo],\n\
     even if the user doesn’t have permissions to access the file:\n\n\
     - [Gio.FILE_ATTRIBUTE_STANDARD_NAME]\n\
     - [Gio.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME]\n\n\
     [attributes] should be a comma-separated list of attributes or attribute\n\
     wildcards. The wildcard [\"*\"] means all attributes, and a wildcard like\n\
     [\"standard::*\"] means all attributes in the standard namespace.\n\
     An example attribute query might be [\"standard::*,owner::user\"].\n\
     The standard attributes are available as defines, like\n\
     [Gio.FILE_ATTRIBUTE_STANDARD_NAME].\n\n\
     If [cancellable] is not [None], then the operation can be cancelled\n\
     by triggering the cancellable object from another thread. If the\n\
     operation was cancelled, the error [Gio.IOErrorEnum.CANCELLED] will be\n\
     returned.\n\n\
     For symlinks, normally the information about the target of the\n\
     symlink is returned, rather than information about the symlink\n\
     itself. However if you pass [Gio.FileQueryInfoFlags.NOFOLLOW_SYMLINKS]\n\
     in [flags] the information about the symlink itself will be returned.\n\
     Also, for symlinks that point to non-existing files the information\n\
     about the symlink itself will be returned.\n\n\
     If the file does not exist, the [Gio.IOErrorEnum.NOT_FOUND] error will be\n\
     returned. Other errors are possible too, and depend on what kind of\n\
     file system the file is on."]

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
  (** Finishes an asynchronous file info query. See g_file_query_info_async().
  *)

  method query_settable_attributes :
    Cancellable.cancellable_t option ->
    (Raw.File_attribute_info_list.t, GError.t) result
  (** Obtain the list of settable attributes for the file.

      Returns the type and full attribute name of all the attributes that can be
      set on this file. This doesn't mean setting it will always succeed though,
      you might get an access failure, or some specific file may not support a
      specific attribute.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method query_writable_namespaces :
    Cancellable.cancellable_t option ->
    (Raw.File_attribute_info_list.t, GError.t) result
  [@@ocaml.doc
    "Obtain the list of attribute namespaces where new attributes\n\
     can be created by a user. An example of this is extended\n\
     attributes (in the \"xattr\" namespace).\n\n\
     If [cancellable] is not [None], then the operation can be cancelled by\n\
     triggering the cancellable object from another thread. If the operation\n\
     was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned."]

  method read :
    Cancellable.cancellable_t option ->
    (File_input_stream.file_input_stream_t, GError.t) result
  (** Opens a file for reading. The result is a [GFileInputStream] that can be
      used to read the contents of the file.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.

      If the file does not exist, the [G_IO_ERROR_NOT_FOUND] error will be
      returned. If the file is a directory, the [G_IO_ERROR_IS_DIRECTORY] error
      will be returned. Other errors are possible too, and depend on what kind
      of filesystem the file is on. *)

  method read_finish :
    Async_result.async_result_t ->
    (File_input_stream.file_input_stream_t, GError.t) result
  (** Finishes an asynchronous file read operation started with
      g_file_read_async(). *)

  method replace :
    string option ->
    bool ->
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_output_stream.file_output_stream_t, GError.t) result
  (** Returns an output stream for overwriting the file, possibly creating a
      backup copy of the file first. If the file doesn't exist, it will be
      created.

      This will try to replace the file in the safest way possible so that any
      errors during the writing will not affect an already existing copy of the
      file. For instance, for local files it may write to a temporary file and
      then atomically rename over the destination when the stream is closed.

      By default files created are generally readable by everyone, but if you
      pass [G_FILE_CREATE_PRIVATE] in [flags] the file will be made readable
      only to the current user, to the level that is supported on the target
      filesystem.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.

      If you pass in a non-[None] [etag] value and [file] already exists, then
      this value is compared to the current entity tag of the file, and if they
      differ an [G_IO_ERROR_WRONG_ETAG] error is returned. This generally means
      that the file has been changed since you last read it. You can get the new
      etag from g_file_output_stream_get_etag() after you've finished writing
      and closed the [GFileOutputStream]. When you load a new file you can use
      g_file_input_stream_query_info() to get the etag of the file.

      If [make_backup] is [true], this function will attempt to make a backup of
      the current file before overwriting it. If this fails a
      [G_IO_ERROR_CANT_CREATE_BACKUP] error will be returned. If you want to
      replace anyway, try again with [make_backup] set to [false].

      If the file is a directory the [G_IO_ERROR_IS_DIRECTORY] error will be
      returned, and if the file is some other form of non-regular file then a
      [G_IO_ERROR_NOT_REGULAR_FILE] error will be returned. Some file systems
      don't allow all file names, and may return an
      [G_IO_ERROR_INVALID_FILENAME] error, and if the name is to long
      [G_IO_ERROR_FILENAME_TOO_LONG] will be returned. Other errors are possible
      too, and depend on what kind of filesystem the file is on. *)

  method replace_finish :
    Async_result.async_result_t ->
    (File_output_stream.file_output_stream_t, GError.t) result
  (** Finishes an asynchronous file replace operation started with
      g_file_replace_async(). *)

  method replace_readwrite :
    string option ->
    bool ->
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_io_stream.file_io_stream_t, GError.t) result
  (** Returns an output stream for overwriting the file in readwrite mode,
      possibly creating a backup copy of the file first. If the file doesn't
      exist, it will be created.

      For details about the behaviour, see g_file_replace() which does the same
      thing but returns an output stream only.

      Note that in many non-local file cases read and write streams are not
      supported, so make sure you really need to do read and write streaming,
      rather than just opening for reading or writing. *)

  method replace_readwrite_finish :
    Async_result.async_result_t ->
    (File_io_stream.file_io_stream_t, GError.t) result
  (** Finishes an asynchronous file replace operation started with
      g_file_replace_readwrite_async(). *)

  method resolve_relative_path : string -> file_t
  (** Resolves a relative path for [file] to an absolute path.

      This call does no blocking I/O.

      If the [relative_path] is an absolute path name, the resolution is done
      absolutely (without taking [file] path as base). *)

  method set_attribute_byte_string :
    string ->
    string ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  (** Sets [attribute] of type [G_FILE_ATTRIBUTE_TYPE_BYTE_STRING] to [value].
      If [attribute] is of a different type, this operation will fail, returning
      [false].

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method set_attribute_int32 :
    string ->
    Int32.t ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  (** Sets [attribute] of type [G_FILE_ATTRIBUTE_TYPE_INT32] to [value]. If
      [attribute] is of a different type, this operation will fail.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method set_attribute_int64 :
    string ->
    int64 ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  (** Sets [attribute] of type [G_FILE_ATTRIBUTE_TYPE_INT64] to [value]. If
      [attribute] is of a different type, this operation will fail.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method set_attribute_string :
    string ->
    string ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  (** Sets [attribute] of type [G_FILE_ATTRIBUTE_TYPE_STRING] to [value]. If
      [attribute] is of a different type, this operation will fail.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method set_attribute_uint32 :
    string ->
    UInt32.t ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  (** Sets [attribute] of type [G_FILE_ATTRIBUTE_TYPE_UINT32] to [value]. If
      [attribute] is of a different type, this operation will fail.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method set_attribute_uint64 :
    string ->
    UInt64.t ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  (** Sets [attribute] of type [G_FILE_ATTRIBUTE_TYPE_UINT64] to [value]. If
      [attribute] is of a different type, this operation will fail.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method set_attributes_from_info :
    File_info.file_info_t ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  [@@ocaml.doc
    "Tries to set all attributes in the [GFileInfo] on the target\n\
     values, not stopping on the first error.\n\n\
     If there is any error during this operation then [error] will\n\
     be set to the first error. Error on particular fields are flagged\n\
     by setting the \"status\" field in the attribute value to\n\
     [G_FILE_ATTRIBUTE_STATUS_ERROR_SETTING], which means you can\n\
     also detect further errors.\n\n\
     If [cancellable] is not [None], then the operation can be cancelled by\n\
     triggering the cancellable object from another thread. If the operation\n\
     was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned."]

  method set_display_name :
    string -> Cancellable.cancellable_t option -> (file_t, GError.t) result
  (** Renames [file] to the specified display name.

      The display name is converted from UTF-8 to the correct encoding for the
      target filesystem if possible and the [file] is renamed to this.

      If you want to implement a rename operation in the user interface the edit
      name ([G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME]) should be used as the initial
      value in the rename widget, and then the result after editing should be
      passed to g_file_set_display_name().

      On success the resulting converted filename is returned.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method set_display_name_finish :
    Async_result.async_result_t -> (file_t, GError.t) result
  (** Finishes setting a display name started with
      g_file_set_display_name_async(). *)

  method start_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes a start operation. See g_file_start_mountable() for details.

      Finish an asynchronous start operation that was started with
      g_file_start_mountable(). *)

  method stop_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes a stop operation, see g_file_stop_mountable() for details.

      Finish an asynchronous stop operation that was started with
      g_file_stop_mountable(). *)

  method supports_thread_contexts : unit -> bool
  (** Checks if [file] supports thread-default main contexts (see
      [GLib.MainContext.push_thread_default]) If this returns [false], you
      cannot perform asynchronous operations on [file] in a thread that has a
      thread-default context. *)

  method trash : Cancellable.cancellable_t option -> (bool, GError.t) result
  [@@ocaml.doc
    "Sends [file] to the \"Trashcan\", if possible. This is similar to\n\
     deleting it, but the user can recover it before emptying the trashcan.\n\
     Trashing is disabled for system mounts by default (see\n\
     g_unix_mount_entry_is_system_internal()), so this call can return the\n\
     [G_IO_ERROR_NOT_SUPPORTED] error. Since GLib 2.66, the [x-gvfs-notrash] \
     unix\n\
     mount option can be used to disable g_file_trash() support for particular\n\
     mounts, the [G_IO_ERROR_NOT_SUPPORTED] error will be returned in that case.\n\
     Since 2.82, the [x-gvfs-trash] unix mount option can be used to enable\n\
     g_file_trash() support for particular system mounts.\n\n\
     If [cancellable] is not [None], then the operation can be cancelled by\n\
     triggering the cancellable object from another thread. If the operation\n\
     was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned."]

  method trash_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous file trashing operation, started with
      g_file_trash_async(). *)

  method unmount_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an unmount operation, see g_file_unmount_mountable() for details.

      Finish an asynchronous unmount operation that was started with
      g_file_unmount_mountable(). *)

  method unmount_mountable_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an unmount operation, see
      g_file_unmount_mountable_with_operation() for details.

      Finish an asynchronous unmount operation that was started with
      g_file_unmount_mountable_with_operation(). *)

  (** {2:conversions Conversions} *)

  method as_file : Raw.File.t
end

(** {b The methods, signals and properties of a [FileEnumerator].}

    [GFileEnumerator] allows you to operate on a set of [Gio.File] objects,
    returning a [Gio.FileInfo] structure for each file enumerated (e.g.
    [Gio.File.enumerate_children] will return a [GFileEnumerator] for each of
    the children within a directory).

    To get the next file's information from a [GFileEnumerator], use
    [Gio.FileEnumerator.next_file] or its asynchronous version,
    [Gio.FileEnumerator.next_files_async]. Note that the asynchronous version
    will return a list of [Gio.FileInfo] objects, whereas the synchronous will
    only return the next file in the enumerator.

    The ordering of returned files is unspecified for non-Unix platforms; for
    more information, see [GLib.Dir.read_name]. On Unix, when operating on local
    files, returned files will be sorted by inode number. Effectively you can
    assume that the ordering of returned files will be stable between successive
    calls (and applications) assuming the directory is unchanged.

    If your application needs a specific ordering, such as by name or
    modification time, you will have to implement that in your application code.

    To close a [GFileEnumerator], use [Gio.FileEnumerator.close], or its
    asynchronous version, [Gio.FileEnumerator.close_async]. Once a
    [GFileEnumerator] is closed, no further actions may be performed on it, and
    it should be freed with [GObject.Object.unref]. *)
and file_enumerator_t = object
  (** {2:methods Methods} *)

  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Releases all resources used by this enumerator, making the enumerator
      return [G_IO_ERROR_CLOSED] on all calls.

      This will be automatically called when the last reference is dropped, but
      you might want to call this function to make sure resources are released
      as early as possible. *)

  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes closing a file enumerator, started from
      g_file_enumerator_close_async().

      If the file enumerator was already closed when
      g_file_enumerator_close_async() was called, then this function will report
      [G_IO_ERROR_CLOSED] in [error], and return [false]. If the file enumerator
      had pending operation when the close operation was started, then this
      function will report [G_IO_ERROR_PENDING], and return [false]. If
      [cancellable] was not [None], then the operation may have been cancelled
      by triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be set, and [false]
      will be returned. *)

  method get_child : File_info.file_info_t -> file_t
  (** Return a new [GFile] which refers to the file named by [info] in the
      source directory of [enumerator]. This function is primarily intended to
      be used inside loops with g_file_enumerator_next_file().

      To use this, [G_FILE_ATTRIBUTE_STANDARD_NAME] must have been listed in the
      attributes list used when creating the [GFileEnumerator].

      This is a convenience method that's equivalent to:

      {[
      gchar * name = g_file_info_get_name info;
      GFile * child
      = g_file_get_child (g_file_enumerator_get_container enumr, name)
      ]} *)

  method get_container : unit -> file_t
  (** Get the [GFile] container which is being enumerated. *)

  method has_pending : unit -> bool
  (** Checks if the file enumerator has pending operations. *)

  method is_closed : unit -> bool
  (** Checks if the file enumerator has been closed. *)

  method next_file :
    Cancellable.cancellable_t option ->
    (File_info.file_info_t option, GError.t) result
  (** Returns information for the next file in the enumerated object. Will block
      until the information is available. The [GFileInfo] returned from this
      function will contain attributes that match the attribute string that was
      passed when the [GFileEnumerator] was created.

      See the documentation of [GFileEnumerator] for information about the order
      of returned files.

      On error, returns [None] and sets [error] to the error. If the enumerator
      is at the end, [None] will be returned and [error] will be unset. *)

  method next_files_finish :
    Async_result.async_result_t -> (File_info.file_info_t list, GError.t) result
  (** Finishes the asynchronous operation started with
      g_file_enumerator_next_files_async(). *)

  method set_pending : bool -> unit
  (** Sets the file enumerator as having pending operations. *)

  (** {2:conversions Conversions} *)

  method as_file_enumerator : Raw.File_enumerator.t
end

(** {b The methods, signals and properties of a [FileMonitor].}

    Monitors a file or directory for changes.

    To obtain a [GFileMonitor] for a file or directory, use [Gio.File.monitor],
    [Gio.File.monitor_file], or [Gio.File.monitor_directory].

    To get informed about changes to the file or directory you are monitoring,
    connect to the [Gio.FileMonitor::changed] signal. The signal will be emitted
    in the thread-default main context (see
    [GLib.MainContext.push_thread_default]) of the thread that the monitor was
    created in (though if the global default main context is blocked, this may
    cause notifications to be blocked even if the thread-default context is
    still running). *)
and file_monitor_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool ->
    callback:
      (file:file_t ->
      other_file:file_t option ->
      event_type:Enums.filemonitorevent ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted when [file] has been changed.\n\n\
     If using [G_FILE_MONITOR_WATCH_MOVES] on a directory monitor, and\n\
     the information is available (and if supported by the backend),\n\
     [event_type] may be [G_FILE_MONITOR_EVENT_RENAMED],\n\
     [G_FILE_MONITOR_EVENT_MOVED_IN] or [G_FILE_MONITOR_EVENT_MOVED_OUT].\n\n\
     In all cases [file] will be a child of the monitored directory.  For\n\
     renames, [file] will be the old name and [other_file] is the new\n\
     name.  For \"moved in\" events, [file] is the name of the file that\n\
     appeared and [other_file] is the old name that it was moved from (in\n\
     another directory).  For \"moved out\" events, [file] is the name of\n\
     the file that used to be in this directory and [other_file] is the\n\
     name of the file at its new location.\n\n\
     It makes sense to treat [G_FILE_MONITOR_EVENT_MOVED_IN] as\n\
     equivalent to [G_FILE_MONITOR_EVENT_CREATED] and\n\
     [G_FILE_MONITOR_EVENT_MOVED_OUT] as equivalent to\n\
     [G_FILE_MONITOR_EVENT_DELETED], with extra information.\n\
     [G_FILE_MONITOR_EVENT_RENAMED] is equivalent to a delete/create\n\
     pair.  This is exactly how the events will be reported in the case\n\
     that the [G_FILE_MONITOR_WATCH_MOVES] flag is not in use.\n\n\
     If using the deprecated flag [G_FILE_MONITOR_SEND_MOVED] flag and \
     [event_type] is\n\
     [G_FILE_MONITOR_EVENT_MOVED], [file] will be set to a [GFile] containing \
     the\n\
     old path, and [other_file] will be set to a [GFile] containing the new \
     path.\n\n\
     In all the other cases, [other_file] will be set to [NULL]."]

  (** {2:methods Methods} *)

  method cancel : unit -> bool
  (** Cancels a file monitor. *)

  method emit_event : file_t -> file_t option -> Enums.filemonitorevent -> unit
  (** Emits the [GFileMonitor::changed] signal if a change has taken place.
      Should be called from file monitor implementations only.

      Implementations are responsible to call this method from the
      thread-default main context (see [GLib.MainContext.push_thread_default])
      of the thread that the monitor was created in. *)

  method is_cancelled : unit -> bool
  (** Returns whether the monitor is canceled. *)

  method set_rate_limit : int -> unit
  (** Sets the rate limit to which the [monitor] will report consecutive change
      events to the same file. *)

  (** {2:conversions Conversions} *)

  method as_file_monitor : Raw.File_monitor.t
end

(** {b The methods, signals and properties of a [Mount].}

    The [GMount] interface represents a user-visible mount, such as a mounted
    file system.

    [GMount] is a ‘mounted’ filesystem that you can access. Mounted is in quotes
    because it’s not the same as a UNIX mount, it might be a GVFS mount, but you
    can still access the files on it if you use GIO.

    A [GMount] might be associated with a [Gio.Volume] (such as a USB flash
    drive) which hosts it.

    Unmounting a [GMount] instance is an asynchronous operation. For more
    information about asynchronous operations, see [Gio.AsyncResult] and
    [Gio.Task]. To unmount a [GMount] instance, first call
    [Gio.Mount.unmount_with_operation] with (at least) the [GMount] instance and
    a [Gio.AsyncReadyCallback]. The callback will be fired when the operation
    has resolved (either with success or failure), and a [Gio.AsyncResult]
    structure will be passed to the callback. That callback should then call
    [Gio.Mount.unmount_with_operation_finish] with the [GMount] and the
    [Gio.AsyncResult] data to see if the operation was completed successfully.
    If an [error] is present when [Gio.Mount.unmount_with_operation_finish] is
    called, then it will be filled with any error information.

    Note, when porting from GnomeVFS, [GMount] is the moral equivalent of
    [GnomeVFSVolume]. *)
and mount_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the mount has been changed. *)

  method on_pre_unmount :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal may be emitted when the [GMount] is about to be unmounted.

      This signal depends on the backend and is only emitted if GIO was used to
      unmount. *)

  method on_unmounted :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal is emitted when the [GMount] have been unmounted. If the
      recipient is holding references to the object they should release them so
      the object can be finalized. *)

  (** {2:methods Methods} *)

  method can_eject : unit -> bool
  (** Checks if [mount] can be ejected. *)

  method can_unmount : unit -> bool
  (** Checks if [mount] can be unmounted. *)

  method eject_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes ejecting a mount. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned. *)

  method eject_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes ejecting a mount. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned. *)

  method get_default_location : unit -> file_t
  (** Gets the default location of [mount]. The default location of the given
      [mount] is a path that reflects the main entry point for the user (e.g.
      the home directory, or the root of the volume). *)

  method get_drive : unit -> drive_t option
  (** Gets the drive for the [mount].

      This is a convenience method for getting the [GVolume] and then using that
      object to get the [GDrive]. *)

  method get_icon : unit -> Icon.icon_t
  (** Gets the icon for [mount]. *)

  method get_name : unit -> string
  (** Gets the name of [mount]. *)

  method get_root : unit -> file_t
  (** Gets the root directory on [mount]. *)

  method get_sort_key : unit -> string option
  (** Gets the sort key for [mount], if any. *)

  method get_symbolic_icon : unit -> Icon.icon_t
  (** Gets the symbolic icon for [mount]. *)

  method get_uuid : unit -> string option
  (** Gets the UUID for the [mount]. The reference is typically based on the
      file system UUID for the mount in question and should be considered an
      opaque string. Returns [None] if there is no UUID available. *)

  method get_volume : unit -> volume_t option
  (** Gets the volume for the [mount]. *)

  method guess_content_type_finish :
    Async_result.async_result_t -> (string array, GError.t) result
  (** Finishes guessing content types of [mount]. If any errors occurred during
      the operation, [error] will be set to contain the errors and [false] will
      be returned. In particular, you may get an [G_IO_ERROR_NOT_SUPPORTED] if
      the mount does not support content guessing. *)

  method guess_content_type_sync :
    bool -> Cancellable.cancellable_t option -> (string array, GError.t) result
  [@@ocaml.doc
    "Tries to guess the type of content stored on [mount]. Returns one or\n\
     more textual identifiers of well-known content types (typically\n\
     prefixed with \"x-content/\"), e.g. x-content/image-dcf for camera\n\
     memory cards. See the\n\
     shared-mime-info\n\
     specification for more on x-content types.\n\n\
     This is a synchronous operation and as such may block doing IO;\n\
     see g_mount_guess_content_type() for the asynchronous version."]

  method is_shadowed : unit -> bool
  (** Determines if [mount] is shadowed. Applications or libraries should avoid
      displaying [mount] in the user interface if it is shadowed.

      A mount is said to be shadowed if there exists one or more user visible
      objects (currently [GMount] objects) with a root that is inside the root
      of [mount].

      One application of shadow mounts is when exposing a single file system
      that is used to address several logical volumes. In this situation, a
      [GVolumeMonitor] implementation would create two [GVolume] objects (for
      example, one for the camera functionality of the device and one for a SD
      card reader on the device) with activation URIs
      gphoto2://\[usb:001,002\]/store1/ and gphoto2://\[usb:001,002\]/store2/.
      When the underlying mount (with root gphoto2://\[usb:001,002\]/) is
      mounted, said [GVolumeMonitor] implementation would create two [GMount]
      objects (each with their root matching the corresponding volume activation
      root) that would shadow the original mount.

      The proxy monitor in GVfs 2.26 and later, automatically creates and manage
      shadow mounts (and shadows the underlying mount) if the activation root on
      a [GVolume] is set. *)

  method remount_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes remounting a mount. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned. *)

  method shadow : unit -> unit
  (** Increments the shadow count on [mount]. Usually used by [GVolumeMonitor]
      implementations when creating a shadow mount for [mount], see
      g_mount_is_shadowed() for more information. The caller will need to emit
      the [GMount::changed] signal on [mount] manually. *)

  method unmount_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes unmounting a mount. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned. *)

  method unmount_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes unmounting a mount. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned. *)

  method unshadow : unit -> unit
  (** Decrements the shadow count on [mount]. Usually used by [GVolumeMonitor]
      implementations when destroying a shadow mount for [mount], see
      g_mount_is_shadowed() for more information. The caller will need to emit
      the [GMount::changed] signal on [mount] manually. *)

  (** {2:conversions Conversions} *)

  method as_mount : Raw.Mount.t
end

(** {b The methods, signals and properties of a [Volume].}

    The [GVolume] interface represents user-visible objects that can be mounted.
    For example, a file system partition on a USB flash drive, or an optical
    disc inserted into a disc drive.

    If a [GVolume] is currently mounted, the corresponding [Gio.Mount] can be
    retrieved using [Gio.Volume.get_mount].

    Mounting a [GVolume] instance is an asynchronous operation. For more
    information about asynchronous operations, see [Gio.AsyncResult] and
    [Gio.Task]. To mount a [GVolume], first call [Gio.Volume.mount] with (at
    least) the [GVolume] instance, optionally a [Gio.MountOperation] object and
    a [Gio.AsyncReadyCallback].

    Typically, one will only want to pass [None] for the [Gio.MountOperation] if
    automounting all volumes when a desktop session starts since it’s not
    desirable to put up a lot of dialogs asking for credentials.

    The callback will be fired when the operation has resolved (either with
    success or failure), and a [Gio.AsyncResult] instance will be passed to the
    callback. That callback should then call [Gio.Volume.mount_finish] with the
    [GVolume] instance and the [Gio.AsyncResult] data to see if the operation
    was completed successfully. If a [GLib.Error] is present when
    [Gio.Volume.mount_finish] is called, then it will be filled with any error
    information.

    Note, when porting from GnomeVFS, [GVolume] is the moral equivalent of
    [GnomeVFSDrive].

    {b Volume Identifiers}

    It is sometimes necessary to directly access the underlying operating system
    object behind a volume (e.g. for passing a volume to an application via the
    command line). For this purpose, GIO allows to obtain an ‘identifier’ for
    the volume. There can be different kinds of identifiers, such as Hal UDIs,
    filesystem labels, traditional Unix devices (e.g. [/dev/sda2]), UUIDs. GIO
    uses predefined strings as names for the different kinds of identifiers:
    [G_VOLUME_IDENTIFIER_KIND_UUID], [G_VOLUME_IDENTIFIER_KIND_LABEL], etc. Use
    [Gio.Volume.get_identifier] to obtain an identifier for a volume.

    Note that [G_VOLUME_IDENTIFIER_KIND_HAL_UDI] will only be available when the
    GVFS hal volume monitor is in use. Other volume monitors will generally be
    able to provide the [G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE] identifier, which
    can be used to obtain a hal device by means of
    [libhal_manager_find_device_string_match()]. *)
and volume_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the volume has been changed. *)

  method on_removed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal is emitted when the [GVolume] have been removed. If the
      recipient is holding references to the object they should release them so
      the object can be finalized. *)

  (** {2:methods Methods} *)

  method can_eject : unit -> bool
  (** Checks if a volume can be ejected. *)

  method can_mount : unit -> bool
  (** Checks if a volume can be mounted. *)

  method eject_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes ejecting a volume. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned. *)

  method eject_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes ejecting a volume. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned. *)

  method enumerate_identifiers : unit -> string array
  (** Gets the kinds of identifiers that [volume] has. Use
      g_volume_get_identifier() to obtain the identifiers themselves. *)

  method get_activation_root : unit -> file_t option
  (** Gets the activation root for a [GVolume] if it is known ahead of mount
      time. Returns [None] otherwise. If not [None] and if [volume] is mounted,
      then the result of g_mount_get_root() on the [GMount] object obtained from
      g_volume_get_mount() will always either be equal or a prefix of what this
      function returns. In other words, in code

      {[
        GMount *mount;
        GFile *mount_root
        GFile *volume_activation_root;

        mount = g_volume_get_mount (volume); // mounted, so never NULL
        mount_root = g_mount_get_root (mount);
        volume_activation_root = g_volume_get_activation_root (volume); // assume not NULL
      ]}

      then the expression

      {[
      g_file_has_prefix (volume_activation_root, mount_root)
      || g_file_equal (volume_activation_root, mount_root)
      ]}

      will always be [true].

      Activation roots are typically used in [GVolumeMonitor] implementations to
      find the underlying mount to shadow, see g_mount_is_shadowed() for more
      details. *)

  method get_drive : unit -> drive_t option
  (** Gets the drive for the [volume]. *)

  method get_icon : unit -> Icon.icon_t
  (** Gets the icon for [volume]. *)

  method get_identifier : string -> string option
  (** Gets the identifier of the given kind for [volume]. See the introduction
      for more information about volume identifiers. *)

  method get_mount : unit -> mount_t option
  (** Gets the mount for the [volume]. *)

  method get_name : unit -> string
  (** Gets the name of [volume]. *)

  method get_sort_key : unit -> string option
  (** Gets the sort key for [volume], if any. *)

  method get_symbolic_icon : unit -> Icon.icon_t
  (** Gets the symbolic icon for [volume]. *)

  method get_uuid : unit -> string option
  (** Gets the UUID for the [volume]. The reference is typically based on the
      file system UUID for the volume in question and should be considered an
      opaque string. Returns [None] if there is no UUID available. *)

  method mount_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes mounting a volume. If any errors occurred during the operation,
      [error] will be set to contain the errors and [false] will be returned.

      If the mount operation succeeded, g_volume_get_mount() on [volume] is
      guaranteed to return the mount right after calling this function; there's
      no need to listen for the 'mount-added' signal on [GVolumeMonitor]. *)

  method should_automount : unit -> bool
  (** Returns whether the volume should be automatically mounted. *)

  (** {2:conversions Conversions} *)

  method as_volume : Raw.Volume.t
end

(** Wraps a raw handle of {!Ocgio.Raw.App_info.t}. *)
class app_info : Raw.App_info.t -> app_info_t
(** Wraps a raw handle of {!Ocgio.Raw.App_launch_context.t}. *)

and app_launch_context : Raw.App_launch_context.t -> app_launch_context_t
(** Wraps a raw handle of {!Ocgio.Raw.Drive.t}. *)

and drive : Raw.Drive.t -> drive_t
(** Wraps a raw handle of {!Ocgio.Raw.File.t}. *)

and file : Raw.File.t -> file_t
(** Wraps a raw handle of {!Ocgio.Raw.File_enumerator.t}. *)

and file_enumerator : Raw.File_enumerator.t -> file_enumerator_t
(** Wraps a raw handle of {!Ocgio.Raw.File_monitor.t}. *)

and file_monitor : Raw.File_monitor.t -> file_monitor_t
(** Wraps a raw handle of {!Ocgio.Raw.Mount.t}. *)

and mount : Raw.Mount.t -> mount_t
(** Wraps a raw handle of {!Ocgio.Raw.Volume.t}. *)

and volume : Raw.Volume.t -> volume_t

val new_ : unit -> app_launch_context_t
(** Creates a new application launch context. This is not normally used, instead
    you instantiate a subclass of this, such as
    {{:https://docs.gtk.org/gdk4/class.AppLaunchContext.html}[GdkAppLaunchContext]}.
*)
