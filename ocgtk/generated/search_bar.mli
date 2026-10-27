(** Reveals a search entry when search is started.

    An example GtkSearchBar

    It can also contain additional widgets, such as drop-down menus, or buttons.
    The search bar would appear when a search is started through typing on the
    keyboard, or the application’s search mode is toggled on.

    For keyboard presses to start a search, the search bar must be told of a
    widget to capture key events from through
    [Gtk.SearchBar.set_key_capture_widget]. This widget will typically be the
    top-level window, or a parent container of the search bar. Common shortcuts
    such as Ctrl+F should be handled as an application action, or through the
    menu items.

    You will also need to tell the search bar about which entry you are using as
    your search entry using [Gtk.SearchBar.connect_entry].

    {b Creating a search bar}

    The following example shows you how to create a more complex search entry.

    {{:https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/search-bar.c}A
     simple example}

    {b Shortcuts and Gestures}

    [GtkSearchBar] supports the following keyboard shortcuts:

    - <kbd>Escape</kbd> hides the search bar.

    {b CSS nodes}

    {[
    searchbar
    ╰── revealer
        ╰── box
             ├── [child]
             ╰── [button.close]
    ]}

    [GtkSearchBar] has a main CSS node with name searchbar. It has a child node
    with name revealer that contains a node with name box. The box node contains
    both the CSS node of the child widget as well as an optional button node
    which gets the .close style class applied.

    {b Accessibility}

    [GtkSearchBar] uses the [Gtk.AccessibleRole.search] role.

    Its methods, signals and properties are on {!class-type-search_bar_t}. The
    functions it is built on are in {!Ocgtk.Raw.Search_bar}. *)

(** The methods, signals and properties of a [GtkSearchBar]. *)
class type search_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method connect_entry : Editable.editable_t -> unit

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_key_capture_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_search_mode : unit -> bool
  method get_show_close_button : unit -> bool

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_key_capture_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_search_mode : bool -> unit
  method set_show_close_button : bool -> unit
  method as_search_bar : Raw.Search_bar.t
end

class search_bar : Raw.Search_bar.t -> search_bar_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Search_bar.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSearchBar], give one already wrapped. *)

val new_ : unit -> search_bar_t
