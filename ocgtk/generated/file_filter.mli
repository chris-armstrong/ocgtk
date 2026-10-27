[@@@ocaml.text
"Filters files by name or mime type.\n\n\
 [GtkFileFilter] can be used to restrict the files being shown in a\n\
 file chooser. Files can be filtered based on their name (with\n\
 [Gtk.FileFilter.add_pattern] or [Gtk.FileFilter.add_suffix])\n\
 or on their mime type (with [Gtk.FileFilter.add_mime_type]).\n\n\
 Filtering by mime types handles aliasing and subclassing of mime\n\
 types; e.g. a filter for text/plain also matches a file with mime\n\
 type application/rtf, since application/rtf is a subclass of\n\
 text/plain. Note that [GtkFileFilter] allows wildcards for the\n\
 subtype of a mime type, so you can e.g. filter for image/*.\n\n\
 Normally, file filters are used by adding them to a file chooser\n\
 (see [Gtk.FileDialog.set_filters]), but it is also possible to\n\
 manually use a file filter on any [Gtk.FilterListModel] containing\n\
 [GFileInfo] objects.\n\n\
 {b GtkFileFilter as GtkBuildable}\n\n\
 The [GtkFileFilter] implementation of the [GtkBuildable] interface\n\
 supports adding rules using the [<mime-types>] and [<patterns>] and\n\
 [<suffixes>] elements and listing the rules within. Specifying a\n\
 [<mime-type>] or [<pattern>] or [<suffix>] has the same effect as\n\
 as calling\n\
 [Gtk.FileFilter.add_mime_type] or\n\
 [Gtk.FileFilter.add_pattern] or\n\
 [Gtk.FileFilter.add_suffix].\n\n\
 An example of a UI definition fragment specifying [GtkFileFilter]\n\
 rules:\n\n\
 {[\n\
 <object class=\"GtkFileFilter\">\n\
\  <property name=\"name\" translatable=\"yes\">Text and Images</property>\n\
\  <mime-types>\n\
\    <mime-type>text/plain</mime-type>\n\
\    <mime-type>image/ *</mime-type>\n\
\  </mime-types>\n\
\  <patterns>\n\
\    <pattern>*.txt</pattern>\n\
\  </patterns>\n\
\  <suffixes>\n\
\    <suffix>png</suffix>\n\
\  </suffixes>\n\
 </object>\n\
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-file_filter_t}. The \
 functions it is built on are in {!Ocgtk.Raw.File_filter}."]

(** The methods, signals and properties of a [GtkFileFilter]. *)
class type file_filter_t = object
  inherit Filter.filter_t
  inherit Buildable.buildable_t
  method add_mime_type : string -> unit
  method add_pattern : string -> unit
  method add_pixbuf_formats : unit -> unit
  method add_suffix : string -> unit
  method get_attributes : unit -> string array
  method get_name : unit -> string option
  method set_name : string option -> unit
  method to_gvariant : unit -> Gvariant.t
  method as_file_filter : Raw.File_filter.t
end

class file_filter : Raw.File_filter.t -> file_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.File_filter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFileFilter], give one already wrapped. *)

val new_ : unit -> file_filter_t
val new_from_gvariant : Gvariant.t -> file_filter_t
