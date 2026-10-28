(** An auxiliary object used by [GtkNotebook].

    Its methods, signals and properties are on {!class-type-notebook_page_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Notebook_page}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NotebookPage].}

    Inherits from: [GObject.Object]

    An auxiliary object used by [GtkNotebook]. *)
class type notebook_page_t = object
  (** {2:methods Methods} *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the notebook child to which [page] belongs. *)

  (** {2:properties Properties} *)

  method detachable : bool
  (** Whether the tab is detachable. *)

  method set_detachable : bool -> unit
  (** Whether the tab is detachable. *)

  method menu :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** The label widget displayed in the child's menu entry. *)

  method menu_label : string
  (** The text of the menu widget. *)

  method set_menu_label : string -> unit
  (** The text of the menu widget. *)

  method position : int
  (** The index of the child in the parent. *)

  method set_position : int -> unit
  (** The index of the child in the parent. *)

  method reorderable : bool
  (** Whether the tab is reorderable by user action. *)

  method set_reorderable : bool -> unit
  (** Whether the tab is reorderable by user action. *)

  method tab :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** The tab widget for this page. *)

  method tab_expand : bool
  (** Whether to expand the child's tab. *)

  method set_tab_expand : bool -> unit
  (** Whether to expand the child's tab. *)

  method tab_fill : bool
  (** Whether the child's tab should fill the allocated area. *)

  method set_tab_fill : bool -> unit
  (** Whether the child's tab should fill the allocated area. *)

  method tab_label : string
  (** The text of the tab widget. *)

  method set_tab_label : string -> unit
  (** The text of the tab widget. *)

  (** {2:conversions Conversions} *)

  method as_notebook_page : Raw.Notebook_page.t
end

class notebook_page : Raw.Notebook_page.t -> notebook_page_t
(** Wraps a raw handle of {!Ocgtk.Raw.Notebook_page.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
