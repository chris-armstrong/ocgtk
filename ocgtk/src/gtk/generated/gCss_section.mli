class css_section : Css_section.t ->
  object
    method get_end_location : unit -> Css_location.t
    method get_parent : unit -> Css_section.t option
    method get_start_location : unit -> Css_location.t
    method ref : unit -> Css_section.t
    method to_string : unit -> string
    method unref : unit -> unit
    method as_css_section : Css_section.t
  end

