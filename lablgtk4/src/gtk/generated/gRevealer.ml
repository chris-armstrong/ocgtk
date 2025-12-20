(* High-level class for Revealer *)
class revealer (obj : Revealer.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Revealer.as_widget obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Revealer.get_child obj)

  method get_child_revealed : unit -> bool =
    fun () ->
      (Revealer.get_child_revealed obj)

  method get_reveal_child : unit -> bool =
    fun () ->
      (Revealer.get_reveal_child obj)

  method get_transition_duration : unit -> int =
    fun () ->
      (Revealer.get_transition_duration obj)

  method get_transition_type : unit -> Gtk_enums.revealertransitiontype =
    fun () ->
      (Revealer.get_transition_type obj)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Revealer.set_child obj child)

  method set_reveal_child : bool -> unit =
    fun reveal_child ->
      (Revealer.set_reveal_child obj reveal_child)

  method set_transition_duration : int -> unit =
    fun duration ->
      (Revealer.set_transition_duration obj duration)

  method set_transition_type : Gtk_enums.revealertransitiontype -> unit =
    fun transition ->
      (Revealer.set_transition_type obj transition)

  method as_widget = (Revealer.as_widget obj)
    method as_revealer = obj
end

