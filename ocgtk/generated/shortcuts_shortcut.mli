(** A [GtkShortcutsShortcut] represents a single keyboard shortcut or gesture
    with a short text.

    Its methods, signals and properties are on
    {!class-type-shortcuts_shortcut_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Shortcuts_shortcut}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ShortcutsShortcut].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    A [GtkShortcutsShortcut] represents a single keyboard shortcut or gesture
    with a short text.

    This widget is only meant to be used with [GtkShortcutsWindow]. *)
class type shortcuts_shortcut_t = object
  inherit Widget.widget_t

  (** {2:properties Properties} *)

  method set_accel_size_group : Size_group.size_group_t -> unit
  (** The size group for the accelerator portion of this shortcut.

      This is used internally by GTK, and must not be modified by applications.
  *)

  method accelerator : string
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
     Note that [<], [>] and [&] need to be escaped as [&lt;], [&gt]; and \
     [&amp]; when used\n\
     in .ui files."]

  method set_accelerator : string -> unit
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
     Note that [<], [>] and [&] need to be escaped as [&lt;], [&gt]; and \
     [&amp]; when used\n\
     in .ui files."]

  method action_name : string
  (** A detailed action name.

      If this is set for a shortcut of type [GTK_SHORTCUT_ACCELERATOR], then GTK
      will use the accelerators that are associated with the action via
      [Gtk.Application.set_accels_for_action], and setting
      [Gtk.ShortcutsShortcut:accelerator] is not necessary. *)

  method set_action_name : string -> unit
  (** A detailed action name.

      If this is set for a shortcut of type [GTK_SHORTCUT_ACCELERATOR], then GTK
      will use the accelerators that are associated with the action via
      [Gtk.Application.set_accels_for_action], and setting
      [Gtk.ShortcutsShortcut:accelerator] is not necessary. *)

  method direction : Enums.textdirection
  (** The text direction for which this shortcut is active.

      If the shortcut is used regardless of the text direction, set this
      property to [GTK_TEXT_DIR_NONE]. *)

  method icon : Ocgio.Icon.icon_t
  (** An icon to represent the shortcut or gesture.

      This property is used if [Gtk.ShortcutsShortcut:shortcut-type] is set to
      [GTK_SHORTCUT_GESTURE].

      For the other predefined gesture types, GTK provides an icon on its own.
  *)

  method set_icon : Ocgio.Icon.icon_t -> unit
  (** An icon to represent the shortcut or gesture.

      This property is used if [Gtk.ShortcutsShortcut:shortcut-type] is set to
      [GTK_SHORTCUT_GESTURE].

      For the other predefined gesture types, GTK provides an icon on its own.
  *)

  method icon_set : bool
  (** [true] if an icon has been set. *)

  method set_icon_set : bool -> unit
  (** [true] if an icon has been set. *)

  method shortcut_type : Enums.shortcuttype
  (** The type of shortcut that is represented. *)

  method set_shortcut_type : Enums.shortcuttype -> unit
  (** The type of shortcut that is represented. *)

  method subtitle : string
  (** The subtitle for the shortcut or gesture.

      This is typically used for gestures and should be a short, one-line text
      that describes the gesture itself. For the predefined gesture types, GTK
      provides a subtitle on its own. *)

  method set_subtitle : string -> unit
  (** The subtitle for the shortcut or gesture.

      This is typically used for gestures and should be a short, one-line text
      that describes the gesture itself. For the predefined gesture types, GTK
      provides a subtitle on its own. *)

  method subtitle_set : bool
  (** [true] if a subtitle has been set. *)

  method set_subtitle_set : bool -> unit
  (** [true] if a subtitle has been set. *)

  method title : string
  (** The textual description for the shortcut or gesture represented by this
      object.

      This should be a short string that can fit in a single line. *)

  method set_title : string -> unit
  (** The textual description for the shortcut or gesture represented by this
      object.

      This should be a short string that can fit in a single line. *)

  method set_title_size_group : Size_group.size_group_t -> unit
  (** The size group for the textual portion of this shortcut.

      This is used internally by GTK, and must not be modified by applications.
  *)

  (** {2:conversions Conversions} *)

  method as_shortcuts_shortcut : Raw.Shortcuts_shortcut.t
end

class shortcuts_shortcut : Raw.Shortcuts_shortcut.t -> shortcuts_shortcut_t
(** Wraps a raw handle of {!Ocgtk.Raw.Shortcuts_shortcut.t}. *)

(** {1:description Description}

    A [GtkShortcutsShortcut] represents a single keyboard shortcut or gesture
    with a short text.

    This widget is only meant to be used with [GtkShortcutsWindow]. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
