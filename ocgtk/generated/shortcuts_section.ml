class type shortcuts_section_t = object
  inherit Box.box_t

  method on_change_current_page :
    ?after:bool ->
    callback:(offset:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when we change the current page.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>PgUp</kbd>,
      <kbd>PgUp</kbd>, <kbd>Ctrl</kbd>+<kbd>PgDn</kbd>, <kbd>PgDn</kbd>. *)

  method add_group : Shortcuts_group.shortcuts_group_t -> unit
  (** Adds a group to the shortcuts section.

      This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
      tag to add the child.

      Adding children with the [GtkBox] API is not appropriate, as
      [GtkShortcutsSection] manages its children internally. *)

  method max_height : int
  method set_max_height : int -> unit
  method section_name : string
  method set_section_name : string -> unit
  method title : string
  method set_title : string -> unit
  method view_name : string
  method set_view_name : string -> unit
  method as_shortcuts_section : Raw.Shortcuts_section.t
end

(* High-level class for ShortcutsSection *)
class shortcuts_section (obj : Raw.Shortcuts_section.t) : shortcuts_section_t =
  object (self)
    inherit Box.box (obj :> Raw.Box.t)

    method on_change_current_page ?(after = false) ~callback () =
      Raw.Shortcuts_section.on_change_current_page ~after
        self#as_shortcuts_section ~callback

    method add_group : Shortcuts_group.shortcuts_group_t -> unit =
      fun group ->
        let group = group#as_shortcuts_group in
        Raw.Shortcuts_section.add_group obj group

    method max_height = Raw.Shortcuts_section.get_max_height obj
    method set_max_height v = Raw.Shortcuts_section.set_max_height obj v
    method section_name = Raw.Shortcuts_section.get_section_name obj
    method set_section_name v = Raw.Shortcuts_section.set_section_name obj v
    method title = Raw.Shortcuts_section.get_title obj
    method set_title v = Raw.Shortcuts_section.set_title obj v
    method view_name = Raw.Shortcuts_section.get_view_name obj
    method set_view_name v = Raw.Shortcuts_section.set_view_name obj v
    method as_shortcuts_section = obj
  end
