(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Stack *)

type t = [`stack | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Stack *)
external new_ : unit -> t = "ml_gtk_stack_new"

(* Properties *)

(** Get property: hhomogeneous *)
external get_hhomogeneous : t -> bool = "ml_gtk_stack_get_hhomogeneous"

(** Set property: hhomogeneous *)
external set_hhomogeneous : t -> bool -> unit = "ml_gtk_stack_set_hhomogeneous"

(** Get property: interpolate-size *)
external get_interpolate_size : t -> bool = "ml_gtk_stack_get_interpolate_size"

(** Set property: interpolate-size *)
external set_interpolate_size : t -> bool -> unit = "ml_gtk_stack_set_interpolate_size"

(** Get property: transition-duration *)
external get_transition_duration : t -> int = "ml_gtk_stack_get_transition_duration"

(** Set property: transition-duration *)
external set_transition_duration : t -> int -> unit = "ml_gtk_stack_set_transition_duration"

(** Get property: transition-running *)
external get_transition_running : t -> bool = "ml_gtk_stack_get_transition_running"

(** Get property: vhomogeneous *)
external get_vhomogeneous : t -> bool = "ml_gtk_stack_get_vhomogeneous"

(** Set property: vhomogeneous *)
external set_vhomogeneous : t -> bool -> unit = "ml_gtk_stack_set_vhomogeneous"

(** Get property: visible-child-name *)
external get_visible_child_name : t -> string = "ml_gtk_stack_get_visible_child_name"

(** Set property: visible-child-name *)
external set_visible_child_name : t -> string -> unit = "ml_gtk_stack_set_visible_child_name"

(** Makes the child with the given name visible.

Note that the child widget has to be visible itself
(see [method@Gtk.Widget.show]) in order to become the visible
child of @stack. *)
external set_visible_child_full : t -> string -> Gtk_enums.stacktransitiontype -> unit = "ml_gtk_stack_set_visible_child_full"

(** Makes @child the visible child of @stack.

If @child is different from the currently visible child,
the transition between the two will be animated with the
current transition type of @stack.

Note that the @child widget has to be visible itself
(see [method@Gtk.Widget.show]) in order to become the visible
child of @stack. *)
external set_visible_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_stack_set_visible_child"

(** Sets the type of animation that will be used for
transitions between pages in @stack.

Available types include various kinds of fades and slides.

The transition type can be changed without problems
at runtime, so it is possible to change the animation
based on the page that is about to become current. *)
external set_transition_type : t -> Gtk_enums.stacktransitiontype -> unit = "ml_gtk_stack_set_transition_type"

(** Removes a child widget from @stack. *)
external remove : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_stack_remove"

(** Gets the currently visible child of @stack.

Returns %NULL if there are no visible children. *)
external get_visible_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_stack_get_visible_child"

(** Gets the type of animation that will be used
for transitions between pages in @stack. *)
external get_transition_type : t -> Gtk_enums.stacktransitiontype = "ml_gtk_stack_get_transition_type"

(** Returns a `GListModel` that contains the pages of the stack.

This can be used to keep an up-to-date view. The model also
implements [iface@Gtk.SelectionModel] and can be used to track
and modify the visible page. *)
external get_pages : t -> Selection_model.t = "ml_gtk_stack_get_pages"

(** Returns the `GtkStackPage` object for @child. *)
external get_page : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> Stack_page.t = "ml_gtk_stack_get_page"

(** Finds the child with the name given as the argument.

Returns %NULL if there is no child with this name. *)
external get_child_by_name : t -> string -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_stack_get_child_by_name"

(** Adds a child to @stack.

The child is identified by the @name. The @title
will be used by `GtkStackSwitcher` to represent
@child in a tab bar, so it should be short. *)
external add_titled : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> string option -> string -> Stack_page.t = "ml_gtk_stack_add_titled"

(** Adds a child to @stack.

The child is identified by the @name. *)
external add_named : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> string option -> Stack_page.t = "ml_gtk_stack_add_named"

(** Adds a child to @stack. *)
external add_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> Stack_page.t = "ml_gtk_stack_add_child"

