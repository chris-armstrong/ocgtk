class type settings_schema_source_t = object
    method lookup : string -> bool -> Settings_schema.t option
    method ref : unit -> Settings_schema_source.t
    method unref : unit -> unit
    method as_settings_schema_source : Settings_schema_source.t
end

(* High-level class for SettingsSchemaSource *)
class settings_schema_source (obj : Settings_schema_source.t) : settings_schema_source_t = object (self)

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

let new_from_directory (directory : string) (parent : Settings_schema_source.t option) (trusted : bool) : (settings_schema_source_t, GError.t) result =
  let obj_ = Settings_schema_source.new_from_directory directory parent trusted in
Result.map (fun obj_ ->  new settings_schema_source obj_) obj_

