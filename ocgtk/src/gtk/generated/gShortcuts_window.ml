class type shortcuts_window_t = object
  inherit GApplication_and__window_and__window_group.window_t
  method on_close : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_search : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method add_section : GShortcuts_section.shortcuts_section_t -> unit
  method section_name : string
  method set_section_name : string -> unit
  method view_name : string
  method set_view_name : string -> unit
  method as_shortcuts_window : Shortcuts_window.t
end

(* High-level class for ShortcutsWindow *)
class shortcuts_window (obj : Shortcuts_window.t) : shortcuts_window_t =
  object (self)
    inherit
      GApplication_and__window_and__window_group.window
        (obj :> Application_and__window_and__window_group.Window.t)

    method on_close ~callback =
      Shortcuts_window.on_close self#as_shortcuts_window ~callback

    method on_search ~callback =
      Shortcuts_window.on_search self#as_shortcuts_window ~callback

    method add_section : GShortcuts_section.shortcuts_section_t -> unit =
      fun section ->
        let section = section#as_shortcuts_section in
        Shortcuts_window.add_section obj section

    method section_name = Shortcuts_window.get_section_name obj
    method set_section_name v = Shortcuts_window.set_section_name obj v
    method view_name = Shortcuts_window.get_view_name obj
    method set_view_name v = Shortcuts_window.set_view_name obj v
    method as_shortcuts_window = obj
  end
