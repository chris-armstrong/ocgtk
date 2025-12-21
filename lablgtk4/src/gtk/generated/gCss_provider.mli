class css_provider : Css_provider.t ->
  object
    inherit Gcss_provider_signals.css_provider_signals
    method load_from_resource : string -> unit
    method load_from_string : string -> unit
    method load_named : string -> string option -> unit
    method to_string : unit -> string
    method as_css_provider : Css_provider.t
  end

