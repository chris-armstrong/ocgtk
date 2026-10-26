class type language_t = object
  method get_sample_string : unit -> string
  method includes_script : Enums.script -> bool
  method matches : string -> bool
  method to_string : unit -> string
  method as_language : Raw.Language.t
end

class language : Raw.Language.t -> language_t
