(** An opaque type representing a list of files.

    Its methods, signals and properties are on {!class-type-file_list_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.File_list}. *)

(** {b The methods, signals and properties of a [FileList].}

    An opaque type representing a list of files. *)
class type file_list_t = object
  method get_files : unit -> Ocgio.File.file_t list
  (** Retrieves the list of files inside a [GdkFileList].

      This function is meant for language bindings. *)

  method as_file_list : Raw.File_list.t
end

class file_list : Raw.File_list.t -> file_list_t
(** Wraps a raw handle of {!Ocgdk.Raw.File_list.t}. *)

(** {2:constructors Constructors} *)

val new_from_array : Ocgio.Raw.File.t array -> Gsize.t -> file_list_t
(** Creates a new [GdkFileList] for the given array of files.

    This function is meant to be used by language bindings. *)

val new_from_list : Ocgio.Raw.File.t list -> file_list_t
(** Creates a new files list container from a singly linked list of [GFile]
    instances.

    This function is meant to be used by language bindings *)
