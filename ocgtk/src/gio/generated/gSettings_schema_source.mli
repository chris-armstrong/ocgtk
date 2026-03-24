class type settings_schema_source_t = object
    method lookup : string -> bool -> Settings_schema.t option
    method ref : unit -> Settings_schema_source.t
    method unref : unit -> unit
    method as_settings_schema_source : Settings_schema_source.t
end

class settings_schema_source : Settings_schema_source.t -> settings_schema_source_t

val new_from_directory : string -> Settings_schema_source.t option -> bool -> (settings_schema_source_t, GError.t) result
