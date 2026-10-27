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
 system, for example by using a rule to generate the XML file from a template.\n\n\
 Its methods, signals and properties are on {!class-type-settings_t}. The \
 functions it is built on are in {!Ocgio.Raw.Settings}."]

(** The methods, signals and properties of a [GSettings]. *)
class type settings_t = object
  method on_changed :
    ?after:bool ->
    callback:(key:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_writable_change_event :
    ?after:bool ->
    callback:(key:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_writable_changed :
    ?after:bool ->
    callback:(key:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method apply : unit -> unit

  method bind :
    string ->
    [ `object_ ] Gobject.obj ->
    string ->
    Enums.settingsbindflags ->
    unit

  method bind_writable :
    string -> [ `object_ ] Gobject.obj -> string -> bool -> unit

  method create_action : string -> Action.action_t
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
  method settings_schema : Raw.Settings_schema.t
  method as_settings : Raw.Settings.t
end

class settings : Raw.Settings.t -> settings_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Settings.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GSettings], give one already wrapped. *)

val new_ : string -> settings_t
val new_with_path : string -> string -> settings_t
