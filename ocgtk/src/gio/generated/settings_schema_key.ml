(* GENERATED CODE - DO NOT EDIT *)
(* SettingsSchemaKey: SettingsSchemaKey *)

(** #GSettingsSchemaKey is an opaque data structure and can only be accessed
using the following functions. *)
type t = [`settings_schema_key] Gobject.obj

(* Methods *)
(** Decrease the reference count of @key, possibly freeing it. *)
external unref : t -> unit = "ml_g_settings_schema_key_unref"

(** Increase the reference count of @key, returning a new reference. *)
external ref : t -> t = "ml_g_settings_schema_key_ref"

(** Gets the summary for @key.

If no summary has been provided in the schema for @key, returns
%NULL.

The summary is a short description of the purpose of the key; usually
one short sentence.  Summaries can be translated and the value
returned from this function is is the current locale.

This function is slow.  The summary and description information for
the schemas is not stored in the compiled schema database so this
function has to parse all of the source XML files in the schema
directory. *)
external get_summary : t -> string option = "ml_g_settings_schema_key_get_summary"

(** Gets the name of @key. *)
external get_name : t -> string = "ml_g_settings_schema_key_get_name"

(** Gets the description for @key.

If no description has been provided in the schema for @key, returns
%NULL.

The description can be one sentence to several paragraphs in length.
Paragraphs are delimited with a double newline.  Descriptions can be
translated and the value returned from this function is is the
current locale.

This function is slow.  The summary and description information for
the schemas is not stored in the compiled schema database so this
function has to parse all of the source XML files in the schema
directory. *)
external get_description : t -> string option = "ml_g_settings_schema_key_get_description"

