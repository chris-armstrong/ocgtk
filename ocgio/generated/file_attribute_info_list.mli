(** Acts as a lightweight registry for possible valid file attributes. The
    registry stores Key-Value pair formats as [GFileAttributeInfos].

    Its methods, signals and properties are on
    {!class-type-file_attribute_info_list_t}. The functions it is built on are
    in {!Ocgio.Raw.File_attribute_info_list}. *)

(** The methods, signals and properties of a [GFileAttributeInfoList]. *)
class type file_attribute_info_list_t = object
  method add :
    string -> Enums.fileattributetype -> Enums.fileattributeinfoflags -> unit

  method dup : unit -> Raw.File_attribute_info_list.t
  method lookup : string -> Raw.File_attribute_info.t
  method ref : unit -> Raw.File_attribute_info_list.t
  method as_file_attribute_info_list : Raw.File_attribute_info_list.t
end

class file_attribute_info_list :
  Raw.File_attribute_info_list.t ->
  file_attribute_info_list_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.File_attribute_info_list.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GFileAttributeInfoList], give one already wrapped. *)

val new_ : unit -> file_attribute_info_list_t
