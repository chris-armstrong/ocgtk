class settings : Settings.t ->
  object
    inherit Gsettings_signals.settings_signals
    method apply : unit -> unit
    method create_action : string -> GAction.action
    method delay : unit -> unit
    method get_boolean : string -> bool
    method get_child : string -> settings
    method get_double : string -> float
    method get_enum : string -> int
    method get_flags : string -> int
    method get_has_unapplied : unit -> bool
    method get_int : string -> int
    method get_string : string -> string
    method get_strv : string -> string array
    method get_uint : string -> int
    method is_writable : string -> bool
    method list_children : unit -> string array
    method list_keys : unit -> string array
    method reset : string -> unit
    method revert : unit -> unit
    method set_boolean : string -> bool -> bool
    method set_double : string -> float -> bool
    method set_enum : string -> int -> bool
    method set_flags : string -> int -> bool
    method set_int : string -> int -> bool
    method set_string : string -> string -> bool
    method set_strv : string -> string array option -> bool
    method set_uint : string -> int -> bool
    method backend : GSettings_backend.settings_backend
    method delay_apply : bool
    method path : string
    method schema : string
    method schema_id : string
    method settings_schema : Settings_schema.t
    method as_settings : Settings.t
  end

