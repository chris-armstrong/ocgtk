class type settings_schema_source_t = object
  method lookup : string -> bool -> Raw.Settings_schema.t option
  method ref : unit -> Raw.Settings_schema_source.t
  method as_settings_schema_source : Raw.Settings_schema_source.t
end

class settings_schema_source :
  Raw.Settings_schema_source.t ->
  settings_schema_source_t

val new_from_directory :
  string ->
  Raw.Settings_schema_source.t option ->
  bool ->
  (settings_schema_source_t, GError.t) result
