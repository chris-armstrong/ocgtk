class settings_schema_key : Settings_schema_key.t ->
  object
    method get_description : unit -> string option
    method get_name : unit -> string
    method get_summary : unit -> string option
    method ref : unit -> Settings_schema_key.t
    method unref : unit -> unit
    method as_settings_schema_key : Settings_schema_key.t
  end

