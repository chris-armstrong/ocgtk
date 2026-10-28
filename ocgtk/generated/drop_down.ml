class type drop_down_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the drop down is activated.

      The [::activate] signal on [GtkDropDown] is an action signal and emitting
      it causes the drop down to pop up its dropdown. *)

  method get_enable_search : unit -> bool
  (** Returns whether search is enabled. *)

  method get_expression : unit -> Expression.expression_t option
  (** Gets the expression set that is used to obtain strings from items.

      See [Gtk.DropDown.set_expression]. *)

  method get_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items.

      The factory returned by this function is always used for the item in the
      button. It is also used for items in the popup if
      [Gtk.DropDown:list-factory] is not set. *)

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to create header widgets for the
      popup. *)

  method get_list_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items in the
      popup. *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that provides the displayed items. *)

  method get_search_match_mode : unit -> Enums.stringfiltermatchmode
  (** Returns the match mode that the search filter is using. *)

  method get_selected : unit -> int
  (** Gets the position of the selected item. *)

  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  (** Gets the selected item. If no item is selected, [NULL] is returned. *)

  method get_show_arrow : unit -> bool
  (** Returns whether to show an arrow within the widget. *)

  method set_enable_search : bool -> unit
  (** Sets whether a search entry will be shown in the popup that allows to
      search for items in the list.

      Note that [Gtk.DropDown:expression] must be set for search to work. *)

  method set_expression : Expression.expression_t option -> unit
  (** Sets the expression that gets evaluated to obtain strings from items.

      This is used for search in the popup. The expression must have a value
      type of [G_TYPE_STRING]. *)

  method set_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items. *)

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for creating header widgets for the
      popup. *)

  method set_list_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items in the
      popup. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the [GListModel] to use. *)

  method set_search_match_mode : Enums.stringfiltermatchmode -> unit
  (** Sets the match mode for the search filter. *)

  method set_selected : int -> unit
  (** Selects the item at the given position. *)

  method set_show_arrow : bool -> unit
  (** Sets whether an arrow will be displayed within the widget. *)

  method as_drop_down : Raw.Drop_down.t
end

(* High-level class for DropDown *)
class drop_down (obj : Raw.Drop_down.t) : drop_down_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Drop_down.on_activate ~after self#as_drop_down ~callback

    method get_enable_search : unit -> bool =
      fun () -> Raw.Drop_down.get_enable_search obj

    method get_expression : unit -> Expression.expression_t option =
      fun () ->
        Option.map
          (fun ret -> new Expression.expression ret)
          (Raw.Drop_down.get_expression obj)

    method get_factory : unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Drop_down.get_factory obj)

    method get_header_factory :
        unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Drop_down.get_header_factory obj)

    method get_list_factory :
        unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Drop_down.get_list_factory obj)

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Drop_down.get_model obj)

    method get_search_match_mode : unit -> Enums.stringfiltermatchmode =
      fun () -> Raw.Drop_down.get_search_match_mode obj

    method get_selected : unit -> int = fun () -> Raw.Drop_down.get_selected obj

    method get_selected_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Drop_down.get_selected_item obj

    method get_show_arrow : unit -> bool =
      fun () -> Raw.Drop_down.get_show_arrow obj

    method set_enable_search : bool -> unit =
      fun enable_search -> Raw.Drop_down.set_enable_search obj enable_search

    method set_expression : Expression.expression_t option -> unit =
      fun expression ->
        let expression = Option.map (fun c -> c#as_expression) expression in
        Raw.Drop_down.set_expression obj expression

    method set_factory : List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Drop_down.set_factory obj factory

    method set_header_factory :
        List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Drop_down.set_header_factory obj factory

    method set_list_factory :
        List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Drop_down.set_list_factory obj factory

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Drop_down.set_model obj model

    method set_search_match_mode : Enums.stringfiltermatchmode -> unit =
      fun search_match_mode ->
        Raw.Drop_down.set_search_match_mode obj search_match_mode

    method set_selected : int -> unit =
      fun position -> Raw.Drop_down.set_selected obj position

    method set_show_arrow : bool -> unit =
      fun show_arrow -> Raw.Drop_down.set_show_arrow obj show_arrow

    method as_drop_down = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option)
    (expression : Expression.expression_t option) : drop_down_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let expression = Option.map (fun c -> c#as_expression) expression in
  let obj_ = Raw.Drop_down.new_ model expression in
  new drop_down obj_

let new_from_strings (strings : string array) : drop_down_t =
  let obj_ = Raw.Drop_down.new_from_strings strings in
  new drop_down obj_
