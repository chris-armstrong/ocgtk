(** Shows one of its children at a time.

    Its methods, signals and properties are on {!class-type-stack_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Stack}. *)

(** {1:class Class} *)

class type stack_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Stack_page.stack_page_t
  (** Adds a child to [stack]. *)

  method add_named :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option ->
    Stack_page.stack_page_t
  (** Adds a child to [stack].

      The child is identified by the [name]. *)

  method add_titled :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option ->
    string ->
    Stack_page.stack_page_t
  (** Adds a child to [stack].

      The child is identified by the [name]. The [title] will be used by
      [GtkStackSwitcher] to represent [child] in a tab bar, so it should be
      short. *)

  method get_child_by_name :
    string ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Finds the child with the name given as the argument.

      Returns [NULL] if there is no child with this name. *)

  method get_hhomogeneous : unit -> bool
  (** Gets whether [stack] is horizontally homogeneous. *)

  method get_interpolate_size : unit -> bool
  (** Returns whether the [GtkStack] is set up to interpolate between the sizes
      of children on page switch. *)

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Stack_page.stack_page_t
  (** Returns the [GtkStackPage] object for [child]. *)

  method get_pages : unit -> Selection_model.selection_model_t
  (** Returns a [GListModel] that contains the pages of the stack.

      This can be used to keep an up-to-date view. The model also implements
      [Gtk.SelectionModel] and can be used to track and modify the visible page.
  *)

  method get_transition_duration : unit -> int
  (** Returns the amount of time (in milliseconds) that transitions between
      pages in [stack] will take. *)

  method get_transition_running : unit -> bool
  (** Returns whether the [stack] is currently in a transition from one page to
      another. *)

  method get_transition_type : unit -> Enums.stacktransitiontype
  (** Gets the type of animation that will be used for transitions between pages
      in [stack]. *)

  method get_vhomogeneous : unit -> bool
  (** Gets whether [stack] is vertically homogeneous. *)

  method get_visible_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the currently visible child of [stack].

      Returns [NULL] if there are no visible children. *)

  method get_visible_child_name : unit -> string option
  (** Returns the name of the currently visible child of [stack].

      Returns [NULL] if there is no visible child. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child widget from [stack]. *)

  method set_hhomogeneous : bool -> unit
  (** Sets the [GtkStack] to be horizontally homogeneous or not.

      If it is homogeneous, the [GtkStack] will request the same width for all
      its children. If it isn't, the stack may change width when a different
      child becomes visible. *)

  method set_interpolate_size : bool -> unit
  (** Sets whether or not [stack] will interpolate its size when changing the
      visible child.

      If the [Gtk.Stack:interpolate-size] property is set to [TRUE], [stack]
      will interpolate its size between the current one and the one it'll take
      after changing the visible child, according to the set transition
      duration. *)

  method set_transition_duration : int -> unit
  (** Sets the duration that transitions between pages in [stack] will take. *)

  method set_transition_type : Enums.stacktransitiontype -> unit
  (** Sets the type of animation that will be used for transitions between pages
      in [stack].

      Available types include various kinds of fades and slides.

      The transition type can be changed without problems at runtime, so it is
      possible to change the animation based on the page that is about to become
      current. *)

  method set_vhomogeneous : bool -> unit
  (** Sets the [GtkStack] to be vertically homogeneous or not.

      If it is homogeneous, the [GtkStack] will request the same height for all
      its children. If it isn't, the stack may change height when a different
      child becomes visible. *)

  method set_visible_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Makes [child] the visible child of [stack].

      If [child] is different from the currently visible child, the transition
      between the two will be animated with the current transition type of
      [stack].

      Note that the [child] widget has to be visible itself (see
      [Gtk.Widget.show]) in order to become the visible child of [stack]. *)

  method set_visible_child_full : string -> Enums.stacktransitiontype -> unit
  (** Makes the child with the given name visible.

      Note that the child widget has to be visible itself (see
      [Gtk.Widget.show]) in order to become the visible child of [stack]. *)

  method set_visible_child_name : string -> unit
  (** Makes the child with the given name visible.

      If [child] is different from the currently visible child, the transition
      between the two will be animated with the current transition type of
      [stack].

      Note that the child widget has to be visible itself (see
      [Gtk.Widget.show]) in order to become the visible child of [stack]. *)

  method as_stack : Raw.Stack.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Stack].}\n\n\
     Shows one of its children at a time.\n\n\
     An example GtkStack\n\n\
     In contrast to [GtkNotebook], [GtkStack] does not provide a means\n\
     for users to change the visible child. Instead, a separate widget\n\
     such as [Gtk.StackSwitcher] or [Gtk.StackSidebar] can\n\
     be used with [GtkStack] to provide this functionality.\n\n\
     Transitions between pages can be animated as slides or fades. This\n\
     can be controlled with [Gtk.Stack.set_transition_type].\n\
     These animations respect the [Gtk.Settings:gtk-enable-animations]\n\
     setting.\n\n\
     [GtkStack] maintains a [Gtk.StackPage] object for each added\n\
     child, which holds additional per-child properties. You\n\
     obtain the [GtkStackPage] for a child with [Gtk.Stack.get_page]\n\
     and you can obtain a [GtkSelectionModel] containing all the pages\n\
     with [Gtk.Stack.get_pages].\n\n\
     {b GtkStack as GtkBuildable}\n\n\
     To set child-specific properties in a .ui file, create [GtkStackPage]\n\
     objects explicitly, and set the child widget as a property on it:\n\n\
     {[\n\
    \  <object class=\"GtkStack\" id=\"stack\">\n\
    \    <child>\n\
    \      <object class=\"GtkStackPage\">\n\
    \        <property name=\"name\">page1</property>\n\
    \        <property name=\"title\">In the beginning…</property>\n\
    \        <property name=\"child\">\n\
    \          <object class=\"GtkLabel\">\n\
    \            <property name=\"label\">It was dark</property>\n\
    \          </object>\n\
    \        </property>\n\
    \      </object>\n\
    \    </child>\n\
     ]}\n\n\
     {b CSS nodes}\n\n\
     [GtkStack] has a single CSS node named stack.\n\n\
     {b Accessibility}\n\n\
     [GtkStack] uses the [Gtk.AccessibleRole.tab_panel] role for the stack\n\
     pages, which are the accessible parent objects of the child widgets."]

class stack : Raw.Stack.t -> stack_t
(** Wraps a raw handle of {!Ocgtk.Raw.Stack.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Shows one of its children at a time.\n\n\
 An example GtkStack\n\n\
 In contrast to [GtkNotebook], [GtkStack] does not provide a means\n\
 for users to change the visible child. Instead, a separate widget\n\
 such as [Gtk.StackSwitcher] or [Gtk.StackSidebar] can\n\
 be used with [GtkStack] to provide this functionality.\n\n\
 Transitions between pages can be animated as slides or fades. This\n\
 can be controlled with [Gtk.Stack.set_transition_type].\n\
 These animations respect the [Gtk.Settings:gtk-enable-animations]\n\
 setting.\n\n\
 [GtkStack] maintains a [Gtk.StackPage] object for each added\n\
 child, which holds additional per-child properties. You\n\
 obtain the [GtkStackPage] for a child with [Gtk.Stack.get_page]\n\
 and you can obtain a [GtkSelectionModel] containing all the pages\n\
 with [Gtk.Stack.get_pages].\n\n\
 {b GtkStack as GtkBuildable}\n\n\
 To set child-specific properties in a .ui file, create [GtkStackPage]\n\
 objects explicitly, and set the child widget as a property on it:\n\n\
 {[\n\
\  <object class=\"GtkStack\" id=\"stack\">\n\
\    <child>\n\
\      <object class=\"GtkStackPage\">\n\
\        <property name=\"name\">page1</property>\n\
\        <property name=\"title\">In the beginning…</property>\n\
\        <property name=\"child\">\n\
\          <object class=\"GtkLabel\">\n\
\            <property name=\"label\">It was dark</property>\n\
\          </object>\n\
\        </property>\n\
\      </object>\n\
\    </child>\n\
 ]}\n\n\
 {b CSS nodes}\n\n\
 [GtkStack] has a single CSS node named stack.\n\n\
 {b Accessibility}\n\n\
 [GtkStack] uses the [Gtk.AccessibleRole.tab_panel] role for the stack\n\
 pages, which are the accessible parent objects of the child widgets."]

(** {1:constructors Constructors} *)

val new_ : unit -> stack_t
(** Creates a new [GtkStack]. *)
