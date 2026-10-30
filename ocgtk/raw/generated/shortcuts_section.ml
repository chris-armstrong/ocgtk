(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutsSection: ShortcutsSection *)

(** A [GtkShortcutsSection] collects all the keyboard shortcuts and gestures for
    a major application mode.

    If your application needs multiple sections, you should give each section a
    unique
    {{!Ocgtk.Raw.Shortcuts_section.val-get_section_name}[Gtk.ShortcutsSection:section-name]}
    and a
    {{!Ocgtk.Raw.Shortcuts_section.val-get_title}[Gtk.ShortcutsSection:title]}
    that can be shown in the section selector of the
    {{!Ocgtk.Raw.Shortcuts_window}[Gtk.ShortcutsWindow]}.

    The
    {{!Ocgtk.Raw.Shortcuts_section.val-get_max_height}[Gtk.ShortcutsSection:max-height]}
    property can be used to influence how the groups in the section are
    distributed over pages and columns.

    This widget is only meant to be used with
    {{!Ocgtk.Raw.Shortcuts_window}[Gtk.ShortcutsWindow]}.

    The recommended way to construct a [GtkShortcutsSection] is with
    {{!Ocgtk.Raw.Builder}[Gtk.Builder]}, by using the [<child>] tag to populate
    a [GtkShortcutsSection] with one or more
    {{!Ocgtk.Raw.Shortcuts_group}[Gtk.ShortcutsGroup]} instances, which in turn
    contain one or more {{!Ocgtk.Raw.Shortcuts_shortcut}[Gtk.ShortcutsShortcut]}
    objects.

    If you need to add a group programmatically, use
    {{!Ocgtk.Raw.Shortcuts_section.val-add_group}[Gtk.ShortcutsSection.add_group]}.

    {b Shortcuts and Gestures}

    Pan gestures allow to navigate between sections.

    The following signals have default keybindings:

    - {{!Ocgtk.Raw.Shortcuts_section.val-on_change_current_page}[Gtk.ShortcutsSection::change-current-page]}

    The class built on this module is in {!Ocgtk.Shortcuts_section}. *)

type t =
  [ `shortcuts_section | `box | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_shortcuts_section_get_type"

(* Methods *)

external add_group : t -> Shortcuts_group.t -> unit
  = "ml_gtk_shortcuts_section_add_group"
(** Adds a group to the shortcuts section.

    This is the programmatic equivalent to using
    {{!Ocgtk.Raw.Builder}[Gtk.Builder]} and a [<child>] tag to add the child.

    Adding children with the [GtkBox] API is not appropriate, as
    [GtkShortcutsSection] manages its children internally. *)

(* Properties *)

external get_max_height : t -> int = "ml_gtk_shortcuts_section_get_max_height"
(** The maximum number of lines to allow per column.

    This property can be used to influence how the groups in this section are
    distributed across pages and columns. The default value of 15 should work in
    most cases. *)

external set_max_height : t -> int -> unit
  = "ml_gtk_shortcuts_section_set_max_height"
(** The maximum number of lines to allow per column.

    This property can be used to influence how the groups in this section are
    distributed across pages and columns. The default value of 15 should work in
    most cases. *)

external get_section_name : t -> string
  = "ml_gtk_shortcuts_section_get_section_name"
(** A unique name to identify this section among the sections added to the
    [GtkShortcutsWindow].

    Setting the
    {{!Ocgtk.Raw.Shortcuts_window.val-get_section_name}[Gtk.ShortcutsWindow:section-name]}
    property to this string will make this section shown in the
    [GtkShortcutsWindow]. *)

external set_section_name : t -> string -> unit
  = "ml_gtk_shortcuts_section_set_section_name"
(** A unique name to identify this section among the sections added to the
    [GtkShortcutsWindow].

    Setting the
    {{!Ocgtk.Raw.Shortcuts_window.val-get_section_name}[Gtk.ShortcutsWindow:section-name]}
    property to this string will make this section shown in the
    [GtkShortcutsWindow]. *)

external get_title : t -> string = "ml_gtk_shortcuts_section_get_title"
(** The string to show in the section selector of the [GtkShortcutsWindow] for
    this section.

    If there is only one section, you don't need to set a title, since the
    section selector will not be shown in this case. *)

external set_title : t -> string -> unit = "ml_gtk_shortcuts_section_set_title"
(** The string to show in the section selector of the [GtkShortcutsWindow] for
    this section.

    If there is only one section, you don't need to set a title, since the
    section selector will not be shown in this case. *)

external get_view_name : t -> string = "ml_gtk_shortcuts_section_get_view_name"
(** A view name to filter the groups in this section by.

    See {{!Ocgtk.Raw.Shortcuts_group.val-get_view}[Gtk.ShortcutsGroup:view]}.

    Applications are expected to use the
    {{!Ocgtk.Raw.Shortcuts_window.val-get_view_name}[Gtk.ShortcutsWindow:view-name]}
    property for this purpose. *)

external set_view_name : t -> string -> unit
  = "ml_gtk_shortcuts_section_set_view_name"
(** A view name to filter the groups in this section by.

    See {{!Ocgtk.Raw.Shortcuts_group.val-get_view}[Gtk.ShortcutsGroup:view]}.

    Applications are expected to use the
    {{!Ocgtk.Raw.Shortcuts_window.val-get_view_name}[Gtk.ShortcutsWindow:view-name]}
    property for this purpose. *)

let on_change_current_page ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let offset =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_int v
        in
        let result = callback ~offset in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"change-current-page" ~callback:closure
    ~after:(Option.value after ~default:false)
