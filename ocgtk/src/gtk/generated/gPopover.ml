(* Signal class defined in gpopover_signals.ml *)

class type popover_t = object
    inherit Gpopover_signals.popover_signals
    method get_autohide : unit -> bool
    method get_cascade_popdown : unit -> bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_has_arrow : unit -> bool
    method get_mnemonics_visible : unit -> bool
    method get_position : unit -> Gtk_enums.positiontype
    method popdown : unit -> unit
    method popup : unit -> unit
    method present : unit -> unit
    method set_autohide : bool -> unit
    method set_cascade_popdown : bool -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_default_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_has_arrow : bool -> unit
    method set_mnemonics_visible : bool -> unit
    method set_offset : int -> int -> unit
    method set_pointing_to : Ocgtk_gdk.Gdk.rectangle_t option -> unit
    method set_position : Gtk_enums.positiontype -> unit
    method as_popover : Popover.t
end

(* High-level class for Popover *)
class popover (obj : Popover.t) : popover_t = object (self)
  inherit Gpopover_signals.popover_signals obj

  method get_autohide : unit -> bool =
    fun () ->
      (Popover.get_autohide obj)

  method get_cascade_popdown : unit -> bool =
    fun () ->
      (Popover.get_cascade_popdown obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Popover.get_child obj)

  method get_has_arrow : unit -> bool =
    fun () ->
      (Popover.get_has_arrow obj)

  method get_mnemonics_visible : unit -> bool =
    fun () ->
      (Popover.get_mnemonics_visible obj)

  method get_position : unit -> Gtk_enums.positiontype =
    fun () ->
      (Popover.get_position obj)

  method popdown : unit -> unit =
    fun () ->
      (Popover.popdown obj)

  method popup : unit -> unit =
    fun () ->
      (Popover.popup obj)

  method present : unit -> unit =
    fun () ->
      (Popover.present obj)

  method set_autohide : bool -> unit =
    fun autohide ->
      (Popover.set_autohide obj autohide)

  method set_cascade_popdown : bool -> unit =
    fun cascade_popdown ->
      (Popover.set_cascade_popdown obj cascade_popdown)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Popover.set_child obj child)

  method set_default_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Popover.set_default_widget obj widget)

  method set_has_arrow : bool -> unit =
    fun has_arrow ->
      (Popover.set_has_arrow obj has_arrow)

  method set_mnemonics_visible : bool -> unit =
    fun mnemonics_visible ->
      (Popover.set_mnemonics_visible obj mnemonics_visible)

  method set_offset : int -> int -> unit =
    fun x_offset y_offset ->
      (Popover.set_offset obj x_offset y_offset)

  method set_pointing_to : Ocgtk_gdk.Gdk.rectangle_t option -> unit =
    fun rect ->
      let rect = Option.map (fun (c) -> c#as_rectangle) rect in
      (Popover.set_pointing_to obj rect)

  method set_position : Gtk_enums.positiontype -> unit =
    fun position ->
      (Popover.set_position obj position)

    method as_popover = obj
end

