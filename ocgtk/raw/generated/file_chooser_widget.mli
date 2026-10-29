(* GENERATED CODE - DO NOT EDIT *)
(* FileChooserWidget: FileChooserWidget *)

(** [GtkFileChooserWidget] is a widget for choosing files.

    It exposes the {{!Ocgtk.Raw.File_chooser}[Gtk.FileChooser]} interface, and
    you should use the methods of this interface to interact with the widget.

    {b Shortcuts and Gestures}

    [GtkFileChooserWidget] supports the following keyboard shortcuts:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.

    The following signals have default keybindings:

    - [Gtk.FileChooserWidget::desktop-folder]
    - [Gtk.FileChooserWidget::down-folder]
    - [Gtk.FileChooserWidget::home-folder]
    - [Gtk.FileChooserWidget::location-popup]
    - [Gtk.FileChooserWidget::location-popup-on-paste]
    - [Gtk.FileChooserWidget::location-toggle-popup]
    - [Gtk.FileChooserWidget::places-shortcut]
    - [Gtk.FileChooserWidget::quick-bookmark]
    - [Gtk.FileChooserWidget::recent-shortcut]
    - [Gtk.FileChooserWidget::search-shortcut]
    - [Gtk.FileChooserWidget::show-hidden]
    - [Gtk.FileChooserWidget::up-folder]

    {b CSS nodes}

    [GtkFileChooserWidget] has a single CSS node with name filechooser.

    The class built on this module is in {!Ocgtk.File_chooser_widget}. *)

type t =
  [ `file_chooser_widget | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_file_chooser_widget_get_type"

external new_ : Ocgtk_enums.filechooseraction -> t
  = "ml_gtk_file_chooser_widget_new"
(** Creates a new [GtkFileChooserWidget].

    This is a file chooser widget that can be embedded in custom windows, and it
    is the same widget that is used by [GtkFileChooserDialog]. *)

(* Methods *)
(* Properties *)

external get_search_mode : t -> bool
  = "ml_gtk_file_chooser_widget_get_search_mode"
(** Whether search mode is enabled. *)

external set_search_mode : t -> bool -> unit
  = "ml_gtk_file_chooser_widget_set_search_mode"
(** Whether search mode is enabled. *)

external get_show_time : t -> bool = "ml_gtk_file_chooser_widget_get_show_time"
(** Whether to show the time. *)

external get_subtitle : t -> string = "ml_gtk_file_chooser_widget_get_subtitle"
(** The subtitle of the file chooser widget. *)

val on_desktop_folder :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user asks for it.

    This is a keybinding signal.

    This is used to make the file chooser show the user's Desktop folder in the
    file list.

    The default binding for this signal is <kbd>Alt</kbd>-<kbd>D</kbd>. *)

val on_down_folder :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
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

val on_home_folder :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user asks for it.

    This is a keybinding signal.

    This is used to make the file chooser show the user's home folder in the
    file list.

    The default binding for this signal is <kbd>Alt</kbd>-<kbd>Home</kbd>. *)

val on_location_popup :
  ?after:bool ->
  t ->
  callback:(path:string -> unit) ->
  Gobject.Signal.handler_id
[@@ocaml.doc
  "Emitted when the user asks for it.\n\n\
   This is a keybinding signal.\n\n\
   This is used to make the file chooser show a \"Location\" prompt which\n\
   the user can use to manually type the name of the file he wishes to select.\n\n\
   The default bindings for this signal are <kbd>Control</kbd>-<kbd>L</kbd>\n\
   with a [path] string of \"\" (the empty string). It is also bound to\n\
   <kbd>/</kbd> with a [path] string of \"[/]\" (a slash):  this lets you\n\
   type [/] and immediately type a path name. On Unix systems, this is\n\
   bound to <kbd>~</kbd> (tilde) with a [path] string of \"~\" itself for\n\
   access to home directories."]

val on_location_popup_on_paste :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
[@@ocaml.doc
  "Emitted when the user asks for it.\n\n\
   This is a keybinding signal.\n\n\
   This is used to make the file chooser show a \"Location\" prompt\n\
   when the user pastes into a [GtkFileChooserWidget].\n\n\
   The default binding for this signal is <kbd>Control</kbd>-<kbd>V</kbd>."]

val on_location_toggle_popup :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
[@@ocaml.doc
  "Emitted when the user asks for it.\n\n\
   This is a keybinding signal.\n\n\
   This is used to toggle the visibility of a \"Location\" prompt\n\
   which the user can use to manually type the name of the file\n\
   he wishes to select.\n\n\
   The default binding for this signal is <kbd>Control</kbd>-<kbd>L</kbd>."]

val on_places_shortcut :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user asks for it.

    This is a keybinding signal.

    This is used to move the focus to the places sidebar.

    The default binding for this signal is <kbd>Alt</kbd>-<kbd>P</kbd>. *)

val on_quick_bookmark :
  ?after:bool ->
  t ->
  callback:(bookmark_index:int -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when the user asks for it.

    This is a keybinding signal.

    This is used to make the file chooser switch to the bookmark specified in
    the [bookmark_index] parameter. For example, if you have three bookmarks,
    you can pass 0, 1, 2 to this signal to switch to each of them, respectively.

    The default binding for this signal is <kbd>Alt</kbd>-<kbd>1</kbd>,
    <kbd>Alt</kbd>-<kbd>2</kbd>, etc. until <kbd>Alt</kbd>-<kbd>0</kbd>. Note
    that in the default binding, that <kbd>Alt</kbd>-<kbd>1</kbd> is actually
    defined to switch to the bookmark at index 0, and so on successively. *)

val on_recent_shortcut :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user asks for it.

    This is a keybinding signal.

    This is used to make the file chooser show the Recent location.

    The default binding for this signal is <kbd>Alt</kbd>-<kbd>R</kbd>. *)

val on_search_shortcut :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user asks for it.

    This is a keybinding signal.

    This is used to make the file chooser show the search entry.

    The default binding for this signal is <kbd>Alt</kbd>-<kbd>S</kbd>. *)

val on_show_hidden :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user asks for it.

    This is a keybinding signal.

    This is used to make the file chooser display hidden files.

    The default binding for this signal is <kbd>Control</kbd>-<kbd>H</kbd>. *)

val on_up_folder :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user asks for it.

    This is a keybinding signal.

    This is used to make the file chooser go to the parent of the current folder
    in the file hierarchy.

    The default binding for this signal is <kbd>Alt</kbd>-<kbd>Up</kbd>. *)
