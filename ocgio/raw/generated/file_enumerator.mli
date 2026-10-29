(* GENERATED CODE - DO NOT EDIT *)
(* FileEnumerator, a member of the cyclic module App_info_cycle_64c425a0 *)

(** [GFileEnumerator] allows you to operate on a set of
    {{!Ocgio.Raw.File}[Gio.File]} objects, returning a
    {{!Ocgio.Raw.File_info}[Gio.FileInfo]} structure for each file enumerated
    (e.g.
    {{!Ocgio.Raw.File.val-enumerate_children}[Gio.File.enumerate_children]} will
    return a [GFileEnumerator] for each of the children within a directory).

    To get the next file's information from a [GFileEnumerator], use
    {{!Ocgio.Raw.File_enumerator.val-next_file}[Gio.FileEnumerator.next_file]}
    or its asynchronous version, [Gio.FileEnumerator.next_files_async]. Note
    that the asynchronous version will return a list of
    {{!Ocgio.Raw.File_info}[Gio.FileInfo]} objects, whereas the synchronous will
    only return the next file in the enumerator.

    The ordering of returned files is unspecified for non-Unix platforms; for
    more information, see [GLib.Dir.read_name]. On Unix, when operating on local
    files, returned files will be sorted by inode number. Effectively you can
    assume that the ordering of returned files will be stable between successive
    calls (and applications) assuming the directory is unchanged.

    If your application needs a specific ordering, such as by name or
    modification time, you will have to implement that in your application code.

    To close a [GFileEnumerator], use
    {{!Ocgio.Raw.File_enumerator.val-close}[Gio.FileEnumerator.close]}, or its
    asynchronous version, [Gio.FileEnumerator.close_async]. Once a
    [GFileEnumerator] is closed, no further actions may be performed on it, and
    it should be freed with [GObject.Object.unref].

    The class built on this module is in {!Ocgio.File_enumerator}. *)

include module type of struct
  include App_info_cycle_64c425a0.File_enumerator
end
