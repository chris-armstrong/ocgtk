class type language_t = object
    method get_sample_string : unit -> string
    method includes_script : Pango_enums.script -> bool
    method matches : string -> bool
    method to_string : unit -> string
    method as_language : Language.t
end

class language : Language.t -> language_t

