class type settings_schema_source_t = object
  method lookup : string -> bool -> Raw.Settings_schema.t option
  method ref : unit -> Raw.Settings_schema_source.t
  method as_settings_schema_source : Raw.Settings_schema_source.t
end

(* High-level class for SettingsSchemaSource *)
class settings_schema_source (obj : Raw.Settings_schema_source.t) :
  settings_schema_source_t =
  object (self)
    method lookup : string -> bool -> Raw.Settings_schema.t option =
      fun schema_id recursive ->
        Raw.Settings_schema_source.lookup obj schema_id recursive

    method ref : unit -> Raw.Settings_schema_source.t =
      fun () -> Raw.Settings_schema_source.ref obj

    method as_settings_schema_source = obj
  end

let new_from_directory (directory : string)
    (parent : Raw.Settings_schema_source.t option) (trusted : bool) :
    (settings_schema_source_t, GError.t) result =
  let obj_ =
    Raw.Settings_schema_source.new_from_directory directory parent trusted
  in
  Result.map (fun obj_ -> new settings_schema_source obj_) obj_
