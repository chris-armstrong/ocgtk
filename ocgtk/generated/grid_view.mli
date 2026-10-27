(** Presents a large dynamic grid of items.

    [GtkGridView] uses its factory to generate one child widget for each visible
    item and shows them in a grid. The orientation of the grid view determines
    if the grid reflows vertically or horizontally.

    [GtkGridView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on _rubberband selection_, using
    [Gtk.GridView:enable-rubberband].

    To learn more about the list widget framework, see the overview.

    {b Actions}

    [GtkGridView] defines a set of built-in actions:

    - [list.activate-item] activates the item at given position by emitting the
      the [Gtk.GridView::activate] signal.

    {b CSS nodes}

    {[
    gridview
    ├── child[.activatable]
    │
    ├── child[.activatable]
    │
    ┊
    ╰── [rubberband]
    ]}

    [GtkGridView] uses a single CSS node with name [gridview]. Each child uses a
    single CSS node with name [child]. If the [Gtk.ListItem:activatable]
    property is set, the corresponding row will have the [.activatable] style
    class. For rubberband selection, a subnode with name [rubberband] is used.

    {b Accessibility}

    [GtkGridView] uses the [Gtk.AccessibleRole.grid] role, and the items use the
    [Gtk.AccessibleRole.grid_cell] role.

    Its methods, signals and properties are on {!class-type-grid_view_t}. The
    functions it is built on are in {!Ocgtk.Raw.Grid_view}. *)

(** The methods, signals and properties of a [GtkGridView]. *)
class type grid_view_t = object
  inherit List_base.list_base_t

  method on_activate :
    ?after:bool ->
    callback:(position:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_enable_rubberband : unit -> bool
  (** Returns whether rows can be selected by dragging with the mouse. *)

  method get_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items. *)

  method get_max_columns : unit -> int
  (** Gets the maximum number of columns that the grid will use. *)

  method get_min_columns : unit -> int
  (** Gets the minimum number of columns that the grid will use. *)

  method get_model : unit -> Selection_model.selection_model_t option
  (** Gets the model that's currently used to read the items displayed. *)

  method get_single_click_activate : unit -> bool
  (** Returns whether items will be activated on single click and selected on
      hover. *)

  method get_tab_behavior : unit -> Enums.listtabbehavior
  (** Gets the behavior set for the <kbd>Tab</kbd> key. *)

  method scroll_to :
    int -> Enums.listscrollflags -> Raw.Scroll_info.t option -> unit
  (** Scrolls to the item at the given position and performs the actions
      specified in [flags].

      This function works no matter if the gridview is shown or focused. If it
      isn't, then the changes will take effect once that happens. *)

  method set_enable_rubberband : bool -> unit
  (** Sets whether selections can be changed by dragging with the mouse. *)

  method set_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items. *)

  method set_max_columns : int -> unit
  (** Sets the maximum number of columns to use.

      This number must be at least 1.

      If [max_columns] is smaller than the minimum set via
      [Gtk.GridView.set_min_columns], that value is used instead. *)

  method set_min_columns : int -> unit
  (** Sets the minimum number of columns to use.

      This number must be at least 1.

      If [min_columns] is smaller than the minimum set via
      [Gtk.GridView.set_max_columns], that value is ignored. *)

  method set_model : Selection_model.selection_model_t option -> unit
  (** Sets the model to use.

      This must be a [Gtk.SelectionModel]. *)

  method set_single_click_activate : bool -> unit
  (** Sets whether items should be activated on single click and selected on
      hover. *)

  method set_tab_behavior : Enums.listtabbehavior -> unit
  (** Sets the behavior of the <kbd>Tab</kbd> and
      <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)

  method as_grid_view : Raw.Grid_view.t
end

class grid_view : Raw.Grid_view.t -> grid_view_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Grid_view.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGridView], give one already wrapped. *)

val new_ :
  Selection_model.selection_model_t option ->
  List_item_factory.list_item_factory_t option ->
  grid_view_t
