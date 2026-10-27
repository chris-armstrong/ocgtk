class type list_view_t = object
  inherit List_base.list_base_t

  method on_activate :
    ?after:bool ->
    callback:(position:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_enable_rubberband : unit -> bool
  (** Returns whether rows can be selected by dragging with the mouse. *)

  method get_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items. *)

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate section headers. *)

  method get_model : unit -> Selection_model.selection_model_t option
  (** Gets the model that's currently used to read the items displayed. *)

  method get_show_separators : unit -> bool
  (** Returns whether the listview should show separators between rows. *)

  method get_single_click_activate : unit -> bool
  (** Returns whether rows will be activated on single click and selected on
      hover. *)

  method get_tab_behavior : unit -> Enums.listtabbehavior
  (** Gets the behavior set for the <kbd>Tab</kbd> key. *)

  method scroll_to :
    int -> Enums.listscrollflags -> Raw.Scroll_info.t option -> unit
  (** Scrolls to the item at the given position and performs the actions
      specified in [flags].

      This function works no matter if the listview is shown or focused. If it
      isn't, then the changes will take effect once that happens. *)

  method set_enable_rubberband : bool -> unit
  (** Sets whether selections can be changed by dragging with the mouse. *)

  method set_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items. *)

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating the [Gtk.ListHeader]
      objects used in section headers.

      If this factory is set to [NULL], the list will not show section headers.
  *)

  method set_model : Selection_model.selection_model_t option -> unit
  (** Sets the model to use.

      This must be a [Gtk.SelectionModel] to use. *)

  method set_show_separators : bool -> unit
  (** Sets whether the listview should show separators between rows. *)

  method set_single_click_activate : bool -> unit
  (** Sets whether rows should be activated on single click and selected on
      hover. *)

  method set_tab_behavior : Enums.listtabbehavior -> unit
  (** Sets the <kbd>Tab</kbd> key behavior.

      This influences how the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd>
      keys move the focus in the listview. *)

  method as_list_view : Raw.List_view.t
end

(* High-level class for ListView *)
class list_view (obj : Raw.List_view.t) : list_view_t =
  object (self)
    inherit List_base.list_base (obj :> Raw.List_base.t)

    method on_activate ?(after = false) ~callback () =
      Raw.List_view.on_activate ~after self#as_list_view ~callback

    method get_enable_rubberband : unit -> bool =
      fun () -> Raw.List_view.get_enable_rubberband obj

    method get_factory : unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.List_view.get_factory obj)

    method get_header_factory :
        unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.List_view.get_header_factory obj)

    method get_model : unit -> Selection_model.selection_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Selection_model.selection_model ret)
          (Raw.List_view.get_model obj)

    method get_show_separators : unit -> bool =
      fun () -> Raw.List_view.get_show_separators obj

    method get_single_click_activate : unit -> bool =
      fun () -> Raw.List_view.get_single_click_activate obj

    method get_tab_behavior : unit -> Enums.listtabbehavior =
      fun () -> Raw.List_view.get_tab_behavior obj

    method scroll_to :
        int -> Enums.listscrollflags -> Raw.Scroll_info.t option -> unit =
      fun pos flags scroll -> Raw.List_view.scroll_to obj pos flags scroll

    method set_enable_rubberband : bool -> unit =
      fun enable_rubberband ->
        Raw.List_view.set_enable_rubberband obj enable_rubberband

    method set_factory : List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.List_view.set_factory obj factory

    method set_header_factory :
        List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.List_view.set_header_factory obj factory

    method set_model : Selection_model.selection_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_selection_model) model in
        Raw.List_view.set_model obj model

    method set_show_separators : bool -> unit =
      fun show_separators ->
        Raw.List_view.set_show_separators obj show_separators

    method set_single_click_activate : bool -> unit =
      fun single_click_activate ->
        Raw.List_view.set_single_click_activate obj single_click_activate

    method set_tab_behavior : Enums.listtabbehavior -> unit =
      fun tab_behavior -> Raw.List_view.set_tab_behavior obj tab_behavior

    method as_list_view = obj
  end

let new_ (model : Selection_model.selection_model_t option)
    (factory : List_item_factory.list_item_factory_t option) : list_view_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let factory = Option.map (fun c -> c#as_list_item_factory) factory in
  let obj_ = Raw.List_view.new_ model factory in
  new list_view obj_
