class type settings_backend_t = object
    method path_writable_changed : string -> unit
    method writable_changed : string -> unit
    method as_settings_backend : Settings_backend.t
end

(* High-level class for SettingsBackend *)
class settings_backend (obj : Settings_backend.t) : settings_backend_t = object (self)

  method path_writable_changed : string -> unit =
    fun path ->
      (Settings_backend.path_writable_changed obj path)

  method writable_changed : string -> unit =
    fun key ->
      (Settings_backend.writable_changed obj key)

    method as_settings_backend = obj
end

