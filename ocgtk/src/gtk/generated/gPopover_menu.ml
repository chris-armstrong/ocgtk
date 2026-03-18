(* High-level class for PopoverMenu *)
class popover_menu (obj : Popover_menu.t) = object (self)

  method add_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> string -> bool =
    fun child id ->
      let child = child#as_widget in
      (Popover_menu.add_child obj child id)

  method get_flags : unit -> Gtk_enums.popovermenuflags =
    fun () ->
      (Popover_menu.get_flags obj)

  method get_menu_model : unit -> Ocgtk_gio.Gio.menu_model option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.menu_model ret) (Popover_menu.get_menu_model obj)

  method remove_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool =
    fun child ->
      let child = child#as_widget in
      (Popover_menu.remove_child obj child)

  method set_flags : Gtk_enums.popovermenuflags -> unit =
    fun flags ->
      (Popover_menu.set_flags obj flags)

  method set_menu_model : 'p1. (#Ocgtk_gio.Gio.menu_model as 'p1) option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Popover_menu.set_menu_model obj model)

  method visible_submenu = Popover_menu.get_visible_submenu obj
  method set_visible_submenu v =  Popover_menu.set_visible_submenu obj v

    method as_popover_menu = obj
end

