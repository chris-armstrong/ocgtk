class css_section : Css_section.t ->
  object
    method get_parent : unit -> Css_section.t option
    method ref : unit -> Css_section.t
    method unref : unit -> unit
    method as_css_section : Css_section.t
  end

