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

(* High-level class for FileChooserWidget *)
class file_chooser_widget (obj : Raw.File_chooser_widget.t) :
  file_chooser_widget_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit File_chooser.file_chooser (Raw.File_chooser.from_gobject obj)

    method on_desktop_folder ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_desktop_folder ~after
        self#as_file_chooser_widget ~callback

    method on_down_folder ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_down_folder ~after self#as_file_chooser_widget
        ~callback

    method on_home_folder ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_home_folder ~after self#as_file_chooser_widget
        ~callback

    method on_location_popup ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_location_popup ~after
        self#as_file_chooser_widget ~callback

    method on_location_popup_on_paste ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_location_popup_on_paste ~after
        self#as_file_chooser_widget ~callback

    method on_location_toggle_popup ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_location_toggle_popup ~after
        self#as_file_chooser_widget ~callback

    method on_places_shortcut ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_places_shortcut ~after
        self#as_file_chooser_widget ~callback

    method on_quick_bookmark ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_quick_bookmark ~after
        self#as_file_chooser_widget ~callback

    method on_recent_shortcut ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_recent_shortcut ~after
        self#as_file_chooser_widget ~callback

    method on_search_shortcut ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_search_shortcut ~after
        self#as_file_chooser_widget ~callback

    method on_show_hidden ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_show_hidden ~after self#as_file_chooser_widget
        ~callback

    method on_up_folder ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_up_folder ~after self#as_file_chooser_widget
        ~callback

    method search_mode = Raw.File_chooser_widget.get_search_mode obj
    method set_search_mode v = Raw.File_chooser_widget.set_search_mode obj v
    method show_time = Raw.File_chooser_widget.get_show_time obj
    method subtitle = Raw.File_chooser_widget.get_subtitle obj
    method as_file_chooser_widget = obj
  end

let new_ (action : Enums.filechooseraction) : file_chooser_widget_t =
  let obj_ = Raw.File_chooser_widget.new_ action in
  new file_chooser_widget obj_
