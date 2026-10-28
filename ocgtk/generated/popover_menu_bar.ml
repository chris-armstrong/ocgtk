class type popover_menu_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:methods Methods} *)

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    bool
  (** Adds a custom widget to a generated menubar.

      For this to work, the menu model of [bar] must have an item with a
      [custom] attribute that matches [id]. *)

  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option
  (** Returns the model from which the contents of [bar] are taken. *)

  method remove_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool
  (** Removes a widget that has previously been added with
      gtk_popover_menu_bar_add_child(). *)

  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model from which [bar] should take its contents. *)

  (** {2:conversions Conversions} *)

  method as_popover_menu_bar : Raw.Popover_menu_bar.t
end

(* High-level class for PopoverMenuBar *)
class popover_menu_bar (obj : Raw.Popover_menu_bar.t) : popover_menu_bar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method add_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string ->
        bool =
      fun child id ->
        let child = child#as_widget in
        Raw.Popover_menu_bar.add_child obj child id

    method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Popover_menu_bar.get_menu_model obj)

    method remove_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun child ->
        let child = child#as_widget in
        Raw.Popover_menu_bar.remove_child obj child

    method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_menu_model) model in
        Raw.Popover_menu_bar.set_menu_model obj model

    method as_popover_menu_bar = obj
  end

let new_from_model (model : Ocgio.Menu_model.menu_model_t option) :
    popover_menu_bar_t =
  let model = Option.map (fun c -> c#as_menu_model) model in
  let obj_ = Raw.Popover_menu_bar.new_from_model model in
  new popover_menu_bar obj_
