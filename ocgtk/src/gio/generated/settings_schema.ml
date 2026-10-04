(* GENERATED CODE - DO NOT EDIT *)
(* SettingsSchema: SettingsSchema *)

[@@@ocaml.text
"The [Gio.SettingsSchemaSource] and [GSettingsSchema] APIs provide a\n\
 mechanism for advanced control over the loading of schemas and a\n\
 mechanism for introspecting their content.\n\n\
 Plugin loading systems that wish to provide plugins a way to access\n\
 settings face the problem of how to make the schemas for these\n\
 settings visible to GSettings.  Typically, a plugin will want to ship\n\
 the schema along with itself and it won't be installed into the\n\
 standard system directories for schemas.\n\n\
 [Gio.SettingsSchemaSource] provides a mechanism for dealing with this\n\
 by allowing the creation of a new ‘schema source’ from which schemas can\n\
 be acquired.  This schema source can then become part of the metadata\n\
 associated with the plugin and queried whenever the plugin requires\n\
 access to some settings.\n\n\
 Consider the following example:\n\n\
 {[\n\
 typedef struct\n\
 {\n\
\   …\n\
\   GSettingsSchemaSource *schema_source;\n\
\   …\n\
 } Plugin;\n\n\
 Plugin *\n\
 initialise_plugin (const gchar *dir)\n\
 {\n\
\  Plugin *plugin;\n\n\
\  …\n\n\
\  plugin->schema_source =\n\
\    g_settings_schema_source_new_from_directory (dir,\n\
\      g_settings_schema_source_get_default (), FALSE, NULL);\n\n\
\  …\n\n\
\  return plugin;\n\
 }\n\n\
 …\n\n\
 GSettings *\n\
 plugin_get_settings (Plugin      *plugin,\n\
\                     const gchar *schema_id)\n\
 {\n\
\  GSettingsSchema *schema;\n\n\
\  if (schema_id == NULL)\n\
\    schema_id = plugin->identifier;\n\n\
\  schema = g_settings_schema_source_lookup (plugin->schema_source,\n\
\                                            schema_id, FALSE);\n\n\
\  if (schema == NULL)\n\
\    {\n\
\      … disable the plugin or abort, etc …\n\
\    }\n\n\
\  return g_settings_new_full (schema, NULL, NULL);\n\
 }\n\
 ]}\n\n\
 The code above shows how hooks should be added to the code that\n\
 initialises (or enables) the plugin to create the schema source and\n\
 how an API can be added to the plugin system to provide a convenient\n\
 way for the plugin to access its settings, using the schemas that it\n\
 ships.\n\n\
 From the standpoint of the plugin, it would need to ensure that it\n\
 ships a gschemas.compiled file as part of itself, and then simply do\n\
 the following:\n\n\
 {[\n\
 {\n\
\  GSettings *settings;\n\
\  gint some_value;\n\n\
\  settings = plugin_get_settings (self, NULL);\n\
\  some_value = g_settings_get_int (settings, \"some-value\");\n\
\  …\n\
 }\n\
 ]}\n\n\
 It's also possible that the plugin system expects the schema source\n\
 files (ie: [.gschema.xml] files) instead of a [gschemas.compiled] file.\n\
 In that case, the plugin loading system must compile the schemas for\n\
 itself before attempting to create the settings source."]

type t = [ `settings_schema ] Gobject.obj

(* Methods *)

external ref : t -> t = "ml_g_settings_schema_ref"
(** Increase the reference count of [schema], returning a new reference. *)

external list_keys : t -> string array = "ml_g_settings_schema_list_keys"
[@@ocaml.doc
  "Introspects the list of keys on [schema].\n\n\
   You should probably not be calling this function from \"normal\" code\n\
   (since you should already know what keys are in your schema).  This\n\
   function is intended for introspection reasons."]

external list_children : t -> string array
  = "ml_g_settings_schema_list_children"
(** Gets the list of children in [schema].

    You should free the return value with g_strfreev() when you are done with
    it. *)

external has_key : t -> string -> bool = "ml_g_settings_schema_has_key"
(** Checks if [schema] has a key named [name]. *)

external get_path : t -> string option = "ml_g_settings_schema_get_path"
(** Gets the path associated with [schema], or [NULL].

    Schemas may be single-instance or relocatable. Single-instance schemas
    correspond to exactly one set of keys in the backend database: those located
    at the path returned by this function.

    Relocatable schemas can be referenced by other schemas and can therefore
    describe multiple sets of keys at different locations. For relocatable
    schemas, this function will return [NULL]. *)

external get_key : t -> string -> Settings_schema_key.t
  = "ml_g_settings_schema_get_key"
(** Gets the key named [name] from [schema].

    It is a programmer error to request a key that does not exist. See
    g_settings_schema_list_keys(). *)

external get_id : t -> string = "ml_g_settings_schema_get_id"
(** Get the ID of [schema]. *)

external get_type : unit -> Gobject.Type.t = "ml_gio_settings_schema_get_type"
