class type popover_menu_t = object
  inherit Popover.popover_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    bool

  method get_flags : unit -> Enums.popovermenuflags
  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option

  method remove_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method set_flags : Enums.popovermenuflags -> unit
  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  method visible_submenu : string
  method set_visible_submenu : string -> unit
  method as_popover_menu : Raw.Popover_menu.t
end

(* High-level class for PopoverMenu *)
class popover_menu (obj : Raw.Popover_menu.t) : popover_menu_t =
  object (self)
    inherit Popover.popover (obj :> Raw.Popover.t)

    method add_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string ->
        bool =
      fun child id ->
        let child = child#as_widget in
        Raw.Popover_menu.add_child obj child id

    method get_flags : unit -> Enums.popovermenuflags =
      fun () -> Raw.Popover_menu.get_flags obj

    method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Popover_menu.get_menu_model obj)

    method remove_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun child ->
        let child = child#as_widget in
        Raw.Popover_menu.remove_child obj child

    method set_flags : Enums.popovermenuflags -> unit =
      fun flags -> Raw.Popover_menu.set_flags obj flags

    method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_menu_model) model in
        Raw.Popover_menu.set_menu_model obj model

    method visible_submenu = Raw.Popover_menu.get_visible_submenu obj
    method set_visible_submenu v = Raw.Popover_menu.set_visible_submenu obj v
    method as_popover_menu = obj
  end

let new_from_model (model : Ocgio.Menu_model.menu_model_t option) :
    popover_menu_t =
  let model = Option.map (fun c -> c#as_menu_model) model in
  let obj_ = Raw.Popover_menu.new_from_model model in
  new popover_menu obj_

let new_from_model_full (model : Ocgio.Menu_model.menu_model_t)
    (flags : Enums.popovermenuflags) : popover_menu_t =
  let model = model#as_menu_model in
  let obj_ = Raw.Popover_menu.new_from_model_full model flags in
  new popover_menu obj_
