class type shortcuts_window_t = object
  inherit Application_and__window_and__window_group.window_t

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user uses a keybinding to close the window.

      This is a keybinding signal.

      The default binding for this signal is the <kbd>Escape</kbd> key. *)

  method on_search :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user uses a keybinding to start a search.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Control</kbd>+<kbd>F</kbd>. *)

  method add_section : Shortcuts_section.shortcuts_section_t -> unit
  (** Adds a section to the shortcuts window.

      This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
      tag to add the child.

      Using [Gtk.Window.set_child] is not appropriate as the shortcuts window
      manages its children internally. *)

  method section_name : string
  method set_section_name : string -> unit
  method view_name : string
  method set_view_name : string -> unit
  method as_shortcuts_window : Raw.Shortcuts_window.t
end

(* High-level class for ShortcutsWindow *)
class shortcuts_window (obj : Raw.Shortcuts_window.t) : shortcuts_window_t =
  object (self)
    inherit
      Application_and__window_and__window_group.window (obj :> Raw.Window.t)

    method on_close ?(after = false) ~callback () =
      Raw.Shortcuts_window.on_close ~after self#as_shortcuts_window ~callback

    method on_search ?(after = false) ~callback () =
      Raw.Shortcuts_window.on_search ~after self#as_shortcuts_window ~callback

    method add_section : Shortcuts_section.shortcuts_section_t -> unit =
      fun section ->
        let section = section#as_shortcuts_section in
        Raw.Shortcuts_window.add_section obj section

    method section_name = Raw.Shortcuts_window.get_section_name obj
    method set_section_name v = Raw.Shortcuts_window.set_section_name obj v
    method view_name = Raw.Shortcuts_window.get_view_name obj
    method set_view_name v = Raw.Shortcuts_window.set_view_name obj v
    method as_shortcuts_window = obj
  end
