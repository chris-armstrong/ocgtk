(* High-level class for CssSection *)
class css_section (obj : Css_section.t) = object (self)

  method get_end_location : unit -> Css_location.t =
    fun () ->
      (Css_section.get_end_location obj)

  method get_parent : unit -> Css_section.t option =
    fun () ->
      (Css_section.get_parent obj)

  method get_start_location : unit -> Css_location.t =
    fun () ->
      (Css_section.get_start_location obj)

  method ref : unit -> Css_section.t =
    fun () ->
      (Css_section.ref obj)

  method to_string : unit -> string =
    fun () ->
      (Css_section.to_string obj)

  method unref : unit -> unit =
    fun () ->
      (Css_section.unref obj)

    method as_css_section = obj
end

