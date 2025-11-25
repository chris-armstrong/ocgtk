(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileFilter *)

type t = Gtk.widget

(** Create a new FileFilter *)
external new_ : unit -> t = "ml_gtk_file_filter_new"

(** Create a new FileFilter *)
external new_from_gvariant : unit -> t = "ml_gtk_file_filter_new_from_gvariant"

(* Properties *)

(** Sets a human-readable name of the filter.

This is the string that will be displayed in the file chooser
if there is a selectable list of filters. *)
external set_name : t -> string option -> unit = "ml_gtk_file_filter_set_name"

(** Gets the human-readable name for the filter.

See [method@Gtk.FileFilter.set_name]. *)
external get_name : t -> string option = "ml_gtk_file_filter_get_name"

(** Gets the attributes that need to be filled in for the `GFileInfo`
passed to this filter.

This function will not typically be used by applications;
it is intended principally for use in the implementation
of `GtkFileChooser`. *)
external get_attributes : t -> unit = "ml_gtk_file_filter_get_attributes"

(** Adds a suffix match rule to a filter.

This is similar to adding a match for the pattern
"*.@suffix".

In contrast to pattern matches, suffix matches
are *always* case-insensitive. *)
external add_suffix : t -> string -> unit = "ml_gtk_file_filter_add_suffix"

(** Adds a rule allowing image files in the formats supported
by GdkPixbuf.

This is equivalent to calling [method@Gtk.FileFilter.add_mime_type]
for all the supported mime types. *)
external add_pixbuf_formats : t -> unit = "ml_gtk_file_filter_add_pixbuf_formats"

(** Adds a rule allowing a shell style glob to a filter.

Note that it depends on the platform whether pattern
matching ignores case or not. On Windows, it does, on
other platforms, it doesn't. *)
external add_pattern : t -> string -> unit = "ml_gtk_file_filter_add_pattern"

(** Adds a rule allowing a given mime type to @filter. *)
external add_mime_type : t -> string -> unit = "ml_gtk_file_filter_add_mime_type"

