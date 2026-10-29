(** [GtkFileChooserWidget] is a widget for choosing files.

    Its methods, signals and properties are on
    {!class-type-file_chooser_widget_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.File_chooser_widget}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FileChooserWidget].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.File_chooser.class-type-file_chooser_t}Ocgtk.File_chooser}

    [GtkFileChooserWidget] is a widget for choosing files.

    It exposes the
    {{!Ocgtk.File_chooser.class-type-file_chooser_t}[Gtk.FileChooser]}
    interface, and you should use the methods of this interface to interact with
    the widget.

    {b Shortcuts and Gestures}

    [GtkFileChooserWidget] supports the following keyboard shortcuts:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.

    The following signals have default keybindings:

    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_desktop_folder}
       [Gtk.FileChooserWidget::desktop-folder]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_down_folder}
       [Gtk.FileChooserWidget::down-folder]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_home_folder}
       [Gtk.FileChooserWidget::home-folder]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_location_popup}
       [Gtk.FileChooserWidget::location-popup]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_location_popup_on_paste}
       [Gtk.FileChooserWidget::location-popup-on-paste]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_location_toggle_popup}
       [Gtk.FileChooserWidget::location-toggle-popup]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_places_shortcut}
       [Gtk.FileChooserWidget::places-shortcut]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_quick_bookmark}
       [Gtk.FileChooserWidget::quick-bookmark]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_recent_shortcut}
       [Gtk.FileChooserWidget::recent-shortcut]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_search_shortcut}
       [Gtk.FileChooserWidget::search-shortcut]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_show_hidden}
       [Gtk.FileChooserWidget::show-hidden]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_up_folder}
       [Gtk.FileChooserWidget::up-folder]}

    {b CSS nodes}

    [GtkFileChooserWidget] has a single CSS node with name filechooser. *)
class type file_chooser_widget_t = object
  inherit Widget.widget_t
  inherit File_chooser.file_chooser_t

  (** {2:signals Signals} *)

  method on_desktop_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      This is used to make the file chooser show the user's Desktop folder in
      the file list.

      The default binding for this signal is <kbd>Alt</kbd>-<kbd>D</kbd>. *)

  method on_down_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted when the user asks for it.\n\n\
     This is a keybinding signal.\n\n\
     This is used to make the file chooser go to a child of the\n\
     current folder in the file hierarchy. The subfolder that will\n\
     be used is displayed in the path bar widget of the file chooser.\n\
     For example, if the path bar is showing \"/foo/bar/baz\", with bar\n\
     currently displayed, then this will cause the file chooser to\n\
     switch to the \"baz\" subfolder.\n\n\
     The default binding for this signal is <kbd>Alt</kbd>-<kbd>Down</kbd>."]

  method on_home_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      This is used to make the file chooser show the user's home folder in the
      file list.

      The default binding for this signal is <kbd>Alt</kbd>-<kbd>Home</kbd>. *)

  method on_location_popup :
    ?after:bool ->
    callback:(path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted when the user asks for it.\n\n\
     This is a keybinding signal.\n\n\
     This is used to make the file chooser show a \"Location\" prompt which\n\
     the user can use to manually type the name of the file he wishes to \
     select.\n\n\
     The default bindings for this signal are <kbd>Control</kbd>-<kbd>L</kbd>\n\
     with a [path] string of \"\" (the empty string). It is also bound to\n\
     <kbd>/</kbd> with a [path] string of \"[/]\" (a slash):  this lets you\n\
     type [/] and immediately type a path name. On Unix systems, this is\n\
     bound to <kbd>~</kbd> (tilde) with a [path] string of \"~\" itself for\n\
     access to home directories."]

  method on_location_popup_on_paste :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted when the user asks for it.\n\n\
     This is a keybinding signal.\n\n\
     This is used to make the file chooser show a \"Location\" prompt\n\
     when the user pastes into a [GtkFileChooserWidget].\n\n\
     The default binding for this signal is <kbd>Control</kbd>-<kbd>V</kbd>."]

  method on_location_toggle_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted when the user asks for it.\n\n\
     This is a keybinding signal.\n\n\
     This is used to toggle the visibility of a \"Location\" prompt\n\
     which the user can use to manually type the name of the file\n\
     he wishes to select.\n\n\
     The default binding for this signal is <kbd>Control</kbd>-<kbd>L</kbd>."]

  method on_places_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      This is used to move the focus to the places sidebar.

      The default binding for this signal is <kbd>Alt</kbd>-<kbd>P</kbd>. *)

  method on_quick_bookmark :
    ?after:bool ->
    callback:(bookmark_index:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      This is used to make the file chooser switch to the bookmark specified in
      the [bookmark_index] parameter. For example, if you have three bookmarks,
      you can pass 0, 1, 2 to this signal to switch to each of them,
      respectively.

      The default binding for this signal is <kbd>Alt</kbd>-<kbd>1</kbd>,
      <kbd>Alt</kbd>-<kbd>2</kbd>, etc. until <kbd>Alt</kbd>-<kbd>0</kbd>. Note
      that in the default binding, that <kbd>Alt</kbd>-<kbd>1</kbd> is actually
      defined to switch to the bookmark at index 0, and so on successively. *)

  method on_recent_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      This is used to make the file chooser show the Recent location.

      The default binding for this signal is <kbd>Alt</kbd>-<kbd>R</kbd>. *)

  method on_search_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      This is used to make the file chooser show the search entry.

      The default binding for this signal is <kbd>Alt</kbd>-<kbd>S</kbd>. *)

  method on_show_hidden :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      This is used to make the file chooser display hidden files.

      The default binding for this signal is <kbd>Control</kbd>-<kbd>H</kbd>. *)

  method on_up_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      This is used to make the file chooser go to the parent of the current
      folder in the file hierarchy.

      The default binding for this signal is <kbd>Alt</kbd>-<kbd>Up</kbd>. *)

  (** {2:properties Properties} *)

  method search_mode : bool
  (** Whether search mode is enabled. *)

  method set_search_mode : bool -> unit
  (** Whether search mode is enabled. *)

  method show_time : bool
  (** Whether to show the time. *)

  method subtitle : string
  (** The subtitle of the file chooser widget. *)

  (** {2:conversions Conversions} *)

  method as_file_chooser_widget : Raw.File_chooser_widget.t
end

class file_chooser_widget : Raw.File_chooser_widget.t -> file_chooser_widget_t
(** Wraps a raw handle of {!Ocgtk.Raw.File_chooser_widget.t}. *)

(** {1:description Description}

    [GtkFileChooserWidget] is a widget for choosing files.

    It exposes the
    {{!Ocgtk.File_chooser.class-type-file_chooser_t}[Gtk.FileChooser]}
    interface, and you should use the methods of this interface to interact with
    the widget.

    {b Shortcuts and Gestures}

    [GtkFileChooserWidget] supports the following keyboard shortcuts:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.

    The following signals have default keybindings:

    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_desktop_folder}
       [Gtk.FileChooserWidget::desktop-folder]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_down_folder}
       [Gtk.FileChooserWidget::down-folder]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_home_folder}
       [Gtk.FileChooserWidget::home-folder]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_location_popup}
       [Gtk.FileChooserWidget::location-popup]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_location_popup_on_paste}
       [Gtk.FileChooserWidget::location-popup-on-paste]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_location_toggle_popup}
       [Gtk.FileChooserWidget::location-toggle-popup]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_places_shortcut}
       [Gtk.FileChooserWidget::places-shortcut]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_quick_bookmark}
       [Gtk.FileChooserWidget::quick-bookmark]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_recent_shortcut}
       [Gtk.FileChooserWidget::recent-shortcut]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_search_shortcut}
       [Gtk.FileChooserWidget::search-shortcut]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_show_hidden}
       [Gtk.FileChooserWidget::show-hidden]}
    - {{!Ocgtk.File_chooser_widget.class-type-file_chooser_widget_t.method-on_up_folder}
       [Gtk.FileChooserWidget::up-folder]}

    {b CSS nodes}

    [GtkFileChooserWidget] has a single CSS node with name filechooser. *)

(** {1:constructors Constructors} *)

val new_ : Enums.filechooseraction -> file_chooser_widget_t
(** Creates a new [GtkFileChooserWidget].

    This is a file chooser widget that can be embedded in custom windows, and it
    is the same widget that is used by [GtkFileChooserDialog]. *)
