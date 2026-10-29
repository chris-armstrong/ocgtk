(* GENERATED CODE - DO NOT EDIT *)
(* FileChooserWidget: FileChooserWidget *)

(** [GtkFileChooserWidget] is a widget for choosing files.

    It exposes the {{!Ocgtk.Raw.File_chooser}[Gtk.FileChooser]} interface, and
    you should use the methods of this interface to interact with the widget.

    {b Shortcuts and Gestures}

    [GtkFileChooserWidget] supports the following keyboard shortcuts:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.

    The following signals have default keybindings:

    - {{!Ocgtk.Raw.File_chooser_widget.val-on_desktop_folder}[Gtk.FileChooserWidget::desktop-folder]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_down_folder}[Gtk.FileChooserWidget::down-folder]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_home_folder}[Gtk.FileChooserWidget::home-folder]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_location_popup}[Gtk.FileChooserWidget::location-popup]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_location_popup_on_paste}[Gtk.FileChooserWidget::location-popup-on-paste]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_location_toggle_popup}[Gtk.FileChooserWidget::location-toggle-popup]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_places_shortcut}[Gtk.FileChooserWidget::places-shortcut]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_quick_bookmark}[Gtk.FileChooserWidget::quick-bookmark]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_recent_shortcut}[Gtk.FileChooserWidget::recent-shortcut]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_search_shortcut}[Gtk.FileChooserWidget::search-shortcut]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_show_hidden}[Gtk.FileChooserWidget::show-hidden]}
    - {{!Ocgtk.Raw.File_chooser_widget.val-on_up_folder}[Gtk.FileChooserWidget::up-folder]}

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

let on_desktop_folder ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"desktop-folder" ~callback
    ~after:(Option.value after ~default:false)

let on_down_folder ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"down-folder" ~callback
    ~after:(Option.value after ~default:false)

let on_home_folder ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"home-folder" ~callback
    ~after:(Option.value after ~default:false)

let on_location_popup ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let path =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        callback ~path)
  in
  Gobject.Signal.connect obj ~name:"location-popup" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_location_popup_on_paste ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"location-popup-on-paste" ~callback
    ~after:(Option.value after ~default:false)

let on_location_toggle_popup ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"location-toggle-popup" ~callback
    ~after:(Option.value after ~default:false)

let on_places_shortcut ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"places-shortcut" ~callback
    ~after:(Option.value after ~default:false)

let on_quick_bookmark ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let bookmark_index =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_int v
        in
        callback ~bookmark_index)
  in
  Gobject.Signal.connect obj ~name:"quick-bookmark" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_recent_shortcut ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"recent-shortcut" ~callback
    ~after:(Option.value after ~default:false)

let on_search_shortcut ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"search-shortcut" ~callback
    ~after:(Option.value after ~default:false)

let on_show_hidden ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"show-hidden" ~callback
    ~after:(Option.value after ~default:false)

let on_up_folder ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"up-folder" ~callback
    ~after:(Option.value after ~default:false)
