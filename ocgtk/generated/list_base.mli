(** The abstract base class for GTK's list widgets.

    {b Shortcuts and Gestures}

    [GtkListBase] supports the following keyboard shortcuts:

    - <kbd>Ctrl</kbd>+<kbd>A</kbd> or <kbd>Ctrl</kbd>+<kbd>&sol;</kbd> selects
      all items.
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>A</kbd> or
      <kbd>Ctrl</kbd>+<kbd>&bsol;</kbd> unselects all items.

    The focused item is controlled by the navigation keys below, combined with
    the <kbd>Ctrl</kbd> modifier to prevent moving the selection, and the
    <kbd>Shift</kbd> modifier to extend the current selection.

    - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move the focus on
      the next item in the designed direction.
    - <kbd>Home</kbd> and <kbd>End</kbd> focus the first or last item.
    - <kbd>PgUp</kbd> and <kbd>PgDn</kbd> move the focus one page up or down.

    List item widgets support the following keyboard shortcuts:

    - <kbd>Enter</kbd> activates the item.
    - <kbd>␣</kbd> selects the item, with the same <kbd>Ctrl</kbd> and
      <kbd>Shift</kbd> modifiers combinations as the navigation keys.

    {b Actions}

    [GtkListBase] defines a set of built-in actions:

    - [list.scroll-to-item] moves the visible area to the item at given position
      with the minimum amount of scrolling required. If the item is already
      visible, nothing happens.
    - [list.select-item] changes the selection.
    - [list.select-all] selects all items in the model, if the selection model
      supports it.
    - [list.unselect-all] unselects all items in the model, if the selection
      model supports it.

    List item widgets install the following actions:

    - [listitem.select] changes selection if the item is selectable.
    - [listitem.scroll-to] moves the visible area of the list to this item with
      the minimum amount of scrolling required.

    Its methods, signals and properties are on {!class-type-list_base_t}. The
    functions it is built on are in {!Ocgtk.Raw.List_base}. *)

(** The methods, signals and properties of a [ListBase]. *)
class type list_base_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t
  inherit Scrollable.scrollable_t
  method orientation : Enums.orientation
  method as_list_base : Raw.List_base.t
end

class list_base : Raw.List_base.t -> list_base_t
(** Wraps a raw handle of {!Ocgtk.Raw.List_base.t}. *)
