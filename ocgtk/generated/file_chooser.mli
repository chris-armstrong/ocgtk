(** [GtkFileChooser] is an interface that can be implemented by file selection
    widgets.

    In GTK, the main objects that implement this interface are
    [Gtk.FileChooserWidget] and [Gtk.FileChooserDialog].

    You do not need to write an object that implements the [GtkFileChooser]
    interface unless you are trying to adapt an existing file selector to expose
    a standard programming interface.

    [GtkFileChooser] allows for shortcuts to various places in the filesystem.
    In the default implementation these are displayed in the left pane. It may
    be a bit confusing at first that these shortcuts come from various sources
    and in various flavours, so lets explain the terminology here:

    - Bookmarks: are created by the user, by dragging folders from the right
      pane to the left pane, or by using the “Add”. Bookmarks can be renamed and
      deleted by the user.

    - Shortcuts: can be provided by the application. For example, a Paint
      program may want to add a shortcut for a Clipart folder. Shortcuts cannot
      be modified by the user.

    - Volumes: are provided by the underlying filesystem abstraction. They are
      the “roots” of the filesystem.

    {b File Names and Encodings}

    When the user is finished selecting files in a [GtkFileChooser], your
    program can get the selected filenames as [GFile]s.

    {b Adding options}

    You can add extra widgets to a file chooser to provide options that are not
    present in the default design, by using [Gtk.FileChooser.add_choice]. Each
    choice has an identifier and a user visible label; additionally, each choice
    can have multiple options. If a choice has no option, it will be rendered as
    a check button with the given label; if a choice has options, it will be
    rendered as a combo box.

    Its methods, signals and properties are on {!class-type-file_chooser_t}. The
    functions it is built on are in {!Ocgtk.Raw.File_chooser}. *)

(** The methods, signals and properties of a [GtkFileChooser]. *)
class type file_chooser_t = object
  method add_choice :
    string -> string -> string array option -> string array option -> unit

  method add_filter : File_filter.file_filter_t -> unit
  method add_shortcut_folder : Ocgio.File.file_t -> (bool, GError.t) result
  method get_action : unit -> Enums.filechooseraction
  method get_choice : string -> string option
  method get_create_folders : unit -> bool
  method get_current_folder : unit -> Ocgio.File.file_t option
  method get_current_name : unit -> string option
  method get_file : unit -> Ocgio.File.file_t option
  method get_files : unit -> Ocgio.List_model.list_model_t
  method get_filter : unit -> File_filter.file_filter_t option
  method get_filters : unit -> Ocgio.List_model.list_model_t
  method get_select_multiple : unit -> bool
  method get_shortcut_folders : unit -> Ocgio.List_model.list_model_t
  method remove_choice : string -> unit
  method remove_filter : File_filter.file_filter_t -> unit
  method remove_shortcut_folder : Ocgio.File.file_t -> (bool, GError.t) result
  method set_action : Enums.filechooseraction -> unit
  method set_choice : string -> string -> unit
  method set_create_folders : bool -> unit

  method set_current_folder :
    Ocgio.File.file_t option -> (bool, GError.t) result

  method set_current_name : string -> unit
  method set_file : Ocgio.File.file_t -> (bool, GError.t) result
  method set_filter : File_filter.file_filter_t -> unit
  method set_select_multiple : bool -> unit
  method as_file_chooser : Raw.File_chooser.t
end

class file_chooser : Raw.File_chooser.t -> file_chooser_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.File_chooser.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFileChooser], give one already wrapped. *)
