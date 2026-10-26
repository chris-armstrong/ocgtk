class type language_t = object
  method get_sample_string : unit -> string
  method includes_script : Enums.script -> bool
  method matches : string -> bool
  method to_string : unit -> string
  method as_language : Raw.Language.t
end

(* High-level class for Language *)
class language (obj : Raw.Language.t) : language_t =
  object (self)
    method get_sample_string : unit -> string =
      fun () -> Raw.Language.get_sample_string obj

    method includes_script : Enums.script -> bool =
      fun script -> Raw.Language.includes_script obj script

    method matches : string -> bool =
      fun range_list -> Raw.Language.matches obj range_list

    method to_string : unit -> string = fun () -> Raw.Language.to_string obj
    method as_language = obj
  end
