class type language_t = object
    method get_sample_string : unit -> string
    method includes_script : Pango_enums.script -> bool
    method matches : string -> bool
    method to_string : unit -> string
    method as_language : Language.t
end

(* High-level class for Language *)
class language (obj : Language.t) : language_t = object (self)

  method get_sample_string : unit -> string =
    fun () ->
      (Language.get_sample_string obj)

  method includes_script : Pango_enums.script -> bool =
    fun script ->
      (Language.includes_script obj script)

  method matches : string -> bool =
    fun range_list ->
      (Language.matches obj range_list)

  method to_string : unit -> string =
    fun () ->
      (Language.to_string obj)

    method as_language = obj
end

