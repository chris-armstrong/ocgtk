(** Information about a specific attribute.

    Its methods, signals and properties are on
    {!class-type-file_attribute_info_t}. The functions it is built on are in
    {!Ocgio.Raw.File_attribute_info}. *)

(** The methods, signals and properties of a [FileAttributeInfo]. *)
class type file_attribute_info_t = object
  method as_file_attribute_info : Raw.File_attribute_info.t
end

class file_attribute_info : Raw.File_attribute_info.t -> file_attribute_info_t
(** Wraps a raw handle of {!Ocgio.Raw.File_attribute_info.t}. *)
