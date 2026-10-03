(* GENERATED CODE - DO NOT EDIT *)
(* ActionBar: ActionBar *)

type t = [ `action_bar | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Presents contextual actions.

    An example GtkActionBar

    [GtkActionBar] is expected to be displayed below the content and expand
    horizontally to fill the area.

    It allows placing children at the start or the end. In addition, it contains
    an internal centered box which is centered with respect to the full width of
    the box, even if the children at either side take up different amounts of
    space.

    {b GtkActionBar as GtkBuildable}

    The [GtkActionBar] implementation of the [GtkBuildable] interface supports
    adding children at the start or end sides by specifying “start” or “end” as
    the “type” attribute of a [<child>] element, or setting the center widget by
    specifying “center” value.

    {b CSS nodes}

    {[
    actionbar
    ╰── revealer
        ╰── box
            ├── box.start
            │   ╰── [start children]
            ├── [center widget]
            ╰── box.end
                ╰── [end children]
    ]}

    A [GtkActionBar]'s CSS node is called [actionbar]. It contains a [revealer]
    subnode, which contains a [box] subnode, which contains two [box] subnodes
    at the start and end of the action bar, with [start] and [end] style classes
    respectively, as well as a center node that represents the center child.

    Each of the boxes contains children packed for that side. *)

external new_ : unit -> t = "ml_gtk_action_bar_new"
(** Create a new ActionBar *)

(* Methods *)

external set_revealed : t -> bool -> unit = "ml_gtk_action_bar_set_revealed"
(** Reveals or conceals the content of the action bar.

    Note: this does not show or hide the action bar in the [Gtk.Widget:visible]
    sense, so revealing has no effect if the action bar is hidden. *)

external set_center_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_action_bar_set_center_widget"
(** Sets the center widget for the action bar. *)

external remove :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_action_bar_remove"
(** Removes a child from the action bar. *)

external pack_start :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_action_bar_pack_start"
(** Adds a child to the action, packed with reference to the start of the action
    bar. *)

external pack_end :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_action_bar_pack_end"
(** Adds a child to the action bar, packed with reference to the end of the
    action bar. *)

external get_revealed : t -> bool = "ml_gtk_action_bar_get_revealed"
(** Gets whether the contents of the action bar are revealed. *)

external get_center_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_action_bar_get_center_widget"
(** Retrieves the center bar widget of the bar. *)

(* Properties *)
