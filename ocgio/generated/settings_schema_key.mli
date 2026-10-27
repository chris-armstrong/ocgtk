(** [GSettingsSchemaKey] is an opaque data structure and can only be accessed
    using the following functions.

    Its methods, signals and properties are on
    {!class-type-settings_schema_key_t}. The functions it is built on are in
    {!Ocgio.Raw.Settings_schema_key}. *)

(** The methods, signals and properties of a [GSettingsSchemaKey]. *)
class type settings_schema_key_t = object
  method get_default_value : unit -> Gvariant.t
  method get_description : unit -> string option
  method get_name : unit -> string
  method get_range : unit -> Gvariant.t
  method get_summary : unit -> string option
  method get_value_type : unit -> Gvariant_type.t
  method range_check : Gvariant.t -> bool
  method ref : unit -> Raw.Settings_schema_key.t
  method as_settings_schema_key : Raw.Settings_schema_key.t
end

class settings_schema_key : Raw.Settings_schema_key.t -> settings_schema_key_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Settings_schema_key.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GSettingsSchemaKey], give one already wrapped. *)
