(* GENERATED CODE - DO NOT EDIT *)
(* Settings: Settings *)

type t = [`settings | `object_] Gobject.obj

(** Create a new Settings *)
external new_ : string -> t = "ml_g_settings_new"

(** Create a new Settings *)
external new_full : Settings_schema.t -> Settings_backend.t option -> string option -> t = "ml_g_settings_new_full"

(** Create a new Settings *)
external new_with_backend : string -> Settings_backend.t -> t = "ml_g_settings_new_with_backend"

(** Create a new Settings *)
external new_with_backend_and_path : string -> Settings_backend.t -> string -> t = "ml_g_settings_new_with_backend_and_path"

(** Create a new Settings *)
external new_with_path : string -> string -> t = "ml_g_settings_new_with_path"

(* Methods *)
(** Sets @key in @settings to @value.

A convenience variant of g_settings_set() for 32-bit unsigned
integers.

It is a programmer error to give a @key that isn't specified as
having a uint32 type in the schema for @settings. *)
external set_uint : t -> string -> int -> bool = "ml_g_settings_set_uint"

(** Sets @key in @settings to @value.

A convenience variant of g_settings_set() for strings.

It is a programmer error to give a @key that isn't specified as
having a string type in the schema for @settings. *)
external set_string : t -> string -> string -> bool = "ml_g_settings_set_string"

(** Sets @key in @settings to @value.

A convenience variant of g_settings_set() for 32-bit integers.

It is a programmer error to give a @key that isn't specified as
having a int32 type in the schema for @settings. *)
external set_int : t -> string -> int -> bool = "ml_g_settings_set_int"

(** Looks up the flags type nicks for the bits specified by @value, puts
them in an array of strings and writes the array to @key, within
@settings.

It is a programmer error to give a @key that isn't contained in the
schema for @settings or is not marked as a flags type, or for @value
to contain any bits that are not value for the named type.

After performing the write, accessing @key directly with
g_settings_get_strv() will return an array of 'nicks'; one for each
bit in @value. *)
external set_flags : t -> string -> int -> bool = "ml_g_settings_set_flags"

(** Looks up the enumerated type nick for @value and writes it to @key,
within @settings.

It is a programmer error to give a @key that isn't contained in the
schema for @settings or is not marked as an enumerated type, or for
@value not to be a valid value for the named type.

After performing the write, accessing @key directly with
g_settings_get_string() will return the 'nick' associated with
@value. *)
external set_enum : t -> string -> int -> bool = "ml_g_settings_set_enum"

(** Sets @key in @settings to @value.

A convenience variant of g_settings_set() for doubles.

It is a programmer error to give a @key that isn't specified as
having a 'double' type in the schema for @settings. *)
external set_double : t -> string -> float -> bool = "ml_g_settings_set_double"

(** Sets @key in @settings to @value.

A convenience variant of g_settings_set() for booleans.

It is a programmer error to give a @key that isn't specified as
having a boolean type in the schema for @settings. *)
external set_boolean : t -> string -> bool -> bool = "ml_g_settings_set_boolean"

(** Reverts all non-applied changes to the settings.  This function
does nothing unless @settings is in 'delay-apply' mode; see
g_settings_delay().  In the normal case settings are always applied
immediately.

Change notifications will be emitted for affected keys. *)
external revert : t -> unit = "ml_g_settings_revert"

(** Resets @key to its default value.

This call resets the key, as much as possible, to its default value.
That might be the value specified in the schema or the one set by the
administrator. *)
external reset : t -> string -> unit = "ml_g_settings_reset"

(** Finds out if a key can be written or not *)
external is_writable : t -> string -> bool = "ml_g_settings_is_writable"

(** Gets the value that is stored at @key in @settings.

A convenience variant of g_settings_get() for 32-bit unsigned
integers.

It is a programmer error to give a @key that isn't specified as
having a uint32 type in the schema for @settings. *)
external get_uint : t -> string -> int = "ml_g_settings_get_uint"

(** Gets the value that is stored at @key in @settings.

A convenience variant of g_settings_get() for strings.

It is a programmer error to give a @key that isn't specified as
having a string type in the schema for @settings. *)
external get_string : t -> string -> string = "ml_g_settings_get_string"

(** Gets the value that is stored at @key in @settings.

A convenience variant of g_settings_get() for 32-bit integers.

It is a programmer error to give a @key that isn't specified as
having a int32 type in the schema for @settings. *)
external get_int : t -> string -> int = "ml_g_settings_get_int"

(** Returns whether the #GSettings object has any unapplied
changes.  This can only be the case if it is in 'delayed-apply' mode. *)
external get_has_unapplied : t -> bool = "ml_g_settings_get_has_unapplied"

(** Gets the value that is stored in @settings for @key and converts it
to the flags value that it represents.

In order to use this function the type of the value must be an array
of strings and it must be marked in the schema file as a flags type.

It is a programmer error to give a @key that isn't contained in the
schema for @settings or is not marked as a flags type.

If the value stored in the configuration database is not a valid
value for the flags type then this function will return the default
value. *)
external get_flags : t -> string -> int = "ml_g_settings_get_flags"

(** Gets the value that is stored in @settings for @key and converts it
to the enum value that it represents.

In order to use this function the type of the value must be a string
and it must be marked in the schema file as an enumerated type.

It is a programmer error to give a @key that isn't contained in the
schema for @settings or is not marked as an enumerated type.

If the value stored in the configuration database is not a valid
value for the enumerated type then this function will return the
default value. *)
external get_enum : t -> string -> int = "ml_g_settings_get_enum"

(** Gets the value that is stored at @key in @settings.

A convenience variant of g_settings_get() for doubles.

It is a programmer error to give a @key that isn't specified as
having a 'double' type in the schema for @settings. *)
external get_double : t -> string -> float = "ml_g_settings_get_double"

(** Creates a child settings object which has a base path of
`base-path/@name`, where `base-path` is the base path of
@settings.

The schema for the child settings object must have been declared
in the schema of @settings using a `<child>` element.

The created child settings object will inherit the #GSettings:delay-apply
mode from @settings. *)
external get_child : t -> string -> t = "ml_g_settings_get_child"

(** Gets the value that is stored at @key in @settings.

A convenience variant of g_settings_get() for booleans.

It is a programmer error to give a @key that isn't specified as
having a boolean type in the schema for @settings. *)
external get_boolean : t -> string -> bool = "ml_g_settings_get_boolean"

(** Changes the #GSettings object into 'delay-apply' mode. In this
mode, changes to @settings are not immediately propagated to the
backend, but kept locally until g_settings_apply() is called. *)
external delay : t -> unit = "ml_g_settings_delay"

(** Creates a #GAction corresponding to a given #GSettings key.

The action has the same name as the key.

The value of the key becomes the state of the action and the action
is enabled when the key is writable.  Changing the state of the
action results in the key being written to.  Changes to the value or
writability of the key cause appropriate change notifications to be
emitted for the action.

For boolean-valued keys, action activations take no parameter and
result in the toggling of the value.  For all other types,
activations take the new value for the key (which must have the
correct type). *)
external create_action : t -> string -> Action.t = "ml_g_settings_create_action"

(** Applies any changes that have been made to the settings.  This
function does nothing unless @settings is in 'delay-apply' mode;
see g_settings_delay().  In the normal case settings are always
applied immediately. *)
external apply : t -> unit = "ml_g_settings_apply"

(* Properties *)

(** Get property: backend *)
external get_backend : t -> Settings_backend.t = "ml_gtk_settings_get_backend"

(** Get property: delay-apply *)
external get_delay_apply : t -> bool = "ml_gtk_settings_get_delay_apply"

(** Get property: path *)
external get_path : t -> string = "ml_gtk_settings_get_path"

(** Get property: schema *)
external get_schema : t -> string = "ml_gtk_settings_get_schema"

(** Get property: schema-id *)
external get_schema_id : t -> string = "ml_gtk_settings_get_schema_id"

(** Get property: settings-schema *)
external get_settings_schema : t -> Settings_schema.t = "ml_gtk_settings_get_settings_schema"

