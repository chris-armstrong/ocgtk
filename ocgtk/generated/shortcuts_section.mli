(** A [GtkShortcutsSection] collects all the keyboard shortcuts and gestures for
    a major application mode.

    Its methods, signals and properties are on
    {!class-type-shortcuts_section_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Shortcuts_section}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ShortcutsSection].}

    Inherits from: {{!Ocgtk.Box.class-type-box_t}Ocgtk.Box}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    A [GtkShortcutsSection] collects all the keyboard shortcuts and gestures for
    a major application mode.

    If your application needs multiple sections, you should give each section a
    unique [Gtk.ShortcutsSection:section-name] and a
    [Gtk.ShortcutsSection:title] that can be shown in the section selector of
    the
    {{!Ocgtk.Shortcuts_window.class-type-shortcuts_window_t}[Gtk.ShortcutsWindow]}.

    The [Gtk.ShortcutsSection:max-height] property can be used to influence how
    the groups in the section are distributed over pages and columns.

    This widget is only meant to be used with
    {{!Ocgtk.Shortcuts_window.class-type-shortcuts_window_t}[Gtk.ShortcutsWindow]}.

    The recommended way to construct a [GtkShortcutsSection] is with
    {{!Ocgtk.Builder.class-type-builder_t}[Gtk.Builder]}, by using the [<child>]
    tag to populate a [GtkShortcutsSection] with one or more
    {{!Ocgtk.Shortcuts_group.class-type-shortcuts_group_t}[Gtk.ShortcutsGroup]}
    instances, which in turn contain one or more
    {{!Ocgtk.Shortcuts_shortcut.class-type-shortcuts_shortcut_t}[Gtk.ShortcutsShortcut]}
    objects.

    If you need to add a group programmatically, use
    [Gtk.ShortcutsSection.add_group].

    {b Shortcuts and Gestures}

    Pan gestures allow to navigate between sections.

    The following signals have default keybindings:

    - [Gtk.ShortcutsSection::change-current-page] *)
class type shortcuts_section_t = object
  inherit Box.box_t

  (** {2:signals Signals} *)

  method on_change_current_page :
    ?after:bool ->
    callback:(offset:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when we change the current page.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>PgUp</kbd>,
      <kbd>PgUp</kbd>, <kbd>Ctrl</kbd>+<kbd>PgDn</kbd>, <kbd>PgDn</kbd>. *)

  (** {2:methods Methods} *)

  method add_group : Shortcuts_group.shortcuts_group_t -> unit
  (** Adds a group to the shortcuts section.

      This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
      tag to add the child.

      Adding children with the [GtkBox] API is not appropriate, as
      [GtkShortcutsSection] manages its children internally. *)

  (** {2:properties Properties} *)

  method max_height : int
  (** The maximum number of lines to allow per column.

      This property can be used to influence how the groups in this section are
      distributed across pages and columns. The default value of 15 should work
      in most cases. *)

  method set_max_height : int -> unit
  (** The maximum number of lines to allow per column.

      This property can be used to influence how the groups in this section are
      distributed across pages and columns. The default value of 15 should work
      in most cases. *)

  method section_name : string
  (** A unique name to identify this section among the sections added to the
      [GtkShortcutsWindow].

      Setting the [Gtk.ShortcutsWindow:section-name] property to this string
      will make this section shown in the [GtkShortcutsWindow]. *)

  method set_section_name : string -> unit
  (** A unique name to identify this section among the sections added to the
      [GtkShortcutsWindow].

      Setting the [Gtk.ShortcutsWindow:section-name] property to this string
      will make this section shown in the [GtkShortcutsWindow]. *)

  method title : string
  (** The string to show in the section selector of the [GtkShortcutsWindow] for
      this section.

      If there is only one section, you don't need to set a title, since the
      section selector will not be shown in this case. *)

  method set_title : string -> unit
  (** The string to show in the section selector of the [GtkShortcutsWindow] for
      this section.

      If there is only one section, you don't need to set a title, since the
      section selector will not be shown in this case. *)

  method view_name : string
  (** A view name to filter the groups in this section by.

      See [Gtk.ShortcutsGroup:view].

      Applications are expected to use the [Gtk.ShortcutsWindow:view-name]
      property for this purpose. *)

  method set_view_name : string -> unit
  (** A view name to filter the groups in this section by.

      See [Gtk.ShortcutsGroup:view].

      Applications are expected to use the [Gtk.ShortcutsWindow:view-name]
      property for this purpose. *)

  (** {2:conversions Conversions} *)

  method as_shortcuts_section : Raw.Shortcuts_section.t
end

class shortcuts_section : Raw.Shortcuts_section.t -> shortcuts_section_t
(** Wraps a raw handle of {!Ocgtk.Raw.Shortcuts_section.t}. *)

(** {1:description Description}

    A [GtkShortcutsSection] collects all the keyboard shortcuts and gestures for
    a major application mode.

    If your application needs multiple sections, you should give each section a
    unique [Gtk.ShortcutsSection:section-name] and a
    [Gtk.ShortcutsSection:title] that can be shown in the section selector of
    the
    {{!Ocgtk.Shortcuts_window.class-type-shortcuts_window_t}[Gtk.ShortcutsWindow]}.

    The [Gtk.ShortcutsSection:max-height] property can be used to influence how
    the groups in the section are distributed over pages and columns.

    This widget is only meant to be used with
    {{!Ocgtk.Shortcuts_window.class-type-shortcuts_window_t}[Gtk.ShortcutsWindow]}.

    The recommended way to construct a [GtkShortcutsSection] is with
    {{!Ocgtk.Builder.class-type-builder_t}[Gtk.Builder]}, by using the [<child>]
    tag to populate a [GtkShortcutsSection] with one or more
    {{!Ocgtk.Shortcuts_group.class-type-shortcuts_group_t}[Gtk.ShortcutsGroup]}
    instances, which in turn contain one or more
    {{!Ocgtk.Shortcuts_shortcut.class-type-shortcuts_shortcut_t}[Gtk.ShortcutsShortcut]}
    objects.

    If you need to add a group programmatically, use
    [Gtk.ShortcutsSection.add_group].

    {b Shortcuts and Gestures}

    Pan gestures allow to navigate between sections.

    The following signals have default keybindings:

    - [Gtk.ShortcutsSection::change-current-page] *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
