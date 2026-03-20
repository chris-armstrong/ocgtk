(* Signal class defined in gnotebook_signals.ml *)

class type notebook_t = object
    inherit Gnotebook_signals.notebook_signals
    method append_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int
    method append_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int
    method detach_tab : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method get_action_widget : Gtk_enums.packtype -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_current_page : unit -> int
    method get_group_name : unit -> string option
    method get_menu_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_menu_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option
    method get_n_pages : unit -> int
    method get_nth_page : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GNotebook_page.notebook_page_t
    method get_pages : unit -> Ocgtk_gio.Gio.list_model_t
    method get_scrollable : unit -> bool
    method get_show_border : unit -> bool
    method get_show_tabs : unit -> bool
    method get_tab_detachable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method get_tab_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_tab_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option
    method get_tab_pos : unit -> Gtk_enums.positiontype
    method get_tab_reorderable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method insert_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int -> int
    method insert_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int -> int
    method next_page : unit -> unit
    method page_num : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int
    method popup_disable : unit -> unit
    method popup_enable : unit -> unit
    method prepend_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int
    method prepend_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int
    method prev_page : unit -> unit
    method remove_page : int -> unit
    method reorder_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit
    method set_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Gtk_enums.packtype -> unit
    method set_current_page : int -> unit
    method set_group_name : string option -> unit
    method set_menu_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_menu_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> unit
    method set_scrollable : bool -> unit
    method set_show_border : bool -> unit
    method set_show_tabs : bool -> unit
    method set_tab_detachable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit
    method set_tab_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_tab_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> unit
    method set_tab_pos : Gtk_enums.positiontype -> unit
    method set_tab_reorderable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit
    method enable_popup : bool
    method set_enable_popup : bool -> unit
    method as_notebook : Notebook.t
end

(* High-level class for Notebook *)
class notebook (obj : Notebook.t) : notebook_t = object (self)
  inherit Gnotebook_signals.notebook_signals obj

  method append_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int =
    fun child tab_label ->
      let child = child#as_widget in
      let tab_label = Option.map (fun (c) -> c#as_widget) tab_label in
      (Notebook.append_page obj child tab_label)

  method append_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int =
    fun child tab_label menu_label ->
      let child = child#as_widget in
      let tab_label = Option.map (fun (c) -> c#as_widget) tab_label in
      let menu_label = Option.map (fun (c) -> c#as_widget) menu_label in
      (Notebook.append_page_menu obj child tab_label menu_label)

  method detach_tab : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Notebook.detach_tab obj child)

  method get_action_widget : Gtk_enums.packtype -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun pack_type ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Notebook.get_action_widget obj pack_type)

  method get_current_page : unit -> int =
    fun () ->
      (Notebook.get_current_page obj)

  method get_group_name : unit -> string option =
    fun () ->
      (Notebook.get_group_name obj)

  method get_menu_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun child ->
      let child = child#as_widget in
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Notebook.get_menu_label obj child)

  method get_menu_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option =
    fun child ->
      let child = child#as_widget in
      (Notebook.get_menu_label_text obj child)

  method get_n_pages : unit -> int =
    fun () ->
      (Notebook.get_n_pages obj)

  method get_nth_page : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun page_num ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Notebook.get_nth_page obj page_num)

  method get_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GNotebook_page.notebook_page_t =
    fun child ->
      let child = child#as_widget in
      new  GNotebook_page.notebook_page(Notebook.get_page obj child)

  method get_pages : unit -> Ocgtk_gio.Gio.list_model_t =
    fun () ->
      new  Ocgtk_gio.Gio.list_model(Notebook.get_pages obj)

  method get_scrollable : unit -> bool =
    fun () ->
      (Notebook.get_scrollable obj)

  method get_show_border : unit -> bool =
    fun () ->
      (Notebook.get_show_border obj)

  method get_show_tabs : unit -> bool =
    fun () ->
      (Notebook.get_show_tabs obj)

  method get_tab_detachable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool =
    fun child ->
      let child = child#as_widget in
      (Notebook.get_tab_detachable obj child)

  method get_tab_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun child ->
      let child = child#as_widget in
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Notebook.get_tab_label obj child)

  method get_tab_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option =
    fun child ->
      let child = child#as_widget in
      (Notebook.get_tab_label_text obj child)

  method get_tab_pos : unit -> Gtk_enums.positiontype =
    fun () ->
      (Notebook.get_tab_pos obj)

  method get_tab_reorderable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool =
    fun child ->
      let child = child#as_widget in
      (Notebook.get_tab_reorderable obj child)

  method insert_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int -> int =
    fun child tab_label position ->
      let child = child#as_widget in
      let tab_label = Option.map (fun (c) -> c#as_widget) tab_label in
      (Notebook.insert_page obj child tab_label position)

  method insert_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int -> int =
    fun child tab_label menu_label position ->
      let child = child#as_widget in
      let tab_label = Option.map (fun (c) -> c#as_widget) tab_label in
      let menu_label = Option.map (fun (c) -> c#as_widget) menu_label in
      (Notebook.insert_page_menu obj child tab_label menu_label position)

  method next_page : unit -> unit =
    fun () ->
      (Notebook.next_page obj)

  method page_num : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int =
    fun child ->
      let child = child#as_widget in
      (Notebook.page_num obj child)

  method popup_disable : unit -> unit =
    fun () ->
      (Notebook.popup_disable obj)

  method popup_enable : unit -> unit =
    fun () ->
      (Notebook.popup_enable obj)

  method prepend_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int =
    fun child tab_label ->
      let child = child#as_widget in
      let tab_label = Option.map (fun (c) -> c#as_widget) tab_label in
      (Notebook.prepend_page obj child tab_label)

  method prepend_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int =
    fun child tab_label menu_label ->
      let child = child#as_widget in
      let tab_label = Option.map (fun (c) -> c#as_widget) tab_label in
      let menu_label = Option.map (fun (c) -> c#as_widget) menu_label in
      (Notebook.prepend_page_menu obj child tab_label menu_label)

  method prev_page : unit -> unit =
    fun () ->
      (Notebook.prev_page obj)

  method remove_page : int -> unit =
    fun page_num ->
      (Notebook.remove_page obj page_num)

  method reorder_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit =
    fun child position ->
      let child = child#as_widget in
      (Notebook.reorder_child obj child position)

  method set_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Gtk_enums.packtype -> unit =
    fun widget pack_type ->
      let widget = widget#as_widget in
      (Notebook.set_action_widget obj widget pack_type)

  method set_current_page : int -> unit =
    fun page_num ->
      (Notebook.set_current_page obj page_num)

  method set_group_name : string option -> unit =
    fun group_name ->
      (Notebook.set_group_name obj group_name)

  method set_menu_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child menu_label ->
      let child = child#as_widget in
      let menu_label = Option.map (fun (c) -> c#as_widget) menu_label in
      (Notebook.set_menu_label obj child menu_label)

  method set_menu_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> unit =
    fun child menu_text ->
      let child = child#as_widget in
      (Notebook.set_menu_label_text obj child menu_text)

  method set_scrollable : bool -> unit =
    fun scrollable ->
      (Notebook.set_scrollable obj scrollable)

  method set_show_border : bool -> unit =
    fun show_border ->
      (Notebook.set_show_border obj show_border)

  method set_show_tabs : bool -> unit =
    fun show_tabs ->
      (Notebook.set_show_tabs obj show_tabs)

  method set_tab_detachable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit =
    fun child detachable ->
      let child = child#as_widget in
      (Notebook.set_tab_detachable obj child detachable)

  method set_tab_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child tab_label ->
      let child = child#as_widget in
      let tab_label = Option.map (fun (c) -> c#as_widget) tab_label in
      (Notebook.set_tab_label obj child tab_label)

  method set_tab_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> unit =
    fun child tab_text ->
      let child = child#as_widget in
      (Notebook.set_tab_label_text obj child tab_text)

  method set_tab_pos : Gtk_enums.positiontype -> unit =
    fun pos ->
      (Notebook.set_tab_pos obj pos)

  method set_tab_reorderable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit =
    fun child reorderable ->
      let child = child#as_widget in
      (Notebook.set_tab_reorderable obj child reorderable)

  method enable_popup = Notebook.get_enable_popup obj
  method set_enable_popup v =  Notebook.set_enable_popup obj v

    method as_notebook = obj
end

