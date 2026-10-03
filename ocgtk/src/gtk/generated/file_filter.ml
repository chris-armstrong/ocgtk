(* GENERATED CODE - DO NOT EDIT *)
(* FileFilter: FileFilter *)

(** Filters files by name or mime type.

    [GtkFileFilter] can be used to restrict the files being shown in a file
    chooser. Files can be filtered based on their name (with
    [Gtk.FileFilter.add_pattern] or [Gtk.FileFilter.add_suffix]) or on their
    mime type (with [Gtk.FileFilter.add_mime_type]).

    Filtering by mime types handles aliasing and subclassing of mime types; e.g.
    a filter for text/plain also matches a file with mime type application/rtf,
    since application/rtf is a subclass of text/plain. Note that [GtkFileFilter]
    allows wildcards for the subtype of a mime type, so you can e.g. filter for
    image/*.

    Normally, file filters are used by adding them to a file chooser (see
    [Gtk.FileDialog.set_filters]), but it is also possible to manually use a
    file filter on any [Gtk.FilterListModel] containing [GFileInfo] objects.

    {b GtkFileFilter as GtkBuildable}

    The [GtkFileFilter] implementation of the [GtkBuildable] interface supports
    adding rules using the [<mime-types>] and [<patterns>] and [<suffixes>]
    elements and listing the rules within. Specifying a [<mime-type>] or
    [<pattern>] or [<suffix>] has the same effect as as calling
    [Gtk.FileFilter.add_mime_type] or [Gtk.FileFilter.add_pattern] or
    [Gtk.FileFilter.add_suffix].

    An example of a UI definition fragment specifying [GtkFileFilter] rules:

    {[
    <object class=”GtkFileFilter”>
      <property name=”name” translatable=”yes”>Text and Images</property>
      <mime-types>
        <mime-type>text/plain</mime-type>
        <mime-type>image/ *</mime-type>
      </mime-types>
      <patterns>
        <pattern>*.txt</pattern>
      </patterns>
      <suffixes>
        <suffix>png</suffix>
      </suffixes>
    </object>
    ]} *)

type t = [ `file_filter | `filter | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_file_filter_new"
(** Create a new FileFilter *)

external new_from_gvariant : Gvariant.t -> t
  = "ml_gtk_file_filter_new_from_gvariant"
(** Create a new FileFilter *)

(* Methods *)

external to_gvariant : t -> Gvariant.t = "ml_gtk_file_filter_to_gvariant"
(** Serialize a file filter to an [a{sv}] variant. *)

external set_name : t -> string option -> unit = "ml_gtk_file_filter_set_name"
(** Sets a human-readable name of the filter.

    This is the string that will be displayed in the user interface if there is
    a selectable list of filters. *)

external get_name : t -> string option = "ml_gtk_file_filter_get_name"
(** Gets the human-readable name for the filter.

    See [Gtk.FileFilter.set_name]. *)

external get_attributes : t -> string array
  = "ml_gtk_file_filter_get_attributes"
(** Gets the attributes that need to be filled in for the [GFileInfo] passed to
    this filter.

    This function will not typically be used by applications; it is intended for
    use in file chooser implementation. *)

external add_suffix : t -> string -> unit = "ml_gtk_file_filter_add_suffix"
(** Adds a suffix match rule to a filter.

    This is similar to adding a match for the pattern “*.[suffix]”

    An exaple to filter files with the suffix “.sub”:

    {[
    gtk_file_filter_add_suffix (filter, “sub”);
    ]}

    Filters with multiple dots are allowed.

    In contrast to pattern matches, suffix matches are {i always}
    case-insensitive. *)

external add_pixbuf_formats : t -> unit
  = "ml_gtk_file_filter_add_pixbuf_formats"
(** Adds a rule allowing image files in the formats supported by [GdkPixbuf].

    This is equivalent to calling [Gtk.FileFilter.add_mime_type] for all the
    supported mime types. *)

external add_pattern : t -> string -> unit = "ml_gtk_file_filter_add_pattern"
(** Adds a rule allowing a shell style glob pattern.

    Note that it depends on the platform whether pattern matching ignores case
    or not. On Windows, it does, on other platforms, it doesn't. *)

external add_mime_type : t -> string -> unit
  = "ml_gtk_file_filter_add_mime_type"
(** Adds a rule allowing a given mime type. *)

(* Properties *)
