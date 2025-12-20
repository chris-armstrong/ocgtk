(* Signal class defined in glist_view_signals.ml *)

(* High-level class for ListView *)
class list_view (obj : List_view.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (List_view.as_widget obj)
  inherit Glist_view_signals.list_view_signals obj

  method get_enable_rubberband : unit -> bool =
    fun () ->
      (List_view.get_enable_rubberband obj)

  method get_factory : unit -> GList_item_factory.list_item_factory option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (List_view.get_factory obj)

  method get_header_factory : unit -> GList_item_factory.list_item_factory option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (List_view.get_header_factory obj)

  method get_show_separators : unit -> bool =
    fun () ->
      (List_view.get_show_separators obj)

  method get_single_click_activate : unit -> bool =
    fun () ->
      (List_view.get_single_click_activate obj)

  method get_tab_behavior : unit -> Gtk_enums.listtabbehavior =
    fun () ->
      (List_view.get_tab_behavior obj)

  method set_enable_rubberband : bool -> unit =
    fun enable_rubberband ->
      (List_view.set_enable_rubberband obj enable_rubberband)

  method set_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (List_view.set_factory obj factory)

  method set_header_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (List_view.set_header_factory obj factory)

  method set_show_separators : bool -> unit =
    fun show_separators ->
      (List_view.set_show_separators obj show_separators)

  method set_single_click_activate : bool -> unit =
    fun single_click_activate ->
      (List_view.set_single_click_activate obj single_click_activate)

  method set_tab_behavior : Gtk_enums.listtabbehavior -> unit =
    fun tab_behavior ->
      (List_view.set_tab_behavior obj tab_behavior)

  method as_widget = (List_view.as_widget obj)
    method as_list_view = obj
end

