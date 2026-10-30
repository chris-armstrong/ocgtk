(** Reveals a search entry when search is started.

    Its methods, signals and properties are on {!class-type-search_bar_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Search_bar}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SearchBar].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Reveals a search entry when search is started.

    An example GtkSearchBar

    It can also contain additional widgets, such as drop-down menus, or buttons.
    The search bar would appear when a search is started through typing on the
    keyboard, or the application’s search mode is toggled on.

    For keyboard presses to start a search, the search bar must be told of a
    widget to capture key events from through
    {{!Ocgtk.Search_bar.class-type-search_bar_t.method-set_key_capture_widget}[Gtk.SearchBar.set_key_capture_widget]}.
    This widget will typically be the top-level window, or a parent container of
    the search bar. Common shortcuts such as Ctrl+F should be handled as an
    application action, or through the menu items.

    You will also need to tell the search bar about which entry you are using as
    your search entry using
    {{!Ocgtk.Search_bar.class-type-search_bar_t.method-connect_entry}[Gtk.SearchBar.connect_entry]}.

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

    [GtkSearchBar] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-SEARCH}[Gtk.AccessibleRole.search]}
    role. *)
class type search_bar_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method connect_entry : Editable.editable_t -> unit
  (** Connects the [GtkEditable] widget passed as the one to be used in this
      search bar.

      The entry should be a descendant of the search bar. Calling this function
      manually is only required if the entry isn’t the direct child of the
      search bar (as in our main example). *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [bar]. *)

  method get_key_capture_widget : unit -> Widget.widget_t option
  (** Gets the widget that [bar] is capturing key events from. *)

  method get_search_mode : unit -> bool
  (** Returns whether the search mode is on or off. *)

  method get_show_close_button : unit -> bool
  (** Returns whether the close button is shown. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [bar]. *)

  method set_key_capture_widget : Widget.widget_t option -> unit
  (** Sets [widget] as the widget that [bar] will capture key events from.

      If key events are handled by the search bar, the bar will be shown, and
      the entry populated with the entered text.

      Note that despite the name of this function, the events are only
      'captured' in the bubble phase, which means that editable child widgets of
      [widget] will receive text input before it gets captured. If that is not
      desired, you can capture and forward the events yourself with
      [Gtk.EventControllerKey.forward]. *)

  method set_search_mode : bool -> unit
  (** Switches the search mode on or off. *)

  method set_show_close_button : bool -> unit
  (** Shows or hides the close button.

      Applications that already have a “search” toggle button should not show a
      close button in their search bar, as it duplicates the role of the toggle
      button. *)

  (** {2:conversions Conversions} *)

  method as_search_bar : Raw.Search_bar.t
end

class search_bar : Raw.Search_bar.t -> search_bar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Search_bar.t}. *)

(** {1:description Description}

    Reveals a search entry when search is started.

    An example GtkSearchBar

    It can also contain additional widgets, such as drop-down menus, or buttons.
    The search bar would appear when a search is started through typing on the
    keyboard, or the application’s search mode is toggled on.

    For keyboard presses to start a search, the search bar must be told of a
    widget to capture key events from through
    {{!Ocgtk.Search_bar.class-type-search_bar_t.method-set_key_capture_widget}[Gtk.SearchBar.set_key_capture_widget]}.
    This widget will typically be the top-level window, or a parent container of
    the search bar. Common shortcuts such as Ctrl+F should be handled as an
    application action, or through the menu items.

    You will also need to tell the search bar about which entry you are using as
    your search entry using
    {{!Ocgtk.Search_bar.class-type-search_bar_t.method-connect_entry}[Gtk.SearchBar.connect_entry]}.

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

    [GtkSearchBar] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-SEARCH}[Gtk.AccessibleRole.search]}
    role. *)

(** {1:constructors Constructors} *)

val new_ : unit -> search_bar_t
(** Creates a [GtkSearchBar].

    You will need to tell it about which widget is going to be your text entry
    using
    {{!Ocgtk.Search_bar.class-type-search_bar_t.method-connect_entry}[Gtk.SearchBar.connect_entry]}.
*)
