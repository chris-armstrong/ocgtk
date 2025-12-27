(* Signal class defined in gcss_provider_signals.ml *)

(* High-level class for CssProvider *)
class css_provider (obj : Css_provider.t) = object (self)
  inherit Gcss_provider_signals.css_provider_signals obj

  method load_from_path : string -> unit =
    fun path ->
      (Css_provider.load_from_path obj path)

  method load_from_resource : string -> unit =
    fun resource_path ->
      (Css_provider.load_from_resource obj resource_path)

  method load_from_string : string -> unit =
    fun string ->
      (Css_provider.load_from_string obj string)

  method load_named : string -> string option -> unit =
    fun name variant ->
      (Css_provider.load_named obj name variant)

  method to_string : unit -> string =
    fun () ->
      (Css_provider.to_string obj)

    method as_css_provider = obj
end

