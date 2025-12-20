(* High-level class for SettingsSchema *)
class settings_schema (obj : Settings_schema.t) = object (self)

  method get_id : unit -> string =
    fun () ->
      (Settings_schema.get_id obj)

  method get_key : string -> Settings_schema_key.t =
    fun name ->
      (Settings_schema.get_key obj name)

  method get_path : unit -> string option =
    fun () ->
      (Settings_schema.get_path obj)

  method has_key : string -> bool =
    fun name ->
      (Settings_schema.has_key obj name)

  method ref : unit -> Settings_schema.t =
    fun () ->
      (Settings_schema.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Settings_schema.unref obj)

    method as_settings_schema = obj
end

