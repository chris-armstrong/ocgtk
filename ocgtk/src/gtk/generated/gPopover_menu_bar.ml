class type popover_menu_bar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> bool
    method get_menu_model : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
    method remove_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method set_menu_model : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit
    method as_popover_menu_bar : Popover_menu_bar.t
end

(* High-level class for PopoverMenuBar *)
class popover_menu_bar (obj : Popover_menu_bar.t) : popover_menu_bar_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> bool =
    fun child id ->
      let child = child#as_widget in
      (Popover_menu_bar.add_child obj child id)

  method get_menu_model : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.Menu_model.menu_model ret) (Popover_menu_bar.get_menu_model obj)

  method remove_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool =
    fun child ->
      let child = child#as_widget in
      (Popover_menu_bar.remove_child obj child)

  method set_menu_model : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Popover_menu_bar.set_menu_model obj model)

    method as_popover_menu_bar = obj
end

let new_from_model (model : Ocgtk_gio.Gio.Menu_model.menu_model_t option) : popover_menu_bar_t =
  let model = Option.map (fun c -> c#as_menu_model) model in
  new popover_menu_bar (Popover_menu_bar.new_from_model model)

