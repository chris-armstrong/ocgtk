class type header_bar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_decoration_layout : unit -> string option
    method get_show_title_buttons : unit -> bool
    method get_title_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method pack_end : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method pack_start : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_decoration_layout : string option -> unit
    method set_show_title_buttons : bool -> unit
    method set_title_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_header_bar : Header_bar.t
end

(* High-level class for HeaderBar *)
class header_bar (obj : Header_bar.t) : header_bar_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_decoration_layout : unit -> string option =
    fun () ->
      (Header_bar.get_decoration_layout obj)

  method get_show_title_buttons : unit -> bool =
    fun () ->
      (Header_bar.get_show_title_buttons obj)

  method get_title_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Header_bar.get_title_widget obj)

  method pack_end : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Header_bar.pack_end obj child)

  method pack_start : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Header_bar.pack_start obj child)

  method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Header_bar.remove obj child)

  method set_decoration_layout : string option -> unit =
    fun layout ->
      (Header_bar.set_decoration_layout obj layout)

  method set_show_title_buttons : bool -> unit =
    fun setting ->
      (Header_bar.set_show_title_buttons obj setting)

  method set_title_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun title_widget ->
      let title_widget = Option.map (fun (c) -> c#as_widget) title_widget in
      (Header_bar.set_title_widget obj title_widget)

    method as_header_bar = obj
end

let new_ () : header_bar_t =
  new header_bar (Header_bar.new_ ())

