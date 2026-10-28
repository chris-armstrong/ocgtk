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
 Its methods, signals and properties are on {!class-type-file_filter_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.File_filter}."]

class type file_filter_t = object
  inherit Filter.filter_t
  inherit Buildable.buildable_t

  method add_mime_type : string -> unit
  (** Adds a rule allowing a given mime type. *)

  method add_pattern : string -> unit
  (** Adds a rule allowing a shell style glob pattern.

      Note that it depends on the platform whether pattern matching ignores case
      or not. On Windows, it does, on other platforms, it doesn't. *)

  method add_pixbuf_formats : unit -> unit
  (** Adds a rule allowing image files in the formats supported by [GdkPixbuf].

      This is equivalent to calling [Gtk.FileFilter.add_mime_type] for all the
      supported mime types. *)

  method add_suffix : string -> unit
  [@@ocaml.doc
    "Adds a suffix match rule to a filter.\n\n\
     This is similar to adding a match for the pattern \"*.[suffix]\"\n\n\
     An exaple to filter files with the suffix \".sub\":\n\n\
     {[\n\
     gtk_file_filter_add_suffix (filter, \"sub\");\n\
     ]}\n\n\
     Filters with multiple dots are allowed.\n\n\
     In contrast to pattern matches, suffix matches\n\
     are {i always} case-insensitive."]

  method get_attributes : unit -> string array
  (** Gets the attributes that need to be filled in for the [GFileInfo] passed
      to this filter.

      This function will not typically be used by applications; it is intended
      for use in file chooser implementation. *)

  method get_name : unit -> string option
  (** Gets the human-readable name for the filter.

      See [Gtk.FileFilter.set_name]. *)

  method set_name : string option -> unit
  (** Sets a human-readable name of the filter.

      This is the string that will be displayed in the user interface if there
      is a selectable list of filters. *)

  method to_gvariant : unit -> Gvariant.t
  (** Serialize a file filter to an [a{sv}] variant. *)

  method as_file_filter : Raw.File_filter.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [FileFilter].}\n\n\
     Filters files by name or mime type.\n\n\
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
     ]}"]

class file_filter : Raw.File_filter.t -> file_filter_t
(** Wraps a raw handle of {!Ocgtk.Raw.File_filter.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> file_filter_t
[@@ocaml.doc
  "Creates a new [GtkFileFilter] with no rules added to it.\n\n\
   Such a filter doesn’t accept any files, so is not\n\
   particularly useful until you add rules with\n\
   [Gtk.FileFilter.add_mime_type],\n\
   [Gtk.FileFilter.add_pattern],\n\
   [Gtk.FileFilter.add_suffix] or\n\
   [Gtk.FileFilter.add_pixbuf_formats].\n\n\
   To create a filter that accepts any file, use:\n\n\
   {[\n\
   GtkFileFilter *filter = gtk_file_filter_new ();\n\
   gtk_file_filter_add_pattern (filter, \"*\");\n\
   ]}"]

val new_from_gvariant : Gvariant.t -> file_filter_t
(** Deserialize a file filter from a [GVariant].

    The variant must be in the format produced by [Gtk.FileFilter.to_gvariant].
*)
