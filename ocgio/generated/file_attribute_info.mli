(** Information about a specific attribute.

    Its methods, signals and properties are on
    {!class-type-file_attribute_info_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.File_attribute_info}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FileAttributeInfo].}

    Information about a specific attribute. *)
class type file_attribute_info_t = object
  (** {2:conversions Conversions} *)

  method as_file_attribute_info : Raw.File_attribute_info.t
end

class file_attribute_info : Raw.File_attribute_info.t -> file_attribute_info_t
(** Wraps a raw handle of {!Ocgio.Raw.File_attribute_info.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
