class type notebook_page_t = object
  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the notebook child to which [page] belongs. *)

  method detachable : bool
  method set_detachable : bool -> unit

  method menu :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method menu_label : string
  method set_menu_label : string -> unit
  method position : int
  method set_position : int -> unit
  method reorderable : bool
  method set_reorderable : bool -> unit

  method tab :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method tab_expand : bool
  method set_tab_expand : bool -> unit
  method tab_fill : bool
  method set_tab_fill : bool -> unit
  method tab_label : string
  method set_tab_label : string -> unit
  method as_notebook_page : Raw.Notebook_page.t
end

(* High-level class for NotebookPage *)
class notebook_page (obj : Raw.Notebook_page.t) : notebook_page_t =
  object (self)
    method get_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Notebook_page.get_child obj)

    method detachable = Raw.Notebook_page.get_detachable obj
    method set_detachable v = Raw.Notebook_page.set_detachable obj v

    method menu =
      new
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget
        (Raw.Notebook_page.get_menu obj)

    method menu_label = Raw.Notebook_page.get_menu_label obj
    method set_menu_label v = Raw.Notebook_page.set_menu_label obj v
    method position = Raw.Notebook_page.get_position obj
    method set_position v = Raw.Notebook_page.set_position obj v
    method reorderable = Raw.Notebook_page.get_reorderable obj
    method set_reorderable v = Raw.Notebook_page.set_reorderable obj v

    method tab =
      new
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget
        (Raw.Notebook_page.get_tab obj)

    method tab_expand = Raw.Notebook_page.get_tab_expand obj
    method set_tab_expand v = Raw.Notebook_page.set_tab_expand obj v
    method tab_fill = Raw.Notebook_page.get_tab_fill obj
    method set_tab_fill v = Raw.Notebook_page.set_tab_fill obj v
    method tab_label = Raw.Notebook_page.get_tab_label obj
    method set_tab_label v = Raw.Notebook_page.set_tab_label obj v
    method as_notebook_page = obj
  end
