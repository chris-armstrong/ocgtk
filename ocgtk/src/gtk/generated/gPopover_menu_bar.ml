(* High-level class for PopoverMenuBar *)
class popover_menu_bar (obj : Popover_menu_bar.t) = object (self)

  method add_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> string -> bool =
    fun child id ->
      let child = child#as_widget in
      (Popover_menu_bar.add_child obj child id)

  method get_menu_model : unit -> Ocgtk_gio.Gio.menu_model option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.menu_model ret) (Popover_menu_bar.get_menu_model obj)

  method remove_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool =
    fun child ->
      let child = child#as_widget in
      (Popover_menu_bar.remove_child obj child)

  method set_menu_model : 'p1. (#Ocgtk_gio.Gio.menu_model as 'p1) option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Popover_menu_bar.set_menu_model obj model)

    method as_popover_menu_bar = obj
end

