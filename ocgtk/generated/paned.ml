class type paned_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method on_accept_position :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted to accept the current position of the handle when moving it using
      key bindings.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Return</kbd> or
      <kbd>Space</kbd>. *)

  method on_cancel_position :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted to cancel moving the position of the handle using key bindings.

      The position of the handle will be reset to the value prior to moving it.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Escape</kbd>. *)

  method on_cycle_child_focus :
    ?after:bool ->
    callback:(reversed:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to cycle the focus between the children of the paned.

      This is a keybinding signal.

      The default binding is <kbd>F6</kbd>. *)

  method on_cycle_handle_focus :
    ?after:bool ->
    callback:(reversed:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to cycle whether the paned should grab focus to allow the user to
      change position of the handle by using key bindings.

      This is a keybinding signal.

      The default binding for this signal is <kbd>F8</kbd>. *)

  method on_move_handle :
    ?after:bool ->
    callback:(scroll_type:Enums.scrolltype -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to move the handle with key bindings.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>←</kbd>,
      <kbd>←</kbd>, <kbd>Ctrl</kbd>+<kbd>→</kbd>, <kbd>→</kbd>,
      <kbd>Ctrl</kbd>+<kbd>↑</kbd>, <kbd>↑</kbd>, <kbd>Ctrl</kbd>+<kbd>↓</kbd>,
      <kbd>↓</kbd>, <kbd>PgUp</kbd>, <kbd>PgDn</kbd>, <kbd>Home</kbd>,
      <kbd>End</kbd>. *)

  method on_toggle_handle_focus :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted to accept the current position of the handle and then move focus
      to the next widget in the focus chain.

      This is a keybinding signal.

      The default binding is <kbd>Tab</kbd>. *)

  method get_end_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Retrieves the end child of the given [GtkPaned]. *)

  method get_position : unit -> int
  (** Obtains the position of the divider between the two panes. *)

  method get_resize_end_child : unit -> bool
  (** Returns whether the [Gtk.Paned:end-child] can be resized. *)

  method get_resize_start_child : unit -> bool
  (** Returns whether the [Gtk.Paned:start-child] can be resized. *)

  method get_shrink_end_child : unit -> bool
  (** Returns whether the [Gtk.Paned:end-child] can shrink. *)

  method get_shrink_start_child : unit -> bool
  (** Returns whether the [Gtk.Paned:start-child] can shrink. *)

  method get_start_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Retrieves the start child of the given [GtkPaned]. *)

  method get_wide_handle : unit -> bool
  (** Gets whether the separator should be wide. *)

  method set_end_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the end child of [paned] to [child].

      If [child] is [NULL], the existing child will be removed. *)

  method set_position : int -> unit
  (** Sets the position of the divider between the two panes. *)

  method set_resize_end_child : bool -> unit
  (** Sets whether the [Gtk.Paned:end-child] can be resized. *)

  method set_resize_start_child : bool -> unit
  (** Sets whether the [Gtk.Paned:start-child] can be resized. *)

  method set_shrink_end_child : bool -> unit
  (** Sets whether the [Gtk.Paned:end-child] can shrink. *)

  method set_shrink_start_child : bool -> unit
  (** Sets whether the [Gtk.Paned:start-child] can shrink. *)

  method set_start_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the start child of [paned] to [child].

      If [child] is [NULL], the existing child will be removed. *)

  method set_wide_handle : bool -> unit
  (** Sets whether the separator should be wide. *)

  method max_position : int
  method min_position : int
  method position_set : bool
  method set_position_set : bool -> unit
  method as_paned : Raw.Paned.t
end

(* High-level class for Paned *)
class paned (obj : Raw.Paned.t) : paned_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method on_accept_position ?(after = false) ~callback () =
      Raw.Paned.on_accept_position ~after self#as_paned ~callback

    method on_cancel_position ?(after = false) ~callback () =
      Raw.Paned.on_cancel_position ~after self#as_paned ~callback

    method on_cycle_child_focus ?(after = false) ~callback () =
      Raw.Paned.on_cycle_child_focus ~after self#as_paned ~callback

    method on_cycle_handle_focus ?(after = false) ~callback () =
      Raw.Paned.on_cycle_handle_focus ~after self#as_paned ~callback

    method on_move_handle ?(after = false) ~callback () =
      Raw.Paned.on_move_handle ~after self#as_paned ~callback

    method on_toggle_handle_focus ?(after = false) ~callback () =
      Raw.Paned.on_toggle_handle_focus ~after self#as_paned ~callback

    method get_end_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Paned.get_end_child obj)

    method get_position : unit -> int = fun () -> Raw.Paned.get_position obj

    method get_resize_end_child : unit -> bool =
      fun () -> Raw.Paned.get_resize_end_child obj

    method get_resize_start_child : unit -> bool =
      fun () -> Raw.Paned.get_resize_start_child obj

    method get_shrink_end_child : unit -> bool =
      fun () -> Raw.Paned.get_shrink_end_child obj

    method get_shrink_start_child : unit -> bool =
      fun () -> Raw.Paned.get_shrink_start_child obj

    method get_start_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Paned.get_start_child obj)

    method get_wide_handle : unit -> bool =
      fun () -> Raw.Paned.get_wide_handle obj

    method set_end_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Paned.set_end_child obj child

    method set_position : int -> unit =
      fun position -> Raw.Paned.set_position obj position

    method set_resize_end_child : bool -> unit =
      fun resize -> Raw.Paned.set_resize_end_child obj resize

    method set_resize_start_child : bool -> unit =
      fun resize -> Raw.Paned.set_resize_start_child obj resize

    method set_shrink_end_child : bool -> unit =
      fun resize -> Raw.Paned.set_shrink_end_child obj resize

    method set_shrink_start_child : bool -> unit =
      fun resize -> Raw.Paned.set_shrink_start_child obj resize

    method set_start_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Paned.set_start_child obj child

    method set_wide_handle : bool -> unit =
      fun wide -> Raw.Paned.set_wide_handle obj wide

    method max_position = Raw.Paned.get_max_position obj
    method min_position = Raw.Paned.get_min_position obj
    method position_set = Raw.Paned.get_position_set obj
    method set_position_set v = Raw.Paned.set_position_set obj v
    method as_paned = obj
  end

let new_ (orientation : Enums.orientation) : paned_t =
  let obj_ = Raw.Paned.new_ orientation in
  new paned obj_
