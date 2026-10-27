[@@@ocaml.text
"Shows one of its children at a time.\n\n\
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
 pages, which are the accessible parent objects of the child widgets.\n\n\
 Its methods, signals and properties are on {!class-type-stack_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Stack}."]

(** The methods, signals and properties of a [GtkStack]. *)
class type stack_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Stack_page.stack_page_t

  method add_named :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option ->
    Stack_page.stack_page_t

  method add_titled :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option ->
    string ->
    Stack_page.stack_page_t

  method get_child_by_name :
    string ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_hhomogeneous : unit -> bool
  method get_interpolate_size : unit -> bool

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Stack_page.stack_page_t

  method get_pages : unit -> Selection_model.selection_model_t
  method get_transition_duration : unit -> int
  method get_transition_running : unit -> bool
  method get_transition_type : unit -> Enums.stacktransitiontype
  method get_vhomogeneous : unit -> bool

  method get_visible_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_visible_child_name : unit -> string option

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_hhomogeneous : bool -> unit
  method set_interpolate_size : bool -> unit
  method set_transition_duration : int -> unit
  method set_transition_type : Enums.stacktransitiontype -> unit
  method set_vhomogeneous : bool -> unit

  method set_visible_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_visible_child_full : string -> Enums.stacktransitiontype -> unit
  method set_visible_child_name : string -> unit
  method as_stack : Raw.Stack.t
end

class stack : Raw.Stack.t -> stack_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Stack.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStack], give one already wrapped. *)

val new_ : unit -> stack_t
