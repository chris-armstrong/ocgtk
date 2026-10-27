[@@@ocaml.text
"Applications and libraries often contain binary or textual data that is\n\
 really part of the application, rather than user data. For instance\n\
 {{:https://docs.gtk.org/gtk4/class.Builder.html}[GtkBuilder]} [.ui] files,\n\
 splashscreen images, [Gio.Menu] markup XML, CSS files, icons, etc.\n\
 These are often shipped as files in [$datadir/appname], or manually\n\
 included as literal strings in the code.\n\n\
 The [GResource] API and the\n\
 [glib-compile-resources] program provide a\n\
 convenient and efficient alternative to this which has some nice properties.\n\
 You maintain the files as normal files, so it’s easy to edit them, but during\n\
 the build the files are combined into a binary bundle that is linked into the\n\
 executable. This means that loading the resource files are efficient (as they\n\
 are already in memory, shared with other instances) and simple (no need to\n\
 check for things like I/O errors or locate the files in the filesystem). It\n\
 also makes it easier to create relocatable applications.\n\n\
 Resource files can also be marked as compressed. Such files will be included\n\
 in the resource bundle in a compressed form, but will be automatically\n\
 uncompressed when the resource is used. This is very useful e.g. for larger\n\
 text files that are parsed once (or rarely) and then thrown away.\n\n\
 Resource files can also be marked to be preprocessed, by setting the value of \
 the\n\
 [preprocess] attribute to a comma-separated list of preprocessing options.\n\
 The only options currently supported are:\n\n\
 - [xml-stripblanks] which will use the [xmllint]) command\n\
 to strip ignorable whitespace from the XML file. For this to work,\n\
 the [XMLLINT] environment variable must be set to the full path to\n\
 the xmllint executable, or xmllint must be in the [PATH]; otherwise\n\
 the preprocessing step is skipped.\n\n\
 - [to-pixdata] (deprecated since gdk-pixbuf 2.32) which will use the\n\
 [gdk-pixbuf-pixdata] command to convert images to the \
 {{:https://docs.gtk.org/gdk-pixbuf/class.Pixdata.html}[GdkPixdata]}\n\
 format, which allows you to create pixbufs directly using the data inside\n\
 the resource file, rather than an (uncompressed) copy of it. For this, the\n\
 [gdk-pixbuf-pixdata] program must be in the [PATH], or the\n\
 [GDK_PIXBUF_PIXDATA] environment variable must be set to the full path to\n\
 the [gdk-pixbuf-pixdata] executable; otherwise the resource compiler will\n\
 abort. [to-pixdata] has been deprecated since gdk-pixbuf 2.32, as\n\
 [GResource] supports embedding modern image formats just as well. Instead\n\
 of using it, embed a PNG or SVG file in your [GResource].\n\n\
 - [json-stripblanks] which will use the\n\
 [json-glib-format]) command to strip ignorable\n\
 whitespace from the JSON file. For this to work, the [JSON_GLIB_FORMAT]\n\
 environment variable must be set to the full path to the\n\
 [json-glib-format] executable, or it must be in the [PATH]; otherwise the\n\
 preprocessing step is skipped. In addition, at least version 1.6 of\n\
 [json-glib-format] is required.\n\n\
 Resource files will be exported in the [GResource] namespace using the\n\
 combination of the given [prefix] and the filename from the [file] element.\n\
 The [alias] attribute can be used to alter the filename to expose them at a\n\
 different location in the resource namespace. Typically, this is used to\n\
 include files from a different source directory without exposing the source\n\
 directory in the resource namespace, as in the example below.\n\n\
 Resource bundles are created by the\n\
 [glib-compile-resources] program\n\
 which takes an XML file that describes the bundle, and a set of files that\n\
 the XML references. These are combined into a binary resource bundle.\n\n\
 An example resource description:\n\n\
 {[\n\
 <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\
 <gresources>\n\
\  <gresource prefix=\"/org/gtk/Example\">\n\
\    <file>data/splashscreen.png</file>\n\
\    <file compressed=\"true\">dialog.ui</file>\n\
\    <file preprocess=\"xml-stripblanks\">menumarkup.xml</file>\n\
\    <file alias=\"example.css\">data/example.css</file>\n\
\  </gresource>\n\
 </gresources>\n\
 ]}\n\n\
 This will create a resource bundle with the following files:\n\n\
 {[\n\
 /org/gtk/Example/data/splashscreen.png\n\
 /org/gtk/Example/dialog.ui\n\
 /org/gtk/Example/menumarkup.xml\n\
 /org/gtk/Example/example.css\n\
 ]}\n\n\
 Note that all resources in the process share the same namespace, so use\n\
 Java-style path prefixes (like in the above example) to avoid conflicts.\n\n\
 You can then use [glib-compile-resources] to\n\
 compile the XML to a binary bundle that you can load with\n\
 [Gio.Resource.load]. However, it’s more common to use the\n\
 [--generate-source] and [--generate-header] arguments to create a source file\n\
 and header to link directly into your application.\n\
 This will generate [get_resource()], [register_resource()] and\n\
 [unregister_resource()] functions, prefixed by the [--c-name] argument passed\n\
 to [glib-compile-resources]. [get_resource()]\n\
 returns the generated [GResource] object. The register and unregister\n\
 functions register the resource so its files can be accessed using\n\
 [Gio.resources_lookup_data].\n\n\
 Once a [GResource] has been created and registered all the data in it can be\n\
 accessed globally in the process by using API calls like\n\
 [Gio.resources_open_stream] to stream the data or\n\
 [Gio.resources_lookup_data] to get a direct pointer to the data. You can\n\
 also use URIs like [resource:///org/gtk/Example/data/splashscreen.png] with\n\
 [Gio.File] to access the resource data.\n\n\
 Some higher-level APIs, such as \
 {{:https://docs.gtk.org/gtk4/class.Application.html}[GtkApplication]},\n\
 will automatically load resources from certain well-known paths in the\n\
 resource namespace as a convenience. See the documentation for those APIs\n\
 for details.\n\n\
 There are two forms of the generated source, the default version uses the\n\
 compiler support for constructor and destructor functions (where available)\n\
 to automatically create and register the [GResource] on startup or library\n\
 load time. If you pass [--manual-register], two functions to\n\
 register/unregister the resource are created instead. This requires an\n\
 explicit initialization call in your application/library, but it works on all\n\
 platforms, even on the minor ones where constructors are not supported.\n\
 (Constructor support is available for at least Win32, Mac OS and Linux.)\n\n\
 Note that resource data can point directly into the data segment of e.g. a\n\
 library, so if you are unloading libraries during runtime you need to be very\n\
 careful with keeping around pointers to data from a resource, as this goes\n\
 away when the library is unloaded. However, in practice this is not generally\n\
 a problem, since most resource accesses are for your own resources, and\n\
 resource data is often used once, during parsing, and then released.\n\n\
 {b Overlays}\n\n\
 When debugging a program or testing a change to an installed version, it is\n\
 often useful to be able to replace resources in the program or library,\n\
 without recompiling, for debugging or quick hacking and testing purposes.\n\
 Since GLib 2.50, it is possible to use the [G_RESOURCE_OVERLAYS] environment\n\
 variable to selectively overlay resources with replacements from the\n\
 filesystem.  It is a [G_SEARCHPATH_SEPARATOR]-separated list of substitutions\n\
 to perform during resource lookups. It is ignored when running in a setuid\n\
 process.\n\n\
 A substitution has the form\n\n\
 {[\n\
 /org/gtk/libgtk=/home/desrt/gtk-overlay\n\
 ]}\n\n\
 The part before the [=] is the resource subpath for which the overlay\n\
 applies.  The part after is a filesystem path which contains files and\n\
 subdirectories as you would like to be loaded as resources with the\n\
 equivalent names.\n\n\
 In the example above, if an application tried to load a resource with the\n\
 resource path [/org/gtk/libgtk/ui/gtkdialog.ui] then [GResource] would check\n\
 the filesystem path [/home/desrt/gtk-overlay/ui/gtkdialog.ui].  If a file was\n\
 found there, it would be used instead.  This is an overlay, not an outright\n\
 replacement, which means that if a file is not found at that path, the\n\
 built-in version will be used instead.  Whiteouts are not currently\n\
 supported.\n\n\
 Substitutions must start with a slash, and must not contain a trailing slash\n\
 before the [=].  The path after the slash should ideally be absolute, but\n\
 this is not strictly required.  It is possible to overlay the location of a\n\
 single resource with an individual file.\n\n\
 Its methods, signals and properties are on {!class-type-resource_t}. The \
 functions it is built on are in {!Ocgio.Raw.Resource}."]

(** The methods, signals and properties of a [GResource]. *)
class type resource_t = object
  method _register : unit -> unit
  method _unregister : unit -> unit

  method enumerate_children :
    string -> Enums.resourcelookupflags -> (string array, GError.t) result

  method has_children : string -> bool

  method lookup_data :
    string -> Enums.resourcelookupflags -> (Glib_bytes.t, GError.t) result

  method open_stream :
    string ->
    Enums.resourcelookupflags ->
    (Input_stream.input_stream_t, GError.t) result

  method ref : unit -> Raw.Resource.t
  method as_resource : Raw.Resource.t
end

class resource : Raw.Resource.t -> resource_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Resource.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GResource], give one already wrapped. *)

val new_from_data : Glib_bytes.t -> (resource_t, GError.t) result
