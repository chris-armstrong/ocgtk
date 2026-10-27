(** [GtkFileChooserWidget] is a widget for choosing files.

    It exposes the [Gtk.FileChooser] interface, and you should use the methods
    of this interface to interact with the widget.

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

    Its methods, signals and properties are on
    {!class-type-file_chooser_widget_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.File_chooser_widget}. *)

(** The methods, signals and properties of a [GtkFileChooserWidget]. *)
class type file_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit File_chooser.file_chooser_t

  method on_desktop_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_down_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_home_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_location_popup :
    ?after:bool ->
    callback:(path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_location_popup_on_paste :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_location_toggle_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_places_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_quick_bookmark :
    ?after:bool ->
    callback:(bookmark_index:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_recent_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_search_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_show_hidden :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_up_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method search_mode : bool
  method set_search_mode : bool -> unit
  method show_time : bool
  method subtitle : string
  method as_file_chooser_widget : Raw.File_chooser_widget.t
end

class file_chooser_widget : Raw.File_chooser_widget.t -> file_chooser_widget_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.File_chooser_widget.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkFileChooserWidget], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Enums.filechooseraction -> file_chooser_widget_t
(** Creates a new [GtkFileChooserWidget].

    This is a file chooser widget that can be embedded in custom windows, and it
    is the same widget that is used by [GtkFileChooserDialog]. *)
