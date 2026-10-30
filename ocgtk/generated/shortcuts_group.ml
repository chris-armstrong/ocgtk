class type shortcuts_group_t = object
  inherit Box.box_t

  (** {2:methods Methods} *)

  method add_shortcut : Shortcuts_shortcut.shortcuts_shortcut_t -> unit
  (** Adds a shortcut to the shortcuts group.

      This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
      tag to add the child. Adding children with other API is not appropriate as
      [GtkShortcutsGroup] manages its children internally. *)

  (** {2:properties Properties} *)

  method set_accel_size_group : Size_group.size_group_t -> unit
  (** The size group for the accelerator portion of shortcuts in this group.

      This is used internally by GTK, and must not be modified by applications.
  *)

  method height : int
  (** A rough measure for the number of lines in this group.

      This is used internally by GTK, and is not useful for applications. *)

  method title : string
  (** The title for this group of shortcuts. *)

  method set_title : string -> unit
  (** The title for this group of shortcuts. *)

  method set_title_size_group : Size_group.size_group_t -> unit
  (** The size group for the textual portion of shortcuts in this group.

      This is used internally by GTK, and must not be modified by applications.
  *)

  method view : string
  (** An optional view that the shortcuts in this group are relevant for.

      The group will be hidden if the [Gtk.ShortcutsWindow:view-name] property
      does not match the view of this group.

      Set this to [None] to make the group always visible. *)

  method set_view : string -> unit
  (** An optional view that the shortcuts in this group are relevant for.

      The group will be hidden if the [Gtk.ShortcutsWindow:view-name] property
      does not match the view of this group.

      Set this to [None] to make the group always visible. *)

  (** {2:conversions Conversions} *)

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
