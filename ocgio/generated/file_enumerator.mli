(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for FileEnumerator from cyclic group App_info_cycle_64c425a0 *)

(** [GFileEnumerator] allows you to operate on a set of
    {{!Ocgio.File.class-type-file_t}[Gio.File]} objects, returning a
    {{!Ocgio.File_info.class-type-file_info_t}[Gio.FileInfo]} structure for each
    file enumerated (e.g. [Gio.File.enumerate_children] will return a
    [GFileEnumerator] for each of the children within a directory).

    Its methods, signals and properties are on {!class-type-file_enumerator_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.File_enumerator}. *)

(** {1:class Class} *)

class type file_enumerator_t = App_info_cycle_64c425a0.file_enumerator_t
(** {b The methods, signals and properties of a [FileEnumerator].}

    [GFileEnumerator] allows you to operate on a set of
    {{!Ocgio.File.class-type-file_t}[Gio.File]} objects, returning a
    {{!Ocgio.File_info.class-type-file_info_t}[Gio.FileInfo]} structure for each
    file enumerated (e.g. [Gio.File.enumerate_children] will return a
    [GFileEnumerator] for each of the children within a directory).

    To get the next file's information from a [GFileEnumerator], use
    [Gio.FileEnumerator.next_file] or its asynchronous version,
    [Gio.FileEnumerator.next_files_async]. Note that the asynchronous version
    will return a list of
    {{!Ocgio.File_info.class-type-file_info_t}[Gio.FileInfo]} objects, whereas
    the synchronous will only return the next file in the enumerator.

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

class file_enumerator : Raw.File_enumerator.t -> file_enumerator_t
(** Wraps a raw handle of {!Ocgio.Raw.File_enumerator.t}. *)

(** {1:description Description}

    [GFileEnumerator] allows you to operate on a set of
    {{!Ocgio.File.class-type-file_t}[Gio.File]} objects, returning a
    {{!Ocgio.File_info.class-type-file_info_t}[Gio.FileInfo]} structure for each
    file enumerated (e.g. [Gio.File.enumerate_children] will return a
    [GFileEnumerator] for each of the children within a directory).

    To get the next file's information from a [GFileEnumerator], use
    [Gio.FileEnumerator.next_file] or its asynchronous version,
    [Gio.FileEnumerator.next_files_async]. Note that the asynchronous version
    will return a list of
    {{!Ocgio.File_info.class-type-file_info_t}[Gio.FileInfo]} objects, whereas
    the synchronous will only return the next file in the enumerator.

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

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
