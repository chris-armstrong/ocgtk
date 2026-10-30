(* GENERATED CODE - DO NOT EDIT *)
(* NotebookPage: NotebookPage *)

(** An auxiliary object used by [GtkNotebook].

    The class built on this module is in {!Ocgtk.Notebook_page}. *)

type t = [ `notebook_page | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_notebook_page_get_type"

(* Methods *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t = "ml_gtk_notebook_page_get_child"
(** Returns the notebook child to which [page] belongs. *)

(* Properties *)

external get_detachable : t -> bool = "ml_gtk_notebook_page_get_detachable"
(** Whether the tab is detachable. *)

external set_detachable : t -> bool -> unit
  = "ml_gtk_notebook_page_set_detachable"
(** Whether the tab is detachable. *)

external get_menu :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t = "ml_gtk_notebook_page_get_menu"
(** The label widget displayed in the child's menu entry. *)

external get_menu_label : t -> string = "ml_gtk_notebook_page_get_menu_label"
(** The text of the menu widget. *)

external set_menu_label : t -> string -> unit
  = "ml_gtk_notebook_page_set_menu_label"
(** The text of the menu widget. *)

external get_position : t -> int = "ml_gtk_notebook_page_get_position"
(** The index of the child in the parent. *)

external set_position : t -> int -> unit = "ml_gtk_notebook_page_set_position"
(** The index of the child in the parent. *)

external get_reorderable : t -> bool = "ml_gtk_notebook_page_get_reorderable"
(** Whether the tab is reorderable by user action. *)

external set_reorderable : t -> bool -> unit
  = "ml_gtk_notebook_page_set_reorderable"
(** Whether the tab is reorderable by user action. *)

external get_tab :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t = "ml_gtk_notebook_page_get_tab"
(** The tab widget for this page. *)

external get_tab_expand : t -> bool = "ml_gtk_notebook_page_get_tab_expand"
(** Whether to expand the child's tab. *)

external set_tab_expand : t -> bool -> unit
  = "ml_gtk_notebook_page_set_tab_expand"
(** Whether to expand the child's tab. *)

external get_tab_fill : t -> bool = "ml_gtk_notebook_page_get_tab_fill"
(** Whether the child's tab should fill the allocated area. *)

external set_tab_fill : t -> bool -> unit = "ml_gtk_notebook_page_set_tab_fill"
(** Whether the child's tab should fill the allocated area. *)

external get_tab_label : t -> string = "ml_gtk_notebook_page_get_tab_label"
(** The text of the tab widget. *)

external set_tab_label : t -> string -> unit
  = "ml_gtk_notebook_page_set_tab_label"
(** The text of the tab widget. *)
