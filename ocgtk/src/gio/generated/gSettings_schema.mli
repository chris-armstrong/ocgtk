class settings_schema : Settings_schema.t ->
  object
    method get_id : unit -> string
    method get_key : string -> Settings_schema_key.t
    method get_path : unit -> string option
    method has_key : string -> bool
    method ref : unit -> Settings_schema.t
    method unref : unit -> unit
    method as_settings_schema : Settings_schema.t
  end

