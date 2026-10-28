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

(* High-level class for FileFilter *)
class file_filter (obj : Raw.File_filter.t) : file_filter_t =
  object (self)
    inherit Filter.filter (obj :> Raw.Filter.t)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method add_mime_type : string -> unit =
      fun mime_type -> Raw.File_filter.add_mime_type obj mime_type

    method add_pattern : string -> unit =
      fun pattern -> Raw.File_filter.add_pattern obj pattern

    method add_pixbuf_formats : unit -> unit =
      fun () -> Raw.File_filter.add_pixbuf_formats obj

    method add_suffix : string -> unit =
      fun suffix -> Raw.File_filter.add_suffix obj suffix

    method get_attributes : unit -> string array =
      fun () -> Raw.File_filter.get_attributes obj

    method get_name : unit -> string option =
      fun () -> Raw.File_filter.get_name obj

    method set_name : string option -> unit =
      fun name -> Raw.File_filter.set_name obj name

    method to_gvariant : unit -> Gvariant.t =
      fun () -> Raw.File_filter.to_gvariant obj

    method as_file_filter = obj
  end

let new_ () : file_filter_t = new file_filter (Raw.File_filter.new_ ())

let new_from_gvariant (variant : Gvariant.t) : file_filter_t =
  let obj_ = Raw.File_filter.new_from_gvariant variant in
  new file_filter obj_
