class settings_backend : Settings_backend.t ->
  object
    method path_writable_changed : string -> unit
    method writable_changed : string -> unit
    method as_settings_backend : Settings_backend.t
  end

