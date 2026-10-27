class type shortcuts_group_t = object
  inherit Box.box_t

  method add_shortcut : Shortcuts_shortcut.shortcuts_shortcut_t -> unit
  (** Adds a shortcut to the shortcuts group.

      This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
      tag to add the child. Adding children with other API is not appropriate as
      [GtkShortcutsGroup] manages its children internally. *)

  method set_accel_size_group : Size_group.size_group_t -> unit
  method height : int
  method title : string
  method set_title : string -> unit
  method set_title_size_group : Size_group.size_group_t -> unit
  method view : string
  method set_view : string -> unit
  method as_shortcuts_group : Raw.Shortcuts_group.t
end

(* High-level class for ShortcutsGroup *)
class shortcuts_group (obj : Raw.Shortcuts_group.t) : shortcuts_group_t =
  object (self)
    inherit Box.box (obj :> Raw.Box.t)

    method add_shortcut : Shortcuts_shortcut.shortcuts_shortcut_t -> unit =
      fun shortcut ->
        let shortcut = shortcut#as_shortcuts_shortcut in
        Raw.Shortcuts_group.add_shortcut obj shortcut

    method set_accel_size_group : Size_group.size_group_t -> unit =
      fun v -> Raw.Shortcuts_group.set_accel_size_group obj v#as_size_group

    method height = Raw.Shortcuts_group.get_height obj
    method title = Raw.Shortcuts_group.get_title obj
    method set_title v = Raw.Shortcuts_group.set_title obj v

    method set_title_size_group : Size_group.size_group_t -> unit =
      fun v -> Raw.Shortcuts_group.set_title_size_group obj v#as_size_group

    method view = Raw.Shortcuts_group.get_view obj
    method set_view v = Raw.Shortcuts_group.set_view obj v
    method as_shortcuts_group = obj
  end
