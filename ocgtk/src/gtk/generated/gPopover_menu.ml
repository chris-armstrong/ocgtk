class type popover_menu_t = object
    inherit GPopover.popover_t
    method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> bool
    method get_flags : unit -> Gtk_enums.popovermenuflags
    method get_menu_model : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
    method remove_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method set_flags : Gtk_enums.popovermenuflags -> unit
    method set_menu_model : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit
    method visible_submenu : string
    method set_visible_submenu : string -> unit
    method as_popover_menu : Popover_menu.t
end

(* High-level class for PopoverMenu *)
class popover_menu (obj : Popover_menu.t) : popover_menu_t = object (self)
  inherit GPopover.popover (obj :> Popover.t)

  method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> bool =
    fun child id ->
      let child = child#as_widget in
      (Popover_menu.add_child obj child id)

  method get_flags : unit -> Gtk_enums.popovermenuflags =
    fun () ->
      (Popover_menu.get_flags obj)

  method get_menu_model : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.Menu_model.menu_model ret) (Popover_menu.get_menu_model obj)

  method remove_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool =
    fun child ->
      let child = child#as_widget in
      (Popover_menu.remove_child obj child)

  method set_flags : Gtk_enums.popovermenuflags -> unit =
    fun flags ->
      (Popover_menu.set_flags obj flags)

  method set_menu_model : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Popover_menu.set_menu_model obj model)

  method visible_submenu = Popover_menu.get_visible_submenu obj
  method set_visible_submenu v =  Popover_menu.set_visible_submenu obj v

    method as_popover_menu = obj
end

let new_from_model (model : Ocgtk_gio.Gio.Menu_model.menu_model_t option) : popover_menu_t =
  let model = Option.map (fun c -> c#as_menu_model) model in
  new popover_menu (Popover_menu.new_from_model model)

let new_from_model_full (model : Ocgtk_gio.Gio.Menu_model.menu_model_t) (flags : Gtk_enums.popovermenuflags) : popover_menu_t =
  let model = model#as_menu_model in
  new popover_menu (Popover_menu.new_from_model_full model flags)

