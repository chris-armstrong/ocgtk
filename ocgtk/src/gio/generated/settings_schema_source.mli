(* GENERATED CODE - DO NOT EDIT *)
(* SettingsSchemaSource: SettingsSchemaSource *)

(** This is an opaque structure type.  You may not access it directly. *)
type t = [`settings_schema_source] Gobject.obj

(* Methods *)
(** Decrease the reference count of @source, possibly freeing it. *)
external unref : t -> unit = "ml_g_settings_schema_source_unref"

(** Increase the reference count of @source, returning a new reference. *)
external ref : t -> t = "ml_g_settings_schema_source_ref"

(** Looks up a schema with the identifier @schema_id in @source.

This function is not required for normal uses of #GSettings but it
may be useful to authors of plugin management systems or to those who
want to introspect the content of schemas.

If the schema isn't found directly in @source and @recursive is %TRUE
then the parent sources will also be checked.

If the schema isn't found, %NULL is returned. *)
external lookup : t -> string -> bool -> Settings_schema.t option = "ml_g_settings_schema_source_lookup"

