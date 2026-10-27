(** A [GtkShortcutsShortcut] represents a single keyboard shortcut or gesture
    with a short text.

    This widget is only meant to be used with [GtkShortcutsWindow].

    Its methods, signals and properties are on
    {!class-type-shortcuts_shortcut_t}. The functions it is built on are in
    {!Ocgtk.Raw.Shortcuts_shortcut}. *)

(** The methods, signals and properties of a [GtkShortcutsShortcut]. *)
class type shortcuts_shortcut_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method set_accel_size_group : Size_group.size_group_t -> unit
  method accelerator : string
  method set_accelerator : string -> unit
  method action_name : string
  method set_action_name : string -> unit
  method direction : Enums.textdirection
  method icon : Ocgio.Icon.icon_t
  method set_icon : Ocgio.Icon.icon_t -> unit
  method icon_set : bool
  method set_icon_set : bool -> unit
  method shortcut_type : Enums.shortcuttype
  method set_shortcut_type : Enums.shortcuttype -> unit
  method subtitle : string
  method set_subtitle : string -> unit
  method subtitle_set : bool
  method set_subtitle_set : bool -> unit
  method title : string
  method set_title : string -> unit
  method set_title_size_group : Size_group.size_group_t -> unit
  method as_shortcuts_shortcut : Raw.Shortcuts_shortcut.t
end

class shortcuts_shortcut : Raw.Shortcuts_shortcut.t -> shortcuts_shortcut_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcuts_shortcut.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkShortcutsShortcut], give one already wrapped. *)
