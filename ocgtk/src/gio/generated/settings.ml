(* GENERATED CODE - DO NOT EDIT *)
(* Settings: Settings *)

[@@@ocaml.text
"The [GSettings] class provides a convenient API for storing and retrieving\n\
 application settings.\n\n\
 Reads and writes can be considered to be non-blocking.  Reading\n\
 settings with [GSettings] is typically extremely fast: on\n\
 approximately the same order of magnitude (but slower than) a\n\
 [GLib.HashTable] lookup.  Writing settings is also extremely fast in\n\
 terms of time to return to your application, but can be extremely expensive\n\
 for other threads and other processes.  Many settings backends\n\
 (including dconf) have lazy initialisation which means in the common\n\
 case of the user using their computer without modifying any settings\n\
 a lot of work can be avoided.  For dconf, the D-Bus service doesn’t\n\
 even need to be started in this case.  For this reason, you should\n\
 only ever modify [GSettings] keys in response to explicit user action.\n\
 Particular care should be paid to ensure that modifications are not\n\
 made during startup — for example, when setting the initial value\n\
 of preferences widgets.  The built-in [Gio.Settings.bind]\n\
 functionality is careful not to write settings in response to notify signals\n\
 as a result of modifications that it makes to widgets.\n\n\
 When creating a [GSettings] instance, you have to specify a schema\n\
 that describes the keys in your settings and their types and default\n\
 values, as well as some other information.\n\n\
 Normally, a schema has a fixed path that determines where the settings\n\
 are stored in the conceptual global tree of settings. However, schemas\n\
 can also be ‘relocatable’, i.e. not equipped with\n\
 a fixed path. This is\n\
 useful e.g. when the schema describes an ‘account’, and you want to be\n\
 able to store a arbitrary number of accounts.\n\n\
 Paths must start with and end with a forward slash character ([/])\n\
 and must not contain two sequential slash characters.  Paths should\n\
 be chosen based on a domain name associated with the program or\n\
 library to which the settings belong.  Examples of paths are\n\
 [/org/gtk/settings/file-chooser/] and [/ca/desrt/dconf-editor/].\n\
 Paths should not start with [/apps/], [/desktop/] or [/system/] as\n\
 they often did in GConf.\n\n\
 Unlike other configuration systems (like GConf), GSettings does not\n\
 restrict keys to basic types like strings and numbers. GSettings stores\n\
 values as [GLib.Variant], and allows any [GLib.VariantType] for\n\
 keys. Key names are restricted to lowercase characters, numbers and [-].\n\
 Furthermore, the names must begin with a lowercase character, must not end\n\
 with a [-], and must not contain consecutive dashes.\n\n\
 Similar to GConf, the default values in GSettings schemas can be\n\
 localized, but the localized values are stored in gettext catalogs\n\
 and looked up with the domain that is specified in the\n\
 [gettext-domain] attribute of the [<schemalist>] or [<schema>]\n\
 elements and the category that is specified in the [l10n] attribute of\n\
 the [<default>] element. The string which is translated includes all text in\n\
 the [<default>] element, including any surrounding quotation marks.\n\n\
 The [l10n] attribute must be set to [messages] or [time], and sets the\n\
 \\[locale category for\n\
 translation\\](https://www.gnu.org/software/gettext/manual/html_node/Aspects.html#index-locale-categories-1).\n\
 The [messages] category should be used by default; use [time] for\n\
 translatable date or time formats. A translation comment can be added as an\n\
 XML comment immediately above the [<default>] element — it is recommended to\n\
 add these comments to aid translators understand the meaning and\n\
 implications of the default value. An optional translation [context]\n\
 attribute can be set on the [<default>] element to disambiguate multiple\n\
 defaults which use the same string.\n\n\
 For example:\n\n\
 {[\n\
\ <!-- Translators: A list of words which are not allowed to be typed, in\n\
\      GVariant serialization syntax.\n\
\      See: https://developer.gnome.org/glib/stable/gvariant-text.html -->\n\
\ <default l10n='messages' context='Banned words'>['bad', 'words']</default>\n\
 ]}\n\n\
 Translations of default values must remain syntactically valid serialized\n\
 [GLib.Variant]s (e.g. retaining any surrounding quotation marks) or\n\
 runtime errors will occur.\n\n\
 GSettings uses schemas in a compact binary form that is created\n\
 by the [glib-compile-schemas]\n\
 utility. The input is a schema description in an XML format.\n\n\
 A DTD for the gschema XML format can be found here:\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/gschema.dtd}gschema.dtd}\n\n\
 The [glib-compile-schemas] tool expects schema\n\
 files to have the extension [.gschema.xml].\n\n\
 At runtime, schemas are identified by their ID (as specified in the\n\
 [id] attribute of the [<schema>] element). The convention for schema\n\
 IDs is to use a dotted name, similar in style to a D-Bus bus name,\n\
 e.g. [org.gnome.SessionManager]. In particular, if the settings are\n\
 for a specific service that owns a D-Bus bus name, the D-Bus bus name\n\
 and schema ID should match. For schemas which deal with settings not\n\
 associated with one named application, the ID should not use\n\
 StudlyCaps, e.g. [org.gnome.font-rendering].\n\n\
 In addition to [GLib.Variant] types, keys can have types that have\n\
 enumerated types. These can be described by a [<choice>],\n\
 [<enum>] or [<flags>] element, as seen in the\n\
 second example below. The underlying type of such a key\n\
 is string, but you can use [Gio.Settings.get_enum],\n\
 [Gio.Settings.set_enum], [Gio.Settings.get_flags],\n\
 [Gio.Settings.set_flags] access the numeric values corresponding to\n\
 the string value of enum and flags keys.\n\n\
 An example for default value:\n\n\
 {[\n\
 <schemalist>\n\
\  <schema id=\"org.gtk.Test\" path=\"/org/gtk/Test/\" \
 gettext-domain=\"test\">\n\n\
\    <key name=\"greeting\" type=\"s\">\n\
\      <default l10n=\"messages\">\"Hello, earthlings\"</default>\n\
\      <summary>A greeting</summary>\n\
\      <description>\n\
\        Greeting of the invading martians\n\
\      </description>\n\
\    </key>\n\n\
\    <key name=\"box\" type=\"(ii)\">\n\
\      <default>(20,30)</default>\n\
\    </key>\n\n\
\    <key name=\"empty-string\" type=\"s\">\n\
\      <default>\"\"</default>\n\
\      <summary>Empty strings have to be provided in GVariant form</summary>\n\
\    </key>\n\n\
\  </schema>\n\
 </schemalist>\n\
 ]}\n\n\
 An example for ranges, choices and enumerated types:\n\n\
 {[\n\
 <schemalist>\n\n\
\  <enum id=\"org.gtk.Test.myenum\">\n\
\    <value nick=\"first\" value=\"1\"/>\n\
\    <value nick=\"second\" value=\"2\"/>\n\
\  </enum>\n\n\
\  <flags id=\"org.gtk.Test.myflags\">\n\
\    <value nick=\"flag1\" value=\"1\"/>\n\
\    <value nick=\"flag2\" value=\"2\"/>\n\
\    <value nick=\"flag3\" value=\"4\"/>\n\
\  </flags>\n\n\
\  <schema id=\"org.gtk.Test\">\n\n\
\    <key name=\"key-with-range\" type=\"i\">\n\
\      <range min=\"1\" max=\"100\"/>\n\
\      <default>10</default>\n\
\    </key>\n\n\
\    <key name=\"key-with-choices\" type=\"s\">\n\
\      <choices>\n\
\        <choice value='Elisabeth'/>\n\
\        <choice value='Annabeth'/>\n\
\        <choice value='Joe'/>\n\
\      </choices>\n\
\      <aliases>\n\
\        <alias value='Anna' target='Annabeth'/>\n\
\        <alias value='Beth' target='Elisabeth'/>\n\
\      </aliases>\n\
\      <default>'Joe'</default>\n\
\    </key>\n\n\
\    <key name='enumerated-key' enum='org.gtk.Test.myenum'>\n\
\      <default>'first'</default>\n\
\    </key>\n\n\
\    <key name='flags-key' flags='org.gtk.Test.myflags'>\n\
\      <default>[\"flag1\",\"flag2\"]</default>\n\
\    </key>\n\
\  </schema>\n\
 </schemalist>\n\
 ]}\n\n\
 {b Vendor overrides}\n\n\
 Default values are defined in the schemas that get installed by\n\
 an application. Sometimes, it is necessary for a vendor or distributor\n\
 to adjust these defaults. Since patching the XML source for the schema\n\
 is inconvenient and error-prone,\n\
 [glib-compile-schemas] reads so-called ‘vendor\n\
 override’ files. These are keyfiles in the same directory as the XML\n\
 schema sources which can override default values. The schema ID serves\n\
 as the group name in the key file, and the values are expected in\n\
 serialized [GLib.Variant] form, as in the following example:\n\n\
 {[\n\
 [org.gtk.Example]\n\
 key1='string'\n\
 key2=1.5\n\
 ]}\n\n\
 [glib-compile-schemas] expects schema files to have the extension\n\
 [.gschema.override].\n\n\
 {b Delay-apply mode}\n\n\
 By default, values set on a [Gio.Settings] instance immediately start\n\
 to be written to the backend (although these writes may not complete by the\n\
 time that [Gio.Settings.set]) returns; see [Gio.Settings.sync]).\n\n\
 In order to allow groups of settings to be changed simultaneously and\n\
 atomically, GSettings also supports a ‘delay-apply’ mode. In this mode,\n\
 updated values are kept locally in the [Gio.Settings] instance until\n\
 they are explicitly applied by calling [Gio.Settings.apply].\n\n\
 For example, this could be useful for a preferences dialog where the\n\
 preferences all need to be applied simultaneously when the user clicks \
 ‘Save’.\n\n\
 Switching a [Gio.Settings] instance to ‘delay-apply’ mode is a one-time\n\
 irreversible operation: from that point onwards, {i all} changes made to that\n\
 [Gio.Settings] have to be explicitly applied by calling\n\
 [Gio.Settings.apply]. The ‘delay-apply’ mode is also propagated to any\n\
 child settings objects subsequently created using\n\
 [Gio.Settings.get_child].\n\n\
 At any point, the set of unapplied changes can be queried using\n\
 [Gio.Settings:has-unapplied], and discarded by calling\n\
 [Gio.Settings.revert].\n\n\
 {b Binding}\n\n\
 A very convenient feature of GSettings lets you bind [GObject.Object]\n\
 properties directly to settings, using [Gio.Settings.bind]. Once a\n\
 [GObject.Object] property has been bound to a setting, changes on\n\
 either side are automatically propagated to the other side. GSettings handles\n\
 details like mapping between [GObject.Object] and [GLib.Variant]\n\
 types, and preventing infinite cycles.\n\n\
 This makes it very easy to hook up a preferences dialog to the\n\
 underlying settings. To make this even more convenient, GSettings\n\
 looks for a boolean property with the name [sensitivity] and\n\
 automatically binds it to the writability of the bound setting.\n\
 If this ‘magic’ gets in the way, it can be suppressed with the\n\
 [G_SETTINGS_BIND_NO_SENSITIVITY] flag.\n\n\
 {b Relocatable schemas}\n\n\
 A relocatable schema is one with no [path] attribute specified on its\n\
 [<schema>] element. By using [Gio.Settings.new_with_path], a [GSettings]\n\
 object can be instantiated for a relocatable schema, assigning a path to the\n\
 instance. Paths passed to [Gio.Settings.new_with_path] will typically be\n\
 constructed dynamically from a constant prefix plus some form of instance\n\
 identifier; but they must still be valid GSettings paths. Paths could also\n\
 be constant and used with a globally installed schema originating from a\n\
 dependency library.\n\n\
 For example, a relocatable schema could be used to store geometry information\n\
 for different windows in an application. If the schema ID was\n\
 [org.foo.MyApp.Window], it could be instantiated for paths\n\
 [/org/foo/MyApp/main/], [/org/foo/MyApp/document-1/],\n\
 [/org/foo/MyApp/document-2/], etc. If any of the paths are well-known\n\
 they can be specified as [<child>] elements in the parent schema, e.g.:\n\n\
 {[\n\
 <schema id=\"org.foo.MyApp\" path=\"/org/foo/MyApp/\">\n\
\  <child name=\"main\" schema=\"org.foo.MyApp.Window\"/>\n\
 </schema>\n\
 ]}\n\n\
 {b Build system integration}\n\n\
 {b Meson}\n\n\
 GSettings is natively supported by Meson’s \
 {{:https://mesonbuild.com/Gnome-module.html}GNOME module}.\n\n\
 You can install the schemas as any other data file:\n\n\
 {[\n\
 install_data(\n\
\  'org.foo.MyApp.gschema.xml',\n\
\  install_dir: get_option('datadir') / 'glib-2.0/schemas',\n\
 )\n\
 ]}\n\n\
 You can use [gnome.post_install()] function to compile the schemas on\n\
 installation:\n\n\
 {[\n\
 gnome = import('gnome')\n\
 gnome.post_install(\n\
\  glib_compile_schemas: true,\n\
 )\n\
 ]}\n\n\
 If an enumerated type defined in a C header file is to be used in a GSettings\n\
 schema, it can either be defined manually using an [<enum>] element in the\n\
 schema XML, or it can be extracted automatically from the C header. This\n\
 approach is preferred, as it ensures the two representations are always\n\
 synchronised. To do so, you will need to use the [gnome.mkenums()] function\n\
 with the following templates:\n\n\
 {[\n\
 schemas_enums = gnome.mkenums('org.foo.MyApp.enums.xml',\n\
\  comments: '<!-- @comment@ -->',\n\
\  fhead: '<schemalist>',\n\
\  vhead: '  <@type@ id=\"org.foo.MyApp.@EnumName@\">',\n\
\  vprod: '    <value nick=\"@valuenick@\" value=\"@valuenum@\"/>',\n\
\  vtail: '  </@type@>',\n\
\  ftail: '</schemalist>',\n\
\  sources: enum_sources,\n\
\  install_header: true,\n\
\  install_dir: get_option('datadir') / 'glib-2.0/schemas',\n\
 )\n\
 ]}\n\n\
 It is recommended to validate your schemas as part of the test suite for\n\
 your application:\n\n\
 {[\n\
 test('validate-schema',\n\
\  find_program('glib-compile-schemas'),\n\
\  args: ['--strict', '--dry-run', meson.current_source_dir()],\n\
 )\n\
 ]}\n\n\
 If your application allows running uninstalled, you should also use the\n\
 [gnome.compile_schemas()] function to compile the schemas in the current\n\
 build directory:\n\n\
 {[\n\
 gnome.compile_schemas()\n\
 ]}\n\n\
 {b Autotools}\n\n\
 GSettings comes with autotools integration to simplify compiling and\n\
 installing schemas. To add GSettings support to an application, add the\n\
 following to your [configure.ac]:\n\n\
 {[\n\
 GLIB_GSETTINGS\n\
 ]}\n\n\
 In the appropriate [Makefile.am], use the following snippet to compile and\n\
 install the named schema:\n\n\
 {[\n\
 gsettings_SCHEMAS = org.foo.MyApp.gschema.xml\n\
 EXTRA_DIST = $(gsettings_SCHEMAS)\n\n\
 @GSETTINGS_RULES@\n\
 ]}\n\n\
 If an enumerated type defined in a C header file is to be used in a GSettings\n\
 schema, it can either be defined manually using an [<enum>] element in the\n\
 schema XML, or it can be extracted automatically from the C header. This\n\
 approach is preferred, as it ensures the two representations are always\n\
 synchronised. To do so, add the following to the relevant [Makefile.am]:\n\n\
 {[\n\
 gsettings_ENUM_NAMESPACE = org.foo.MyApp\n\
 gsettings_ENUM_FILES = my-app-enums.h my-app-misc.h\n\
 ]}\n\n\
 [gsettings_ENUM_NAMESPACE] specifies the schema namespace for the enum files,\n\
 which are specified in [gsettings_ENUM_FILES]. This will generate a\n\
 [org.foo.MyApp.enums.xml] file containing the extracted enums, which will be\n\
 automatically included in the schema compilation, install and uninstall\n\
 rules. It should not be committed to version control or included in\n\
 [EXTRA_DIST].\n\n\
 {b Localization}\n\n\
 No changes are needed to the build system to mark a schema XML file for\n\
 translation. Assuming it sets the [gettext-domain] attribute, a schema may\n\
 be marked for translation by adding it to [POTFILES.in], assuming gettext\n\
 0.19 or newer is in use (the preferred method for translation):\n\n\
 {[\n\
 data/org.foo.MyApp.gschema.xml\n\
 ]}\n\n\
 Alternatively, if intltool 0.50.1 is in use:\n\n\
 {[\n\
 [type: gettext/gsettings]data/org.foo.MyApp.gschema.xml\n\
 ]}\n\n\
 GSettings will use gettext to look up translations for the [<summary>] and\n\
 [<description>] elements, and also any [<default>] elements which have a\n\
 [l10n] attribute set.\n\n\
 Translations {b must not} be included in the [.gschema.xml] file by the build\n\
 system, for example by using a rule to generate the XML file from a template."]

type t = [ `settings | `object_ ] Gobject.obj

external new_ : string -> t = "ml_g_settings_new"
(** Create a new Settings *)

external new_with_path : string -> string -> t = "ml_g_settings_new_with_path"
(** Create a new Settings *)

(* Methods *)

external set_value : t -> string -> Gvariant.t -> bool
  = "ml_g_settings_set_value"
(** Sets [key] in [settings] to [value].

    It is a programmer error to give a [key] that isn’t contained in the schema
    for [settings] or for [value] to have the incorrect type, per the schema.

    If [value] is floating then this function consumes the reference. *)

external set_uint64 : t -> string -> UInt64.t -> bool
  = "ml_g_settings_set_uint64"
(** Sets [key] in [settings] to [value].

    A convenience variant of [Gio.Settings.set] for 64-bit unsigned integers.

    It is a programmer error to give a [key] that isn’t specified as having a
    [t] type in the schema for [settings] (see [GLib.VariantType]). *)

external set_uint : t -> string -> int -> bool = "ml_g_settings_set_uint"
(** Sets [key] in [settings] to [value].

    A convenience variant of [Gio.Settings.set] for 32-bit unsigned integers.

    It is a programmer error to give a [key] that isn’t specified as having a
    [u] type in the schema for [settings] (see [GLib.VariantType]). *)

external set_strv : t -> string -> string array option -> bool
  = "ml_g_settings_set_strv"
(** Sets [key] in [settings] to [value].

    A convenience variant of [Gio.Settings.set] for string arrays. If [value] is
    [NULL], then [key] is set to be the empty array.

    It is a programmer error to give a [key] that isn’t specified as having an
    [as] type in the schema for [settings] (see [GLib.VariantType]). *)

external set_string : t -> string -> string -> bool = "ml_g_settings_set_string"
(** Sets [key] in [settings] to [value].

    A convenience variant of [Gio.Settings.set] for strings.

    It is a programmer error to give a [key] that isn’t specified as having an
    [s] type in the schema for [settings] (see [GLib.VariantType]). *)

external set_int64 : t -> string -> int64 -> bool = "ml_g_settings_set_int64"
(** Sets [key] in [settings] to [value].

    A convenience variant of [Gio.Settings.set] for 64-bit integers.

    It is a programmer error to give a [key] that isn’t specified as having an
    [x] type in the schema for [settings] (see [GLib.VariantType]). *)

external set_int : t -> string -> int -> bool = "ml_g_settings_set_int"
(** Sets [key] in [settings] to [value].

    A convenience variant of [Gio.Settings.set] for 32-bit integers.

    It is a programmer error to give a [key] that isn’t specified as having an
    [i] type in the schema for [settings] (see [GLib.VariantType]). *)

external set_flags : t -> string -> int -> bool = "ml_g_settings_set_flags"
(** Looks up the flags type nicks for the bits specified by [value], puts them
    in an array of strings and writes the array to [key], within [settings].

    It is a programmer error to give a [key] that isn’t contained in the schema
    for [settings] or is not marked as a flags type, or for [value] to contain
    any bits that are not value for the named type.

    After performing the write, accessing [key] directly with
    [Gio.Settings.get_strv] will return an array of ‘nicks’; one for each bit in
    [value]. *)

external set_enum : t -> string -> int -> bool = "ml_g_settings_set_enum"
(** Looks up the enumerated type nick for [value] and writes it to [key], within
    [settings].

    It is a programmer error to give a [key] that isn’t contained in the schema
    for [settings] or is not marked as an enumerated type, or for [value] not to
    be a valid value for the named type.

    After performing the write, accessing [key] directly with
    [Gio.Settings.get_string] will return the ‘nick’ associated with [value]. *)

external set_double : t -> string -> float -> bool = "ml_g_settings_set_double"
(** Sets [key] in [settings] to [value].

    A convenience variant of [Gio.Settings.set] for doubles.

    It is a programmer error to give a [key] that isn’t specified as having a
    [d] type in the schema for [settings] (see [GLib.VariantType]). *)

external set_boolean : t -> string -> bool -> bool = "ml_g_settings_set_boolean"
(** Sets [key] in [settings] to [value].

    A convenience variant of [Gio.Settings.set] for booleans.

    It is a programmer error to give a [key] that isn’t specified as having a
    [b] type in the schema for [settings] (see [GLib.VariantType]). *)

external revert : t -> unit = "ml_g_settings_revert"
(** Reverts all unapplied changes to the settings.

    This function does nothing unless [settings] is in ‘delay-apply’ mode. In
    the normal case settings are always applied immediately.

    Change notifications will be emitted for affected keys. *)

external reset : t -> string -> unit = "ml_g_settings_reset"
(** Resets [key] to its default value.

    This call resets the key, as much as possible, to its default value. That
    might be the value specified in the schema or the one set by the
    administrator. *)

external range_check : t -> string -> Gvariant.t -> bool
  = "ml_g_settings_range_check"
(** Checks if the given [value] is of the correct type and within the permitted
    range for [key]. *)

external list_keys : t -> string array = "ml_g_settings_list_keys"
(** Introspects the list of keys on [settings].

    You should probably not be calling this function from ‘normal’ code (since
    you should already know what keys are in your schema). This function is
    intended for introspection reasons.

    You should free the return value with [GLib.strfreev] when you are done with
    it. *)

external list_children : t -> string array = "ml_g_settings_list_children"
(** Gets the list of children on [settings].

    The list is exactly the list of strings for which it is not an error to call
    [Gio.Settings.get_child].

    There is little reason to call this function from ‘normal’ code, since you
    should already know what children are in your schema. This function may
    still be useful there for introspection reasons, however.

    You should free the return value with [GLib.strfreev] when you are done with
    it. *)

external is_writable : t -> string -> bool = "ml_g_settings_is_writable"
(** Finds out if a key can be written. *)

external get_value : t -> string -> Gvariant.t = "ml_g_settings_get_value"
(** Gets the value that is stored in [settings] for [key].

    It is a programmer error to give a [key] that isn’t contained in the schema
    for [settings]. *)

external get_user_value : t -> string -> Gvariant.t option
  = "ml_g_settings_get_user_value"
(** Checks the ‘user value’ of a key, if there is one.

    The user value of a key is the last value that was set by the user.

    After calling [Gio.Settings.reset] this function should always return [NULL]
    (assuming something is not wrong with the system configuration).

    It is possible that [Gio.Settings.get_value] will return a different value
    than this function. This can happen in the case that the user set a value
    for a key that was subsequently locked down by the system administrator —
    this function will return the user’s old value.

    This function may be useful for adding a ‘reset’ option to a UI or for
    providing indication that a particular value has been changed.

    It is a programmer error to give a [key] that isn’t contained in the schema
    for [settings]. *)

external get_uint64 : t -> string -> UInt64.t = "ml_g_settings_get_uint64"
(** Gets the value that is stored at [key] in [settings].

    A convenience variant of [Gio.Settings.get] for 64-bit unsigned integers.

    It is a programmer error to give a [key] that isn’t specified as having a
    [t] type in the schema for [settings] (see [GLib.VariantType]). *)

external get_uint : t -> string -> int = "ml_g_settings_get_uint"
(** Gets the value that is stored at [key] in [settings].

    A convenience variant of [Gio.Settings.get] for 32-bit unsigned integers.

    It is a programmer error to give a [key] that isn’t specified as having a
    [u] type in the schema for [settings] (see [GLib.VariantType]). *)

external get_strv : t -> string -> string array = "ml_g_settings_get_strv"
(** A convenience variant of [Gio.Settings.get] for string arrays.

    It is a programmer error to give a [key] that isn’t specified as having an
    [as] type in the schema for [settings] (see [GLib.VariantType]). *)

external get_string : t -> string -> string = "ml_g_settings_get_string"
(** Gets the value that is stored at [key] in [settings].

    A convenience variant of [Gio.Settings.get] for strings.

    It is a programmer error to give a [key] that isn’t specified as having an
    [s] type in the schema for [settings] (see [GLib.VariantType]). *)

external get_range : t -> string -> Gvariant.t = "ml_g_settings_get_range"
(** Queries the range of a key. *)

external get_int64 : t -> string -> int64 = "ml_g_settings_get_int64"
(** Gets the value that is stored at [key] in [settings].

    A convenience variant of [Gio.Settings.get] for 64-bit integers.

    It is a programmer error to give a [key] that isn’t specified as having an
    [x] type in the schema for [settings] (see [GLib.VariantType]). *)

external get_int : t -> string -> int = "ml_g_settings_get_int"
(** Gets the value that is stored at [key] in [settings].

    A convenience variant of [Gio.Settings.get] for 32-bit integers.

    It is a programmer error to give a [key] that isn’t specified as having an
    [i] type in the schema for [settings] (see [GLib.VariantType]). *)

external get_has_unapplied : t -> bool = "ml_g_settings_get_has_unapplied"
(** Returns whether the [Gio.Settings] object has any unapplied changes.

    This can only be the case if it is in ‘delay-apply’ mode. *)

external get_flags : t -> string -> int = "ml_g_settings_get_flags"
(** Gets the value that is stored in [settings] for [key] and converts it to the
    flags value that it represents.

    In order to use this function the type of the value must be an array of
    strings and it must be marked in the schema file as a flags type.

    It is a programmer error to give a [key] that isn’t contained in the schema
    for [settings] or is not marked as a flags type.

    If the value stored in the configuration database is not a valid value for
    the flags type then this function will return the default value. *)

external get_enum : t -> string -> int = "ml_g_settings_get_enum"
(** Gets the value that is stored in [settings] for [key] and converts it to the
    enum value that it represents.

    In order to use this function the type of the value must be a string and it
    must be marked in the schema file as an enumerated type.

    It is a programmer error to give a [key] that isn’t contained in the schema
    for [settings] or is not marked as an enumerated type.

    If the value stored in the configuration database is not a valid value for
    the enumerated type then this function will return the default value. *)

external get_double : t -> string -> float = "ml_g_settings_get_double"
(** Gets the value that is stored at [key] in [settings].

    A convenience variant of [Gio.Settings.get] for doubles.

    It is a programmer error to give a [key] that isn’t specified as having a
    [d] type in the schema for [settings] (see [GLib.VariantType]). *)

external get_default_value : t -> string -> Gvariant.t option
  = "ml_g_settings_get_default_value"
(** Gets the ‘default value’ of a key.

    This is the value that would be read if [Gio.Settings.reset] were to be
    called on the key.

    Note that this may be a different value than returned by
    [Gio.SettingsSchemaKey.get_default_value] if the system administrator has
    provided a default value.

    Comparing the return values of [Gio.Settings.get_default_value] and
    [Gio.Settings.get_value] is not sufficient for determining if a value has
    been set because the user may have explicitly set the value to something
    that happens to be equal to the default. The difference here is that if the
    default changes in the future, the user’s key will still be set.

    This function may be useful for adding an indication to a UI of what the
    default value was before the user set it.

    It is a programmer error to give a [key] that isn’t contained in the schema
    for [settings]. *)

external get_child : t -> string -> t = "ml_g_settings_get_child"
(** Creates a child settings object which has a base path of [base-path/name],
    where [base-path] is the base path of [settings] and [name] is as specified
    by the caller.

    The schema for the child settings object must have been declared in the
    schema of [settings] using a [<child>] element.

    The created child settings object will inherit the
    [Gio.Settings:delay-apply] mode from [settings]. *)

external get_boolean : t -> string -> bool = "ml_g_settings_get_boolean"
(** Gets the value that is stored at [key] in [settings].

    A convenience variant of [Gio.Settings.get] for booleans.

    It is a programmer error to give a [key] that isn’t specified as having a
    [b] type in the schema for [settings] (see [GLib.VariantType]). *)

external delay : t -> unit = "ml_g_settings_delay"
(** Changes the [Gio.Settings] object into ‘delay-apply’ mode.

    In this mode, changes to [settings] are not immediately propagated to the
    backend, but kept locally until [Gio.Settings.apply] is called. *)

external create_action : t -> string -> Action.t = "ml_g_settings_create_action"
(** Creates a [Gio.Action] corresponding to a given [Gio.Settings] key.

    The action has the same name as the key.

    The value of the key becomes the state of the action and the action is
    enabled when the key is writable. Changing the state of the action results
    in the key being written to. Changes to the value or writability of the key
    cause appropriate change notifications to be emitted for the action.

    For boolean-valued keys, action activations take no parameter and result in
    the toggling of the value. For all other types, activations take the new
    value for the key (which must have the correct type). *)

external bind_writable :
  t -> string -> [ `object_ ] Gobject.obj -> string -> bool -> unit
  = "ml_g_settings_bind_writable"
(** Create a binding between the writability of [key] in the [settings] object
    and the property [property] of [object].

    The property must be boolean; [sensitive] or [visible] properties of widgets
    are the most likely candidates.

    Writable bindings are always uni-directional; changes of the writability of
    the setting will be propagated to the object property, not the other way.

    When the [inverted] argument is true, the binding inverts the value as it
    passes from the setting to the object, i.e. [property] will be set to true
    if the key is not writable.

    Note that the lifecycle of the binding is tied to [object], and that you can
    have only one binding per object property. If you bind the same property
    twice on the same object, the second binding overrides the first one. *)

external bind :
  t ->
  string ->
  [ `object_ ] Gobject.obj ->
  string ->
  Gio_enums.settingsbindflags ->
  unit = "ml_g_settings_bind"
(** Create a binding between the [key] in the [settings] object and the property
    [property] of [object].

    The binding uses the default GIO mapping functions to map between the
    settings and property values. These functions handle booleans, numeric types
    and string types in a straightforward way. Use
    [Gio.Settings.bind_with_mapping] if you need a custom mapping, or map
    between types that are not supported by the default mapping functions.

    Unless the [flags] include [Gio.SettingsBindFlags.NO_SENSITIVITY], this
    function also establishes a binding between the writability of [key] and the
    [sensitive] property of [object] (if [object] has a boolean property by that
    name). See [Gio.Settings.bind_writable] for more details about writable
    bindings.

    Note that the lifecycle of the binding is tied to [object], and that you can
    have only one binding per object property. If you bind the same property
    twice on the same object, the second binding overrides the first one. *)

external apply : t -> unit = "ml_g_settings_apply"
(** Applies any changes that have been made to the settings.

    This function does nothing unless [settings] is in ‘delay-apply’ mode. In
    the normal case settings are always applied immediately. *)

(* Properties *)

external get_delay_apply : t -> bool = "ml_g_settings_get_delay_apply"
(** Get property: delay-apply *)

external get_path : t -> string = "ml_g_settings_get_path"
(** Get property: path *)

external get_schema : t -> string = "ml_g_settings_get_schema"
(** Get property: schema *)

external get_schema_id : t -> string = "ml_g_settings_get_schema_id"
(** Get property: schema-id *)

external get_settings_schema : t -> Settings_schema.t
  = "ml_g_settings_get_settings_schema"
(** Get property: settings-schema *)

let on_changed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let key =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        callback ~key)
  in
  Gobject.Signal.connect obj ~name:"changed" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_writable_change_event ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let key =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_uint v
        in
        let result = callback ~key in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"writable-change-event" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_writable_changed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let key =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        callback ~key)
  in
  Gobject.Signal.connect obj ~name:"writable-changed" ~callback:closure
    ~after:(Option.value after ~default:false)
