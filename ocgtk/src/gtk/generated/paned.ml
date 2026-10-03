(* GENERATED CODE - DO NOT EDIT *)
(* Paned: Paned *)

(** Arranges its children in two panes, horizontally or vertically.

    An example GtkPaned

    The division between the two panes is adjustable by the user by dragging a
    handle.

    Child widgets are added to the panes of the widget with
    [Gtk.Paned.set_start_child] and [Gtk.Paned.set_end_child]. The division
    between the two children is set by default from the size requests of the
    children, but it can be adjusted by the user.

    A paned widget draws a separator between the two child widgets and a small
    handle that the user can drag to adjust the division. It does not draw any
    relief around the children or around the separator. (The space in which the
    separator is called the gutter.) Often, it is useful to put each child
    inside a [Gtk.Frame] so that the gutter appears as a ridge. No separator is
    drawn if one of the children is missing.

    Each child has two options that can be set, “resize” and “shrink”. If
    “resize” is true then, when the [GtkPaned] is resized, that child will
    expand or shrink along with the paned widget. If “shrink” is true, then that
    child can be made smaller than its requisition by the user. Setting “shrink”
    to false allows the application to set a minimum size. If “resize” is false
    for both children, then this is treated as if “resize” is true for both
    children.

    The application can set the position of the slider as if it were set by the
    user, by calling [Gtk.Paned.set_position].

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.Paned::accept-position]
    - [Gtk.Paned::cancel-position]
    - [Gtk.Paned::cycle-child-focus]
    - [Gtk.Paned::cycle-handle-focus]
    - [Gtk.Paned::move-handle]
    - [Gtk.Paned::toggle-handle-focus]

    {b CSS nodes}

    {[
    paned
    ├── <child>
    ├── separator[.wide]
    ╰── <child>
    ]}

    [GtkPaned] has a main CSS node with name paned, and a subnode for the
    separator with name separator. The subnode gets a .wide style class when the
    paned is supposed to be wide.

    In horizontal orientation, the nodes are arranged based on the text
    direction, so in left-to-right mode, :first-child will select the leftmost
    child, while it will select the rightmost child in RTL layouts.

    {b Creating a paned widget with minimum sizes.}

    {[
    GtkWidget * hpaned = gtk_paned_new GTK_ORIENTATION_HORIZONTAL;
    GtkWidget * frame1 = gtk_frame_new NULL;
    GtkWidget * frame2 = gtk_frame_new NULL;

    gtk_widget_set_size_request (hpaned, 200, -1);

    gtk_paned_set_start_child (GTK_PANED hpaned, frame1);
    gtk_paned_set_resize_start_child (GTK_PANED hpaned, TRUE);
    gtk_paned_set_shrink_start_child (GTK_PANED hpaned, FALSE);
    gtk_widget_set_size_request (frame1, 50, -1);

    gtk_paned_set_end_child (GTK_PANED hpaned, frame2);
    gtk_paned_set_resize_end_child (GTK_PANED hpaned, FALSE);
    gtk_paned_set_shrink_end_child (GTK_PANED hpaned, FALSE);
    gtk_widget_set_size_request (frame2, 50, -1)
    ]} *)

type t = [ `paned | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : Gtk_enums.orientation -> t = "ml_gtk_paned_new"
(** Create a new Paned *)

(* Methods *)

external set_wide_handle : t -> bool -> unit = "ml_gtk_paned_set_wide_handle"
(** Sets whether the separator should be wide. *)

external set_start_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_paned_set_start_child"
(** Sets the start child of [paned] to [child].

    If [child] is [NULL], the existing child will be removed. *)

external set_shrink_start_child : t -> bool -> unit
  = "ml_gtk_paned_set_shrink_start_child"
(** Sets whether the [Gtk.Paned:start-child] can shrink. *)

external set_shrink_end_child : t -> bool -> unit
  = "ml_gtk_paned_set_shrink_end_child"
(** Sets whether the [Gtk.Paned:end-child] can shrink. *)

external set_resize_start_child : t -> bool -> unit
  = "ml_gtk_paned_set_resize_start_child"
(** Sets whether the [Gtk.Paned:start-child] can be resized. *)

external set_resize_end_child : t -> bool -> unit
  = "ml_gtk_paned_set_resize_end_child"
(** Sets whether the [Gtk.Paned:end-child] can be resized. *)

external set_position : t -> int -> unit = "ml_gtk_paned_set_position"
(** Sets the position of the divider between the two panes. *)

external set_end_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_paned_set_end_child"
(** Sets the end child of [paned] to [child].

    If [child] is [NULL], the existing child will be removed. *)

external get_wide_handle : t -> bool = "ml_gtk_paned_get_wide_handle"
(** Gets whether the separator should be wide. *)

external get_start_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_paned_get_start_child"
(** Retrieves the start child of the given [GtkPaned]. *)

external get_shrink_start_child : t -> bool
  = "ml_gtk_paned_get_shrink_start_child"
(** Returns whether the [Gtk.Paned:start-child] can shrink. *)

external get_shrink_end_child : t -> bool = "ml_gtk_paned_get_shrink_end_child"
(** Returns whether the [Gtk.Paned:end-child] can shrink. *)

external get_resize_start_child : t -> bool
  = "ml_gtk_paned_get_resize_start_child"
(** Returns whether the [Gtk.Paned:start-child] can be resized. *)

external get_resize_end_child : t -> bool = "ml_gtk_paned_get_resize_end_child"
(** Returns whether the [Gtk.Paned:end-child] can be resized. *)

external get_position : t -> int = "ml_gtk_paned_get_position"
(** Obtains the position of the divider between the two panes. *)

external get_end_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_paned_get_end_child"
(** Retrieves the end child of the given [GtkPaned]. *)

(* Properties *)

external get_max_position : t -> int = "ml_gtk_paned_get_max_position"
(** Get property: max-position *)

external get_min_position : t -> int = "ml_gtk_paned_get_min_position"
(** Get property: min-position *)

external get_position_set : t -> bool = "ml_gtk_paned_get_position_set"
(** Get property: position-set *)

external set_position_set : t -> bool -> unit = "ml_gtk_paned_set_position_set"
(** Set property: position-set *)

let on_accept_position ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let result = callback () in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"accept-position" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_cancel_position ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let result = callback () in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"cancel-position" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_cycle_child_focus ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let reversed =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_boolean v
        in
        let result = callback ~reversed in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"cycle-child-focus" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_cycle_handle_focus ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let reversed =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_boolean v
        in
        let result = callback ~reversed in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"cycle-handle-focus" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_move_handle ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let scroll_type =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gtk_enums.scrolltype_of_int (Gobject.Value.get_enum_int v)
        in
        let result = callback ~scroll_type in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"move-handle" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_toggle_handle_focus ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let result = callback () in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"toggle-handle-focus" ~callback:closure
    ~after:(Option.value after ~default:false)
