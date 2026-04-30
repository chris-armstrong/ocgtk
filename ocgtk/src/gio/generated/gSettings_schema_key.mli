class type settings_schema_key_t = object
  method get_default_value : unit -> Gvariant.t
  method get_description : unit -> string option
  method get_name : unit -> string
  method get_range : unit -> Gvariant.t
  method get_summary : unit -> string option
  method get_value_type : unit -> Gvariant_type.t
  method range_check : Gvariant.t -> bool
  method ref : unit -> Settings_schema_key.t
  method as_settings_schema_key : Settings_schema_key.t
end

class settings_schema_key : Settings_schema_key.t -> settings_schema_key_t
