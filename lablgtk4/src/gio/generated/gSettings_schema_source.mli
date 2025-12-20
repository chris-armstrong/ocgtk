class settings_schema_source : Settings_schema_source.t ->
  object
    method lookup : string -> bool -> Settings_schema.t option
    method ref : unit -> Settings_schema_source.t
    method unref : unit -> unit
    method as_settings_schema_source : Settings_schema_source.t
  end

