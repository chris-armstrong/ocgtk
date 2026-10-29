(** [GtkFileChooser] is an interface that can be implemented by file selection
    widgets.

    Its methods, signals and properties are on {!class-type-file_chooser_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.File_chooser}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FileChooser].}

    [GtkFileChooser] is an interface that can be implemented by file selection
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
    rendered as a combo box. *)
class type file_chooser_t = object
  (** {2:methods Methods} *)

  method add_choice :
    string -> string -> string array option -> string array option -> unit
  (** Adds a 'choice' to the file chooser.

      This is typically implemented as a combobox or, for boolean choices, as a
      checkbutton. You can select a value using [Gtk.FileChooser.set_choice]
      before the dialog is shown, and you can obtain the user-selected value in
      the [Gtk.Dialog::response] signal handler using
      [Gtk.FileChooser.get_choice]. *)

  method add_filter : File_filter.file_filter_t -> unit
  (** Adds [filter] to the list of filters that the user can select between.

      When a filter is selected, only files that are passed by that filter are
      displayed.

      Note that the [chooser] takes ownership of the filter if it is floating,
      so you have to ref and sink it if you want to keep a reference. *)

  method add_shortcut_folder : Ocgio.File.file_t -> (bool, GError.t) result
  (** Adds a folder to be displayed with the shortcut folders in a file chooser.
  *)

  method get_action : unit -> Enums.filechooseraction
  (** Gets the type of operation that the file chooser is performing. *)

  method get_choice : string -> string option
  (** Gets the currently selected option in the 'choice' with the given ID. *)

  method get_create_folders : unit -> bool
  (** Gets whether file chooser will offer to create new folders. *)

  method get_current_folder : unit -> Ocgio.File.file_t option
  (** Gets the current folder of [chooser] as [GFile]. *)

  method get_current_name : unit -> string option
  (** Gets the current name in the file selector, as entered by the user.

      This is meant to be used in save dialogs, to get the currently typed
      filename when the file itself does not exist yet. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the [GFile] for the currently selected file in the file selector.

      If multiple files are selected, one of the files will be returned at
      random.

      If the file chooser is in folder mode, this function returns the selected
      folder. *)

  method get_files : unit -> Ocgio.List_model.list_model_t
  (** Lists all the selected files and subfolders in the current folder of
      [chooser] as [GFile]. *)

  method get_filter : unit -> File_filter.file_filter_t option
  (** Gets the current filter. *)

  method get_filters : unit -> Ocgio.List_model.list_model_t
  (** Gets the current set of user-selectable filters, as a list model.

      See [Gtk.FileChooser.add_filter] and [Gtk.FileChooser.remove_filter] for
      changing individual filters.

      You should not modify the returned list model. Future changes to [chooser]
      may or may not affect the returned model. *)

  method get_select_multiple : unit -> bool
  (** Gets whether multiple files can be selected in the file chooser. *)

  method get_shortcut_folders : unit -> Ocgio.List_model.list_model_t
  (** Queries the list of shortcut folders in the file chooser.

      You should not modify the returned list model. Future changes to [chooser]
      may or may not affect the returned model. *)

  method remove_choice : string -> unit
  (** Removes a 'choice' that has been added with gtk_file_chooser_add_choice().
  *)

  method remove_filter : File_filter.file_filter_t -> unit
  (** Removes [filter] from the list of filters that the user can select
      between. *)

  method remove_shortcut_folder : Ocgio.File.file_t -> (bool, GError.t) result
  (** Removes a folder from the shortcut folders in a file chooser. *)

  method set_action : Enums.filechooseraction -> unit
  (** Sets the type of operation that the chooser is performing.

      The user interface is adapted to suit the selected action.

      For example, an option to create a new folder might be shown if the action
      is [GTK_FILE_CHOOSER_ACTION_SAVE] but not if the action is
      [GTK_FILE_CHOOSER_ACTION_OPEN]. *)

  method set_choice : string -> string -> unit
  [@@ocaml.doc
    "Selects an option in a 'choice' that has been added with\n\
     gtk_file_chooser_add_choice().\n\n\
     For a boolean choice, the possible options are \"true\" and \"false\"."]

  method set_create_folders : bool -> unit
  (** Sets whether file chooser will offer to create new folders.

      This is only relevant if the action is not set to be
      [GTK_FILE_CHOOSER_ACTION_OPEN]. *)

  method set_current_folder :
    Ocgio.File.file_t option -> (bool, GError.t) result
  (** Sets the current folder for [chooser] from a [GFile]. *)

  method set_current_name : string -> unit
  (** Sets the current name in the file selector, as if entered by the user.

      Note that the name passed in here is a UTF-8 string rather than a
      filename. This function is meant for such uses as a suggested name in a
      “Save As...” dialog. You can pass “Untitled.doc” or a similarly suitable
      suggestion for the [name].

      If you want to preselect a particular existing file, you should use
      [Gtk.FileChooser.set_file] instead.

      Please see the documentation for those functions for an example of using
      [Gtk.FileChooser.set_current_name] as well. *)

  method set_file : Ocgio.File.file_t -> (bool, GError.t) result
  [@@ocaml.doc
    "Sets [file] as the current filename for the file chooser.\n\n\
     This includes changing to the file’s parent folder and actually selecting\n\
     the file in list. If the [chooser] is in [GTK_FILE_CHOOSER_ACTION_SAVE] \
     mode,\n\
     the file’s base name will also appear in the dialog’s file name entry.\n\n\
     If the file name isn’t in the current folder of [chooser], then the current\n\
     folder of [chooser] will be changed to the folder containing [file].\n\n\
     Note that the file must exist, or nothing will be done except\n\
     for the directory change.\n\n\
     If you are implementing a save dialog, you should use this function if\n\
     you already have a file name to which the user may save; for example,\n\
     when the user opens an existing file and then does “Save As…”. If you\n\
     don’t have a file name already — for example, if the user just created\n\
     a new file and is saving it for the first time, do not call this \
     function.\n\n\
     Instead, use something similar to this:\n\n\
     {[\n\
     static void\n\
     prepare_file_chooser (GtkFileChooser *chooser,\n\
    \                      GFile          *existing_file)\n\
     {\n\
    \  gboolean document_is_new = (existing_file == NULL);\n\n\
    \  if (document_is_new)\n\
    \    {\n\
    \      GFile *default_file_for_saving = g_file_new_for_path (\"./out.txt\");\n\
    \      // the user just created a new document\n\
    \      gtk_file_chooser_set_current_folder (chooser, \
     default_file_for_saving, NULL);\n\
    \      gtk_file_chooser_set_current_name (chooser, \"Untitled document\");\n\
    \      g_object_unref (default_file_for_saving);\n\
    \    }\n\
    \  else\n\
    \    {\n\
    \      // the user edited an existing document\n\
    \      gtk_file_chooser_set_file (chooser, existing_file, NULL);\n\
    \    }\n\
     }\n\
     ]}"]

  method set_filter : File_filter.file_filter_t -> unit
  (** Sets the current filter.

      Only the files that pass the filter will be displayed. If the
      user-selectable list of filters is non-empty, then the filter should be
      one of the filters in that list.

      Setting the current filter when the list of filters is empty is useful if
      you want to restrict the displayed set of files without letting the user
      change it. *)

  method set_select_multiple : bool -> unit
  (** Sets whether multiple files can be selected in the file chooser.

      This is only relevant if the action is set to be
      [GTK_FILE_CHOOSER_ACTION_OPEN] or [GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER].
  *)

  (** {2:conversions Conversions} *)

  method as_file_chooser : Raw.File_chooser.t
end

class file_chooser : Raw.File_chooser.t -> file_chooser_t
(** Wraps a raw handle of {!Ocgtk.Raw.File_chooser.t}. *)

(** {1:description Description}

    [GtkFileChooser] is an interface that can be implemented by file selection
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
    rendered as a combo box. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
