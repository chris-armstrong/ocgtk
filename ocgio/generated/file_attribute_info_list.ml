class type file_attribute_info_list_t = object
  method add :
    string -> Enums.fileattributetype -> Enums.fileattributeinfoflags -> unit

  method dup : unit -> Raw.File_attribute_info_list.t
  method lookup : string -> Raw.File_attribute_info.t
  method ref : unit -> Raw.File_attribute_info_list.t
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
