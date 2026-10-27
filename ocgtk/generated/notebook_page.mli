(** An auxiliary object used by [GtkNotebook].

    Its methods, signals and properties are on {!class-type-notebook_page_t}.
    The functions it is built on are in {!Ocgtk.Raw.Notebook_page}. *)

(** The methods, signals and properties of a [GtkNotebookPage]. *)
class type notebook_page_t = object
  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

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

class notebook_page : Raw.Notebook_page.t -> notebook_page_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Notebook_page.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkNotebookPage], give one already wrapped. *)
