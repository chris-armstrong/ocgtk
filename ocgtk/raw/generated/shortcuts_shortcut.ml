(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutsShortcut: ShortcutsShortcut *)

(** A [GtkShortcutsShortcut] represents a single keyboard shortcut or gesture
    with a short text.

    This widget is only meant to be used with [GtkShortcutsWindow].

    The class built on this module is in {!Ocgtk.Shortcuts_shortcut}. *)

type t =
  [ `shortcuts_shortcut | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_shortcuts_shortcut_get_type"

(* Methods *)
(* Properties *)

external set_accel_size_group : t -> Size_group.t -> unit
  = "ml_gtk_shortcuts_shortcut_set_accel_size_group"
(** The size group for the accelerator portion of this shortcut.

    This is used internally by GTK, and must not be modified by applications. *)

external get_accelerator : t -> string
  = "ml_gtk_shortcuts_shortcut_get_accelerator"
[@@ocaml.doc
  "The accelerator(s) represented by this object.\n\n\
   This property is used if [Gtk.ShortcutsShortcut:shortcut-type]\n\
   is set to [GTK_SHORTCUT_ACCELERATOR].\n\n\
   The syntax of this property is (an extension of) the syntax understood\n\
   by [Gtk.accelerator_parse]. Multiple accelerators can be specified\n\
   by separating them with a space, but keep in mind that the available width\n\
   is limited.\n\n\
   It is also possible to specify ranges of shortcuts, using [...] between\n\
   the keys. Sequences of keys can be specified using a [+] or [&] between\n\
   the keys.\n\n\
   Examples:\n\n\
   - A single shortcut: [<ctl><alt>delete]\n\
   - Two alternative shortcuts: [<shift>a Home]\n\
   - A range of shortcuts: [<alt>1...<alt>9]\n\
   - Several keys pressed together: [Control_L&Control_R]\n\
   - A sequence of shortcuts or keys: [<ctl>c+<ctl>x]\n\n\
   Use \"+\" instead of \"&\" when the keys may (or have to be) pressed\n\
   sequentially (e.g use \"t+t\" for 'press the t key twice').\n\n\
   Note that [<], [>] and [&] need to be escaped as [&lt;], [&gt]; and [&amp]; \
   when used\n\
   in .ui files."]

external set_accelerator : t -> string -> unit
  = "ml_gtk_shortcuts_shortcut_set_accelerator"
[@@ocaml.doc
  "The accelerator(s) represented by this object.\n\n\
   This property is used if [Gtk.ShortcutsShortcut:shortcut-type]\n\
   is set to [GTK_SHORTCUT_ACCELERATOR].\n\n\
   The syntax of this property is (an extension of) the syntax understood\n\
   by [Gtk.accelerator_parse]. Multiple accelerators can be specified\n\
   by separating them with a space, but keep in mind that the available width\n\
   is limited.\n\n\
   It is also possible to specify ranges of shortcuts, using [...] between\n\
   the keys. Sequences of keys can be specified using a [+] or [&] between\n\
   the keys.\n\n\
   Examples:\n\n\
   - A single shortcut: [<ctl><alt>delete]\n\
   - Two alternative shortcuts: [<shift>a Home]\n\
   - A range of shortcuts: [<alt>1...<alt>9]\n\
   - Several keys pressed together: [Control_L&Control_R]\n\
   - A sequence of shortcuts or keys: [<ctl>c+<ctl>x]\n\n\
   Use \"+\" instead of \"&\" when the keys may (or have to be) pressed\n\
   sequentially (e.g use \"t+t\" for 'press the t key twice').\n\n\
   Note that [<], [>] and [&] need to be escaped as [&lt;], [&gt]; and [&amp]; \
   when used\n\
   in .ui files."]

external get_action_name : t -> string
  = "ml_gtk_shortcuts_shortcut_get_action_name"
(** A detailed action name.

    If this is set for a shortcut of type [GTK_SHORTCUT_ACCELERATOR], then GTK
    will use the accelerators that are associated with the action via
    [Gtk.Application.set_accels_for_action], and setting
    [Gtk.ShortcutsShortcut:accelerator] is not necessary. *)

external set_action_name : t -> string -> unit
  = "ml_gtk_shortcuts_shortcut_set_action_name"
(** A detailed action name.

    If this is set for a shortcut of type [GTK_SHORTCUT_ACCELERATOR], then GTK
    will use the accelerators that are associated with the action via
    [Gtk.Application.set_accels_for_action], and setting
    [Gtk.ShortcutsShortcut:accelerator] is not necessary. *)

external get_direction : t -> Ocgtk_enums.textdirection
  = "ml_gtk_shortcuts_shortcut_get_direction"
(** The text direction for which this shortcut is active.

    If the shortcut is used regardless of the text direction, set this property
    to [GTK_TEXT_DIR_NONE]. *)

external set_direction : t -> Ocgtk_enums.textdirection -> unit
  = "ml_gtk_shortcuts_shortcut_set_direction"
(** The text direction for which this shortcut is active.

    If the shortcut is used regardless of the text direction, set this property
    to [GTK_TEXT_DIR_NONE]. *)

external get_icon : t -> Ocgio_raw.Icon.t = "ml_gtk_shortcuts_shortcut_get_icon"
(** An icon to represent the shortcut or gesture.

    This property is used if [Gtk.ShortcutsShortcut:shortcut-type] is set to
    [GTK_SHORTCUT_GESTURE].

    For the other predefined gesture types, GTK provides an icon on its own. *)

external set_icon : t -> Ocgio_raw.Icon.t -> unit
  = "ml_gtk_shortcuts_shortcut_set_icon"
(** An icon to represent the shortcut or gesture.

    This property is used if [Gtk.ShortcutsShortcut:shortcut-type] is set to
    [GTK_SHORTCUT_GESTURE].

    For the other predefined gesture types, GTK provides an icon on its own. *)

external get_icon_set : t -> bool = "ml_gtk_shortcuts_shortcut_get_icon_set"
(** [TRUE] if an icon has been set. *)

external set_icon_set : t -> bool -> unit
  = "ml_gtk_shortcuts_shortcut_set_icon_set"
(** [TRUE] if an icon has been set. *)

external get_shortcut_type : t -> Ocgtk_enums.shortcuttype
  = "ml_gtk_shortcuts_shortcut_get_shortcut_type"
(** The type of shortcut that is represented. *)

external set_shortcut_type : t -> Ocgtk_enums.shortcuttype -> unit
  = "ml_gtk_shortcuts_shortcut_set_shortcut_type"
(** The type of shortcut that is represented. *)

external get_subtitle : t -> string = "ml_gtk_shortcuts_shortcut_get_subtitle"
(** The subtitle for the shortcut or gesture.

    This is typically used for gestures and should be a short, one-line text
    that describes the gesture itself. For the predefined gesture types, GTK
    provides a subtitle on its own. *)

external set_subtitle : t -> string -> unit
  = "ml_gtk_shortcuts_shortcut_set_subtitle"
(** The subtitle for the shortcut or gesture.

    This is typically used for gestures and should be a short, one-line text
    that describes the gesture itself. For the predefined gesture types, GTK
    provides a subtitle on its own. *)

external get_subtitle_set : t -> bool
  = "ml_gtk_shortcuts_shortcut_get_subtitle_set"
(** [TRUE] if a subtitle has been set. *)

external set_subtitle_set : t -> bool -> unit
  = "ml_gtk_shortcuts_shortcut_set_subtitle_set"
(** [TRUE] if a subtitle has been set. *)

external get_title : t -> string = "ml_gtk_shortcuts_shortcut_get_title"
(** The textual description for the shortcut or gesture represented by this
    object.

    This should be a short string that can fit in a single line. *)

external set_title : t -> string -> unit = "ml_gtk_shortcuts_shortcut_set_title"
(** The textual description for the shortcut or gesture represented by this
    object.

    This should be a short string that can fit in a single line. *)

external set_title_size_group : t -> Size_group.t -> unit
  = "ml_gtk_shortcuts_shortcut_set_title_size_group"
(** The size group for the textual portion of this shortcut.

    This is used internally by GTK, and must not be modified by applications. *)
