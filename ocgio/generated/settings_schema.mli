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
 itself before attempting to create the settings source.\n\n\
 Its methods, signals and properties are on {!class-type-settings_schema_t}. \
 The functions it is built on are in {!Ocgio.Raw.Settings_schema}."]

(** The methods, signals and properties of a [GSettingsSchema]. *)
class type settings_schema_t = object
  method get_id : unit -> string
  method get_key : string -> Raw.Settings_schema_key.t
  method get_path : unit -> string option
  method has_key : string -> bool
  method list_children : unit -> string array
  method list_keys : unit -> string array
  method ref : unit -> Raw.Settings_schema.t
  method as_settings_schema : Raw.Settings_schema.t
end

class settings_schema : Raw.Settings_schema.t -> settings_schema_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Settings_schema.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GSettingsSchema], give one already wrapped. *)
