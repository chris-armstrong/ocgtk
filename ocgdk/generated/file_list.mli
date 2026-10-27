(** An opaque type representing a list of files.

    Its methods, signals and properties are on {!class-type-file_list_t}. The
    functions it is built on are in {!Ocgdk.Raw.File_list}. *)

(** The methods, signals and properties of a [GdkFileList]. *)
class type file_list_t = object
  method get_files : unit -> Ocgio.File.file_t list
  (** Retrieves the list of files inside a [GdkFileList].

      This function is meant for language bindings. *)

  method as_file_list : Raw.File_list.t
end

class file_list : Raw.File_list.t -> file_list_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.File_list.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkFileList], give one already wrapped. *)

val new_from_array : Ocgio.Raw.File.t array -> Gsize.t -> file_list_t
val new_from_list : Ocgio.Raw.File.t list -> file_list_t
