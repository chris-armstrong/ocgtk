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

(* High-level class for FileAttributeInfoList *)
class file_attribute_info_list (obj : Raw.File_attribute_info_list.t) :
  file_attribute_info_list_t =
  object (self)
    method add :
        string ->
        Enums.fileattributetype ->
        Enums.fileattributeinfoflags ->
        unit =
      fun name type_ flags ->
        Raw.File_attribute_info_list.add obj name type_ flags

    method dup : unit -> Raw.File_attribute_info_list.t =
      fun () -> Raw.File_attribute_info_list.dup obj

    method lookup : string -> Raw.File_attribute_info.t =
      fun name -> Raw.File_attribute_info_list.lookup obj name

    method ref : unit -> Raw.File_attribute_info_list.t =
      fun () -> Raw.File_attribute_info_list.ref obj

    method as_file_attribute_info_list = obj
  end

let new_ () : file_attribute_info_list_t =
  new file_attribute_info_list (Raw.File_attribute_info_list.new_ ())
