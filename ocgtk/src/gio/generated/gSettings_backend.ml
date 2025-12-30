(* High-level class for SettingsBackend *)
class settings_backend (obj : Settings_backend.t) = object (self)

  method path_writable_changed : string -> unit =
    fun path ->
      (Settings_backend.path_writable_changed obj path)

  method writable_changed : string -> unit =
    fun key ->
      (Settings_backend.writable_changed obj key)

    method as_settings_backend = obj
end

