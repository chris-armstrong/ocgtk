(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for File from cyclic group App_info_cycle_64c425a0 *)

(** [GFile] is a high level abstraction for manipulating files on a virtual file
    system. [GFile]s are lightweight, immutable objects that do no I/O upon
    creation. It is necessary to understand that [GFile] objects do not
    represent files, merely an identifier for a file. All file content I/O is
    implemented as streaming operations (see
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} and
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]}).

    Its methods, signals and properties are on {!class-type-file_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.File}. *)

(** {1:class Class} *)

class type file_t = App_info_cycle_64c425a0.file_t
(** {b The methods, signals and properties of a [File].}

    [GFile] is a high level abstraction for manipulating files on a virtual file
    system. [GFile]s are lightweight, immutable objects that do no I/O upon
    creation. It is necessary to understand that [GFile] objects do not
    represent files, merely an identifier for a file. All file content I/O is
    implemented as streaming operations (see
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} and
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]}).

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
      {{!Ocgio.File.class-type-file_t.method-get_parse_name}[Gio.File.get_parse_name]}.
    - [Gio.File.new_build_filename] or [Gio.File.new_build_filenamev] to create
      a file from path elements.

    One way to think of a [GFile] is as an abstraction of a pathname. For normal
    files the system pathname is what is stored internally, but as [GFile]s are
    extensible it could also be something else that corresponds to a pathname in
    a userspace implementation of a filesystem.

    [GFile]s make up hierarchies of directories and files that correspond to the
    files on a filesystem. You can move through the file system with [GFile]
    using
    {{!Ocgio.File.class-type-file_t.method-get_parent}[Gio.File.get_parent]} to
    get an identifier for the parent directory,
    {{!Ocgio.File.class-type-file_t.method-get_child}[Gio.File.get_child]} to
    get a child within a directory, and
    {{!Ocgio.File.class-type-file_t.method-resolve_relative_path}[Gio.File.resolve_relative_path]}
    to resolve a relative path between two [GFile]s. There can be multiple
    hierarchies, so you may not end up at the same root if you repeatedly call
    {{!Ocgio.File.class-type-file_t.method-get_parent}[Gio.File.get_parent]} on
    two different files.

    All [GFile]s have a basename (get with
    {{!Ocgio.File.class-type-file_t.method-get_basename}[Gio.File.get_basename]}).
    These names are byte strings that are used to identify the file on the
    filesystem (relative to its parent directory) and there is no guarantees
    that they have any particular charset encoding or even make any sense at
    all. If you want to use filenames in a user interface you should use the
    display name that you can get by requesting the
    [G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME] attribute with
    {{!Ocgio.File.class-type-file_t.method-query_info}[Gio.File.query_info]}.
    This is guaranteed to be in UTF-8 and can be used in a user interface. But
    always store the real basename or the [GFile] to use to actually access the
    file, because there is no way to go from a display name to the actual name.

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
    operation, producing a
    {{!Ocgio.Async_result.class-type-async_result_t}[Gio.AsyncResult]} which is
    then passed to the function’s matching [_finish()] operation.

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

class file : Raw.File.t -> file_t
(** Wraps a raw handle of {!Ocgio.Raw.File.t}. *)

(** {1:description Description}

    [GFile] is a high level abstraction for manipulating files on a virtual file
    system. [GFile]s are lightweight, immutable objects that do no I/O upon
    creation. It is necessary to understand that [GFile] objects do not
    represent files, merely an identifier for a file. All file content I/O is
    implemented as streaming operations (see
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} and
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]}).

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
      {{!Ocgio.File.class-type-file_t.method-get_parse_name}[Gio.File.get_parse_name]}.
    - [Gio.File.new_build_filename] or [Gio.File.new_build_filenamev] to create
      a file from path elements.

    One way to think of a [GFile] is as an abstraction of a pathname. For normal
    files the system pathname is what is stored internally, but as [GFile]s are
    extensible it could also be something else that corresponds to a pathname in
    a userspace implementation of a filesystem.

    [GFile]s make up hierarchies of directories and files that correspond to the
    files on a filesystem. You can move through the file system with [GFile]
    using
    {{!Ocgio.File.class-type-file_t.method-get_parent}[Gio.File.get_parent]} to
    get an identifier for the parent directory,
    {{!Ocgio.File.class-type-file_t.method-get_child}[Gio.File.get_child]} to
    get a child within a directory, and
    {{!Ocgio.File.class-type-file_t.method-resolve_relative_path}[Gio.File.resolve_relative_path]}
    to resolve a relative path between two [GFile]s. There can be multiple
    hierarchies, so you may not end up at the same root if you repeatedly call
    {{!Ocgio.File.class-type-file_t.method-get_parent}[Gio.File.get_parent]} on
    two different files.

    All [GFile]s have a basename (get with
    {{!Ocgio.File.class-type-file_t.method-get_basename}[Gio.File.get_basename]}).
    These names are byte strings that are used to identify the file on the
    filesystem (relative to its parent directory) and there is no guarantees
    that they have any particular charset encoding or even make any sense at
    all. If you want to use filenames in a user interface you should use the
    display name that you can get by requesting the
    [G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME] attribute with
    {{!Ocgio.File.class-type-file_t.method-query_info}[Gio.File.query_info]}.
    This is guaranteed to be in UTF-8 and can be used in a user interface. But
    always store the real basename or the [GFile] to use to actually access the
    file, because there is no way to go from a display name to the actual name.

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
    operation, producing a
    {{!Ocgio.Async_result.class-type-async_result_t}[Gio.AsyncResult]} which is
    then passed to the function’s matching [_finish()] operation.

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

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
