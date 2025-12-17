class settings : Settings.t ->
  object
    method reset_property : string -> unit
    method as_settings : Settings.t
  end

