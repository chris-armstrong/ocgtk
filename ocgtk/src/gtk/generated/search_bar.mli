(* GENERATED CODE - DO NOT EDIT *)
(* SearchBar: SearchBar *)

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

    [GtkSearchBar] uses the [Gtk.AccessibleRole.search] role. *)

type t = [ `search_bar | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_search_bar_new"
(** Create a new SearchBar *)

(* Methods *)

external set_show_close_button : t -> bool -> unit
  = "ml_gtk_search_bar_set_show_close_button"
(** Shows or hides the close button.

    Applications that already have a “search” toggle button should not show a
    close button in their search bar, as it duplicates the role of the toggle
    button. *)

external set_search_mode : t -> bool -> unit
  = "ml_gtk_search_bar_set_search_mode"
(** Switches the search mode on or off. *)

external set_key_capture_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_search_bar_set_key_capture_widget"
(** Sets [widget] as the widget that [bar] will capture key events from.

    If key events are handled by the search bar, the bar will be shown, and the
    entry populated with the entered text.

    Note that despite the name of this function, the events are only 'captured'
    in the bubble phase, which means that editable child widgets of [widget]
    will receive text input before it gets captured. If that is not desired, you
    can capture and forward the events yourself with
    [Gtk.EventControllerKey.forward]. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_search_bar_set_child"
(** Sets the child widget of [bar]. *)

external get_show_close_button : t -> bool
  = "ml_gtk_search_bar_get_show_close_button"
(** Returns whether the close button is shown. *)

external get_search_mode : t -> bool = "ml_gtk_search_bar_get_search_mode"
(** Returns whether the search mode is on or off. *)

external get_key_capture_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_search_bar_get_key_capture_widget"
(** Gets the widget that [bar] is capturing key events from. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_search_bar_get_child"
(** Gets the child widget of [bar]. *)

external connect_entry : t -> Editable.t -> unit
  = "ml_gtk_search_bar_connect_entry"
(** Connects the [GtkEditable] widget passed as the one to be used in this
    search bar.

    The entry should be a descendant of the search bar. Calling this function
    manually is only required if the entry isn’t the direct child of the search
    bar (as in our main example). *)

(* Properties *)
