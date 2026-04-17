class type settings_t = object
    inherit Gsettings_signals.settings_signals
    method apply : unit -> unit
    method bind : string -> [`object_] Gobject.obj -> string -> Gio_enums.settingsbindflags -> unit
    method bind_writable : string -> [`object_] Gobject.obj -> string -> bool -> unit
    method create_action : string -> GAction.action_t
    method delay : unit -> unit
    method get_boolean : string -> bool
    method get_child : string -> settings_t
    method get_default_value : string -> Gvariant.t option
    method get_double : string -> float
    method get_enum : string -> int
    method get_flags : string -> int
    method get_has_unapplied : unit -> bool
    method get_int : string -> int
    method get_int64 : string -> int64
    method get_range : string -> Gvariant.t
    method get_string : string -> string
    method get_strv : string -> string array
    method get_uint : string -> int
    method get_uint64 : string -> UInt64.t
    method get_user_value : string -> Gvariant.t option
    method get_value : string -> Gvariant.t
    method is_writable : string -> bool
    method list_children : unit -> string array
    method list_keys : unit -> string array
    method range_check : string -> Gvariant.t -> bool
    method reset : string -> unit
    method revert : unit -> unit
    method set_boolean : string -> bool -> bool
    method set_double : string -> float -> bool
    method set_enum : string -> int -> bool
    method set_flags : string -> int -> bool
    method set_int : string -> int -> bool
    method set_int64 : string -> int64 -> bool
    method set_string : string -> string -> bool
    method set_strv : string -> string array option -> bool
    method set_uint : string -> int -> bool
    method set_uint64 : string -> UInt64.t -> bool
    method set_value : string -> Gvariant.t -> bool
    method delay_apply : bool
    method path : string
    method schema : string
    method schema_id : string
    method settings_schema : Settings_schema.t
    method as_settings : Settings.t
end

class settings : Settings.t -> settings_t

val new_ : string -> settings_t
val new_with_path : string -> string -> settings_t
