(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type column_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  method on_activate :
    ?after:bool ->
    callback:(position:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a row has been activated by the user, usually via activating
      the GtkListBase|list.activate-item action.

      This allows for a convenient way to handle activation in a columnview. See
      [Gtk.ListItem.set_activatable] for details on how to use this signal. *)

  method append_column : column_view_column_t -> unit
  (** Appends the [column] to the end of the columns in [self]. *)

  method get_columns : unit -> Ocgio.List_model.list_model_t
  (** Gets the list of columns in this column view.

      This list is constant over the lifetime of [self] and can be used to
      monitor changes to the columns of [self] by connecting to the
      [Gio.ListModel::items-changed] signal. *)

  method get_enable_rubberband : unit -> bool
  (** Returns whether rows can be selected by dragging with the mouse. *)

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate section headers. *)

  method get_model : unit -> Selection_model.selection_model_t option
  (** Gets the model that's currently used to read the items displayed. *)

  method get_reorderable : unit -> bool
  (** Returns whether columns are reorderable. *)

  method get_row_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory set via [Gtk.ColumnView.set_row_factory]. *)

  method get_show_column_separators : unit -> bool
  (** Returns whether the list should show separators between columns. *)

  method get_show_row_separators : unit -> bool
  (** Returns whether the list should show separators between rows. *)

  method get_single_click_activate : unit -> bool
  (** Returns whether rows will be activated on single click and selected on
      hover. *)

  method get_sorter : unit -> Sorter.sorter_t option
  (** Returns a special sorter that reflects the users sorting choices in the
      column view.

      To allow users to customizable sorting by clicking on column headers, this
      sorter needs to be set on the sort model underneath the model that is
      displayed by the view.

      See [Gtk.ColumnViewColumn.set_sorter] for setting up per-column sorting.

      Here is an example:

      {[
      gtk_column_view_column_set_sorter (column, sorter);
      gtk_column_view_append_column (view, column);
      sorter = g_object_ref (gtk_column_view_get_sorter (view)));
      model = gtk_sort_list_model_new (store, sorter);
      selection = gtk_no_selection_new (model);
      gtk_column_view_set_model (view, selection);
      ]} *)

  method get_tab_behavior : unit -> Enums.listtabbehavior
  (** Gets the behavior set for the <kbd>Tab</kbd> key. *)

  method insert_column : int -> column_view_column_t -> unit
  (** Inserts a column at the given position in the columns of [self].

      If [column] is already a column of [self], it will be repositioned. *)

  method remove_column : column_view_column_t -> unit
  (** Removes the [column] from the list of columns of [self]. *)

  method scroll_to :
    int ->
    column_view_column_t option ->
    Enums.listscrollflags ->
    Raw.Scroll_info.t option ->
    unit
  (** Scroll to the row at the given position - or cell if a column is given -
      and performs the actions specified in [flags].

      This function works no matter if the columnview is shown or focused. If it
      isn't, then the changes will take effect once that happens. *)

  method set_enable_rubberband : bool -> unit
  (** Sets whether selections can be changed by dragging with the mouse. *)

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit
  (** Sets the factory to use for populating the [Gtk.ListHeader] objects used
      in section headers.

      If this factory is set to [NULL], the list will not show section headers.
  *)

  method set_model : Selection_model.selection_model_t option -> unit
  (** Sets the model to use.

      This must be a [Gtk.SelectionModel]. *)

  method set_reorderable : bool -> unit
  (** Sets whether columns should be reorderable by dragging. *)

  method set_row_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the factory used for configuring rows.

      The factory must be for configuring [Gtk.ColumnViewRow] objects.

      If this factory is not set - which is the default - then the defaults will
      be used.

      This factory is not used to set the widgets displayed in the individual
      cells. For that see [GtkColumnViewColumn.set_factory] and
      [GtkColumnViewCell]. *)

  method set_show_column_separators : bool -> unit
  (** Sets whether the list should show separators between columns. *)

  method set_show_row_separators : bool -> unit
  (** Sets whether the list should show separators between rows. *)

  method set_single_click_activate : bool -> unit
  (** Sets whether rows should be activated on single click and selected on
      hover. *)

  method set_tab_behavior : Enums.listtabbehavior -> unit
  (** Sets the <kbd>Tab</kbd> key behavior.

      This influences how the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd>
      keys move the focus in the columnview. *)

  method sort_by_column : column_view_column_t option -> Enums.sorttype -> unit
  (** Sets the sorting of the view.

      This function should be used to set up the initial sorting. At runtime,
      users can change the sorting of a column view by clicking on the list
      headers.

      This call only has an effect if the sorter returned by
      [Gtk.ColumnView.get_sorter] is set on a sort model, and
      [Gtk.ColumnViewColumn.set_sorter] has been called on [column] to associate
      a sorter with the column.

      If [column] is unset, the view will be unsorted. *)

  method as_column_view : Raw.Column_view.t
end

and column_view_column_t = object
  method get_column_view : unit -> column_view_t option
  (** Gets the column view that's currently displaying this column.

      If [self] has not been added to a column view yet, [NULL] is returned. *)

  method get_expand : unit -> bool
  (** Returns whether this column should expand. *)

  method get_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items for this
      column. *)

  method get_fixed_width : unit -> int
  (** Gets the fixed width of the column. *)

  method get_header_menu : unit -> Ocgio.Menu_model.menu_model_t option
  (** Gets the menu model that is used to create the context menu for the column
      header. *)

  method get_id : unit -> string option
  (** Returns the ID set with [Gtk.ColumnViewColumn.set_id]. *)

  method get_resizable : unit -> bool
  (** Returns whether this column is resizable. *)

  method get_sorter : unit -> Sorter.sorter_t option
  (** Returns the sorter that is associated with the column. *)

  method get_title : unit -> string option
  (** Returns the title set with [Gtk.ColumnViewColumn.set_title]. *)

  method get_visible : unit -> bool
  (** Returns whether this column is visible. *)

  method set_expand : bool -> unit
  (** Sets the column to take available extra space.

      The extra space is shared equally amongst all columns that have are set to
      expand. *)

  method set_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items for this
      column. *)

  method set_fixed_width : int -> unit
  (** Sets the fixed width of the column.

      If [fixed_width] is -1, the fixed width of the column is unset.

      Setting a fixed width overrides the automatically calculated width.
      Interactive resizing also sets the “fixed-width” property. *)

  method set_header_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets the menu model that is used to create the context menu for the column
      header. *)

  method set_id : string option -> unit
  (** Sets the id of this column.

      GTK makes no use of this, but applications can use it when storing column
      view configuration.

      It is up to callers to ensure uniqueness of IDs. *)

  method set_resizable : bool -> unit
  (** Sets whether this column should be resizable by dragging. *)

  method set_sorter : Sorter.sorter_t option -> unit
  (** Associates a sorter with the column.

      If [sorter] is unset, the column will not let users change the sorting by
      clicking on its header.

      This sorter can be made active by clicking on the column header, or by
      calling [Gtk.ColumnView.sort_by_column].

      See [Gtk.ColumnView.get_sorter] for the necessary steps for setting up
      customizable sorting for [Gtk.ColumnView]. *)

  method set_title : string option -> unit
  (** Sets the title of this column.

      The title is displayed in the header of a [GtkColumnView] for this column
      and is therefore user-facing text that should be translated. *)

  method set_visible : bool -> unit
  (** Sets whether this column should be visible in views. *)

  method as_column_view_column : Raw.Column_view_column.t
end

class column_view (obj : Raw.Column_view.t) : column_view_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Scrollable.scrollable (Raw.Scrollable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Column_view.on_activate ~after self#as_column_view ~callback

    method append_column : column_view_column_t -> unit =
      fun column ->
        let column = column#as_column_view_column in
        Raw.Column_view.append_column obj column

    method get_columns : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model (Raw.Column_view.get_columns obj)

    method get_enable_rubberband : unit -> bool =
      fun () -> Raw.Column_view.get_enable_rubberband obj

    method get_header_factory :
        unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Column_view.get_header_factory obj)

    method get_model : unit -> Selection_model.selection_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Selection_model.selection_model ret)
          (Raw.Column_view.get_model obj)

    method get_reorderable : unit -> bool =
      fun () -> Raw.Column_view.get_reorderable obj

    method get_row_factory :
        unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Column_view.get_row_factory obj)

    method get_show_column_separators : unit -> bool =
      fun () -> Raw.Column_view.get_show_column_separators obj

    method get_show_row_separators : unit -> bool =
      fun () -> Raw.Column_view.get_show_row_separators obj

    method get_single_click_activate : unit -> bool =
      fun () -> Raw.Column_view.get_single_click_activate obj

    method get_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Column_view.get_sorter obj)

    method get_tab_behavior : unit -> Enums.listtabbehavior =
      fun () -> Raw.Column_view.get_tab_behavior obj

    method insert_column : int -> column_view_column_t -> unit =
      fun position column ->
        let column = column#as_column_view_column in
        Raw.Column_view.insert_column obj position column

    method remove_column : column_view_column_t -> unit =
      fun column ->
        let column = column#as_column_view_column in
        Raw.Column_view.remove_column obj column

    method scroll_to :
        int ->
        column_view_column_t option ->
        Enums.listscrollflags ->
        Raw.Scroll_info.t option ->
        unit =
      fun pos column flags scroll ->
        let column = Option.map (fun c -> c#as_column_view_column) column in
        Raw.Column_view.scroll_to obj pos column flags scroll

    method set_enable_rubberband : bool -> unit =
      fun enable_rubberband ->
        Raw.Column_view.set_enable_rubberband obj enable_rubberband

    method set_header_factory :
        List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Column_view.set_header_factory obj factory

    method set_model : Selection_model.selection_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_selection_model) model in
        Raw.Column_view.set_model obj model

    method set_reorderable : bool -> unit =
      fun reorderable -> Raw.Column_view.set_reorderable obj reorderable

    method set_row_factory :
        List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Column_view.set_row_factory obj factory

    method set_show_column_separators : bool -> unit =
      fun show_column_separators ->
        Raw.Column_view.set_show_column_separators obj show_column_separators

    method set_show_row_separators : bool -> unit =
      fun show_row_separators ->
        Raw.Column_view.set_show_row_separators obj show_row_separators

    method set_single_click_activate : bool -> unit =
      fun single_click_activate ->
        Raw.Column_view.set_single_click_activate obj single_click_activate

    method set_tab_behavior : Enums.listtabbehavior -> unit =
      fun tab_behavior -> Raw.Column_view.set_tab_behavior obj tab_behavior

    method sort_by_column :
        column_view_column_t option -> Enums.sorttype -> unit =
      fun column direction ->
        let column = Option.map (fun c -> c#as_column_view_column) column in
        Raw.Column_view.sort_by_column obj column direction

    method as_column_view = obj
  end

and column_view_column (obj : Raw.Column_view_column.t) : column_view_column_t =
  object (self)
    method get_column_view : unit -> column_view_t option =
      fun () ->
        Option.map
          (fun ret -> new column_view ret)
          (Raw.Column_view_column.get_column_view obj)

    method get_expand : unit -> bool =
      fun () -> Raw.Column_view_column.get_expand obj

    method get_factory : unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Column_view_column.get_factory obj)

    method get_fixed_width : unit -> int =
      fun () -> Raw.Column_view_column.get_fixed_width obj

    method get_header_menu : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Column_view_column.get_header_menu obj)

    method get_id : unit -> string option =
      fun () -> Raw.Column_view_column.get_id obj

    method get_resizable : unit -> bool =
      fun () -> Raw.Column_view_column.get_resizable obj

    method get_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Column_view_column.get_sorter obj)

    method get_title : unit -> string option =
      fun () -> Raw.Column_view_column.get_title obj

    method get_visible : unit -> bool =
      fun () -> Raw.Column_view_column.get_visible obj

    method set_expand : bool -> unit =
      fun expand -> Raw.Column_view_column.set_expand obj expand

    method set_factory : List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Column_view_column.set_factory obj factory

    method set_fixed_width : int -> unit =
      fun fixed_width -> Raw.Column_view_column.set_fixed_width obj fixed_width

    method set_header_menu : Ocgio.Menu_model.menu_model_t option -> unit =
      fun menu ->
        let menu = Option.map (fun c -> c#as_menu_model) menu in
        Raw.Column_view_column.set_header_menu obj menu

    method set_id : string option -> unit =
      fun id -> Raw.Column_view_column.set_id obj id

    method set_resizable : bool -> unit =
      fun resizable -> Raw.Column_view_column.set_resizable obj resizable

    method set_sorter : Sorter.sorter_t option -> unit =
      fun sorter ->
        let sorter = Option.map (fun c -> c#as_sorter) sorter in
        Raw.Column_view_column.set_sorter obj sorter

    method set_title : string option -> unit =
      fun title -> Raw.Column_view_column.set_title obj title

    method set_visible : bool -> unit =
      fun visible -> Raw.Column_view_column.set_visible obj visible

    method as_column_view_column = obj
  end

let new_ (model : Selection_model.selection_model_t option) : column_view_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let obj_ = Raw.Column_view.new_ model in
  new column_view obj_

let new_ (title : string option)
    (factory : List_item_factory.list_item_factory_t option) :
    column_view_column_t =
  let factory = Option.map (fun c -> c#as_list_item_factory) factory in
  let obj_ = Raw.Column_view_column.new_ title factory in
  new column_view_column obj_
