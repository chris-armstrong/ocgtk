(** Acts as a lightweight registry for possible valid file attributes. The
    registry stores Key-Value pair formats as [GFileAttributeInfos].

    Its methods, signals and properties are on
    {!class-type-file_attribute_info_list_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.File_attribute_info_list}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FileAttributeInfoList].}

    Acts as a lightweight registry for possible valid file attributes. The
    registry stores Key-Value pair formats as [GFileAttributeInfos]. *)
class type file_attribute_info_list_t = object
  method add :
    string -> Enums.fileattributetype -> Enums.fileattributeinfoflags -> unit
  (** Adds a new attribute with [name] to the [list], setting its [type] and
      [flags]. *)

  method dup : unit -> Raw.File_attribute_info_list.t
  (** Makes a duplicate of a file attribute info list. *)

  method lookup : string -> Raw.File_attribute_info.t
  (** Gets the file attribute with the name [name] from [list]. *)

  method ref : unit -> Raw.File_attribute_info_list.t
  (** References a file attribute info list. *)

  method as_file_attribute_info_list : Raw.File_attribute_info_list.t
end

class file_attribute_info_list :
  Raw.File_attribute_info_list.t ->
  file_attribute_info_list_t
(** Wraps a raw handle of {!Ocgio.Raw.File_attribute_info_list.t}. *)

(** {1:constructors Constructors} *)

val new_ : unit -> file_attribute_info_list_t
(** Creates a new file attribute info list. *)
