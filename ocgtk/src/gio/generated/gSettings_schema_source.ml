(* High-level class for SettingsSchemaSource *)
class settings_schema_source (obj : Settings_schema_source.t) = object (self)

  method lookup : string -> bool -> Settings_schema.t option =
    fun schema_id recursive ->
      (Settings_schema_source.lookup obj schema_id recursive)

  method ref : unit -> Settings_schema_source.t =
    fun () ->
      (Settings_schema_source.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Settings_schema_source.unref obj)

    method as_settings_schema_source = obj
end

