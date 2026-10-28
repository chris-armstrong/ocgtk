(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for CellArea from cyclic group Cell_area_and__cell_area_context_and__cell_layout *)

[@@@ocaml.text
"An abstract class for laying out [GtkCellRenderer]s\n\n\
 The [GtkCellArea] is an abstract class for [Gtk.CellLayout]\n\
 widgets (also referred to as \"layouting widgets\") to interface with\n\
 an arbitrary number of [Gtk.CellRenderer]s and interact with the user\n\
 for a given [Gtk.TreeModel] row.\n\n\
 The cell area handles events, focus navigation, drawing and\n\
 size requests and allocations for a given row of data.\n\n\
 Usually users dont have to interact with the [GtkCellArea] directly\n\
 unless they are implementing a cell-layouting widget themselves.\n\n\
 {b Requesting area sizes}\n\n\
 As outlined in\n\
 GtkWidget’s geometry management section,\n\
 GTK uses a height-for-width\n\
 geometry management system to compute the sizes of widgets and user\n\
 interfaces. [GtkCellArea] uses the same semantics to calculate the\n\
 size of an area for an arbitrary number of [GtkTreeModel] rows.\n\n\
 When requesting the size of a cell area one needs to calculate\n\
 the size for a handful of rows, and this will be done differently by\n\
 different layouting widgets. For instance a [Gtk.TreeViewColumn]\n\
 always lines up the areas from top to bottom while a [Gtk.IconView]\n\
 on the other hand might enforce that all areas received the same\n\
 width and wrap the areas around, requesting height for more cell\n\
 areas when allocated less width.\n\n\
 It’s also important for areas to maintain some cell\n\
 alignments with areas rendered for adjacent rows (cells can\n\
 appear “columnized” inside an area even when the size of\n\
 cells are different in each row). For this reason the [GtkCellArea]\n\
 uses a [Gtk.CellAreaContext] object to store the alignments\n\
 and sizes along the way (as well as the overall largest minimum\n\
 and natural size for all the rows which have been calculated\n\
 with the said context).\n\n\
 The [Gtk.CellAreaContext] is an opaque object specific to the\n\
 [GtkCellArea] which created it (see [Gtk.CellArea.create_context]).\n\n\
 The owning cell-layouting widget can create as many contexts as\n\
 it wishes to calculate sizes of rows which should receive the\n\
 same size in at least one orientation (horizontally or vertically),\n\
 However, it’s important that the same [Gtk.CellAreaContext] which\n\
 was used to request the sizes for a given [GtkTreeModel] row be\n\
 used when rendering or processing events for that row.\n\n\
 In order to request the width of all the rows at the root level\n\
 of a [GtkTreeModel] one would do the following:\n\n\
 {[\n\
 GtkTreeIter iter;\n\
 int minimum_width;\n\
 int natural_width;\n\n\
 valid = gtk_tree_model_get_iter_first (model, &iter);\n\
 while (valid)\n\
\  {\n\
\    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
\    gtk_cell_area_get_preferred_width (area, context, widget, NULL, NULL);\n\n\
\    valid = gtk_tree_model_iter_next (model, &iter);\n\
\  }\n\n\
 gtk_cell_area_context_get_preferred_width (context, &minimum_width, \
 &natural_width);\n\
 ]}\n\n\
 Note that in this example it’s not important to observe the\n\
 returned minimum and natural width of the area for each row\n\
 unless the cell-layouting object is actually interested in the\n\
 widths of individual rows. The overall width is however stored\n\
 in the accompanying [GtkCellAreaContext] object and can be consulted\n\
 at any time.\n\n\
 This can be useful since [GtkCellLayout] widgets usually have to\n\
 support requesting and rendering rows in treemodels with an\n\
 exceedingly large amount of rows. The [GtkCellLayout] widget in\n\
 that case would calculate the required width of the rows in an\n\
 idle or timeout source (see [GLib.timeout_add]) and when the widget\n\
 is requested its actual width in [Gtk.Widget.measure]\n\
 it can simply consult the width accumulated so far in the\n\
 [GtkCellAreaContext] object.\n\n\
 A simple example where rows are rendered from top to bottom and\n\
 take up the full width of the layouting widget would look like:\n\n\
 {[\n\
 static void\n\
 foo_get_preferred_width (GtkWidget *widget,\n\
\                         int       *minimum_size,\n\
\                         int       *natural_size)\n\
 {\n\
\  Foo *self = FOO (widget);\n\
\  FooPrivate *priv = foo_get_instance_private (self);\n\n\
\  foo_ensure_at_least_one_handfull_of_rows_have_been_requested (self);\n\n\
\  gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, \
 natural_size);\n\
 }\n\
 ]}\n\n\
 In the above example the [Foo] widget has to make sure that some\n\
 row sizes have been calculated (the amount of rows that [Foo] judged\n\
 was appropriate to request space for in a single timeout iteration)\n\
 before simply returning the amount of space required by the area via\n\
 the [GtkCellAreaContext].\n\n\
 Requesting the height for width (or width for height) of an area is\n\
 a similar task except in this case the [GtkCellAreaContext] does not\n\
 store the data (actually, it does not know how much space the layouting\n\
 widget plans to allocate it for every row. It’s up to the layouting\n\
 widget to render each row of data with the appropriate height and\n\
 width which was requested by the [GtkCellArea]).\n\n\
 In order to request the height for width of all the rows at the\n\
 root level of a [GtkTreeModel] one would do the following:\n\n\
 {[\n\
 GtkTreeIter iter;\n\
 int minimum_height;\n\
 int natural_height;\n\
 int full_minimum_height = 0;\n\
 int full_natural_height = 0;\n\n\
 valid = gtk_tree_model_get_iter_first (model, &iter);\n\
 while (valid)\n\
\  {\n\
\    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
\    gtk_cell_area_get_preferred_height_for_width (area, context, widget,\n\
\                                                  width, &minimum_height, \
 &natural_height);\n\n\
\    if (width_is_for_allocation)\n\
\       cache_row_height (&iter, minimum_height, natural_height);\n\n\
\    full_minimum_height += minimum_height;\n\
\    full_natural_height += natural_height;\n\n\
\    valid = gtk_tree_model_iter_next (model, &iter);\n\
\  }\n\
 ]}\n\n\
 Note that in the above example we would need to cache the heights\n\
 returned for each row so that we would know what sizes to render the\n\
 areas for each row. However we would only want to really cache the\n\
 heights if the request is intended for the layouting widgets real\n\
 allocation.\n\n\
 In some cases the layouting widget is requested the height for an\n\
 arbitrary for_width, this is a special case for layouting widgets\n\
 who need to request size for tens of thousands  of rows. For this\n\
 case it’s only important that the layouting widget calculate\n\
 one reasonably sized chunk of rows and return that height\n\
 synchronously. The reasoning here is that any layouting widget is\n\
 at least capable of synchronously calculating enough height to fill\n\
 the screen height (or scrolled window height) in response to a single\n\
 call to [Gtk.Widget.measure]. Returning\n\
 a perfect height for width that is larger than the screen area is\n\
 inconsequential since after the layouting receives an allocation\n\
 from a scrolled window it simply continues to drive the scrollbar\n\
 values while more and more height is required for the row heights\n\
 that are calculated in the background.\n\n\
 {b Rendering Areas}\n\n\
 Once area sizes have been acquired at least for the rows in the\n\
 visible area of the layouting widget they can be rendered at\n\
 [Gtk.Widget.snapshot] time.\n\n\
 A crude example of how to render all the rows at the root level\n\
 runs as follows:\n\n\
 {[\n\
 GtkAllocation allocation;\n\
 GdkRectangle cell_area = { 0, };\n\
 GtkTreeIter iter;\n\
 int minimum_width;\n\
 int natural_width;\n\n\
 gtk_widget_get_allocation (widget, &allocation);\n\
 cell_area.width = allocation.width;\n\n\
 valid = gtk_tree_model_get_iter_first (model, &iter);\n\
 while (valid)\n\
\  {\n\
\    cell_area.height = get_cached_height_for_row (&iter);\n\n\
\    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
\    gtk_cell_area_render (area, context, widget, cr,\n\
\                          &cell_area, &cell_area, state_flags, FALSE);\n\n\
\    cell_area.y += cell_area.height;\n\n\
\    valid = gtk_tree_model_iter_next (model, &iter);\n\
\  }\n\
 ]}\n\n\
 Note that the cached height in this example really depends on how\n\
 the layouting widget works. The layouting widget might decide to\n\
 give every row its minimum or natural height or, if the model content\n\
 is expected to fit inside the layouting widget without scrolling, it\n\
 would make sense to calculate the allocation for each row at\n\
 the time the widget is allocated using [Gtk.distribute_natural_allocation].\n\n\
 {b Handling Events and Driving Keyboard Focus}\n\n\
 Passing events to the area is as simple as handling events on any\n\
 normal widget and then passing them to the [Gtk.CellArea.event]\n\
 API as they come in. Usually [GtkCellArea] is only interested in\n\
 button events, however some customized derived areas can be implemented\n\
 who are interested in handling other events. Handling an event can\n\
 trigger the [Gtk.CellArea::focus-changed] signal to fire; as well\n\
 as [Gtk.CellArea::add-editable] in the case that an editable cell\n\
 was clicked and needs to start editing. You can call\n\
 [Gtk.CellArea.stop_editing] at any time to cancel any cell editing\n\
 that is currently in progress.\n\n\
 The [GtkCellArea] drives keyboard focus from cell to cell in a way\n\
 similar to [GtkWidget]. For layouting widgets that support giving\n\
 focus to cells it’s important to remember to pass [GTK_CELL_RENDERER_FOCUSED]\n\
 to the area functions for the row that has focus and to tell the\n\
 area to paint the focus at render time.\n\n\
 Layouting widgets that accept focus on cells should implement the\n\
 [Gtk.Widget.focus] virtual method. The layouting widget is always\n\
 responsible for knowing where [GtkTreeModel] rows are rendered inside\n\
 the widget, so at [Gtk.Widget.focus] time the layouting widget\n\
 should use the [GtkCellArea] methods to navigate focus inside the area\n\
 and then observe the [Gtk.DirectionType] to pass the focus to adjacent\n\
 rows and areas.\n\n\
 A basic example of how the [Gtk.Widget.focus] virtual method\n\
 should be implemented:\n\n\
 {[\n\
 static gboolean\n\
 foo_focus (GtkWidget       *widget,\n\
\           GtkDirectionType direction)\n\
 {\n\
\  Foo *self = FOO (widget);\n\
\  FooPrivate *priv = foo_get_instance_private (self);\n\
\  int focus_row = priv->focus_row;\n\
\  gboolean have_focus = FALSE;\n\n\
\  if (!gtk_widget_has_focus (widget))\n\
\    gtk_widget_grab_focus (widget);\n\n\
\  valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, \
 priv->focus_row);\n\
\  while (valid)\n\
\    {\n\
\      gtk_cell_area_apply_attributes (priv->area, priv->model, &iter, FALSE, \
 FALSE);\n\n\
\      if (gtk_cell_area_focus (priv->area, direction))\n\
\        {\n\
\           priv->focus_row = focus_row;\n\
\           have_focus = TRUE;\n\
\           break;\n\
\        }\n\
\      else\n\
\        {\n\
\          if (direction == GTK_DIR_RIGHT ||\n\
\              direction == GTK_DIR_LEFT)\n\
\            break;\n\
\          else if (direction == GTK_DIR_UP ||\n\
\                   direction == GTK_DIR_TAB_BACKWARD)\n\
\           {\n\
\              if (focus_row == 0)\n\
\                break;\n\
\              else\n\
\               {\n\
\                  focus_row--;\n\
\                  valid = gtk_tree_model_iter_nth_child (priv->model, &iter, \
 NULL, focus_row);\n\
\               }\n\
\            }\n\
\          else\n\
\            {\n\
\              if (focus_row == last_row)\n\
\                break;\n\
\              else\n\
\                {\n\
\                  focus_row++;\n\
\                  valid = gtk_tree_model_iter_next (priv->model, &iter);\n\
\                }\n\
\            }\n\
\        }\n\
\    }\n\
\    return have_focus;\n\
 }\n\
 ]}\n\n\
 Note that the layouting widget is responsible for matching the\n\
 [GtkDirectionType] values to the way it lays out its cells.\n\n\
 {b Cell Properties}\n\n\
 The [GtkCellArea] introduces cell properties for [GtkCellRenderer]s.\n\
 This provides some general interfaces for defining the relationship\n\
 cell areas have with their cells. For instance in a [Gtk.CellAreaBox]\n\
 a cell might “expand” and receive extra space when the area is allocated\n\
 more than its full natural request, or a cell might be configured to “align”\n\
 with adjacent rows which were requested and rendered with the same\n\
 [GtkCellAreaContext].\n\n\
 Use [Gtk.CellAreaClass.install_cell_property] to install cell\n\
 properties for a cell area class and [Gtk.CellAreaClass.find_cell_property]\n\
 or [Gtk.CellAreaClass.list_cell_properties] to get information about\n\
 existing cell properties.\n\n\
 To set the value of a cell property, use [Gtk.CellArea.cell_set_property],\n\
 [Gtk.CellArea.cell_set] or [Gtk.CellArea.cell_set_valist]. To obtain\n\
 the value of a cell property, use [Gtk.CellArea.cell_get_property]\n\
 [Gtk.CellArea.cell_get] or [Gtk.CellArea.cell_get_valist].\n\n\
 Its methods, signals and properties are on {!class-type-cell_area_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Cell_area}."]

class type cell_area_t =
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_t
  [@@ocaml.doc
    "{b The methods, signals and properties of a [CellArea].}\n\n\
     An abstract class for laying out [GtkCellRenderer]s\n\n\
     The [GtkCellArea] is an abstract class for [Gtk.CellLayout]\n\
     widgets (also referred to as \"layouting widgets\") to interface with\n\
     an arbitrary number of [Gtk.CellRenderer]s and interact with the user\n\
     for a given [Gtk.TreeModel] row.\n\n\
     The cell area handles events, focus navigation, drawing and\n\
     size requests and allocations for a given row of data.\n\n\
     Usually users dont have to interact with the [GtkCellArea] directly\n\
     unless they are implementing a cell-layouting widget themselves.\n\n\
     {b Requesting area sizes}\n\n\
     As outlined in\n\
     GtkWidget’s geometry management section,\n\
     GTK uses a height-for-width\n\
     geometry management system to compute the sizes of widgets and user\n\
     interfaces. [GtkCellArea] uses the same semantics to calculate the\n\
     size of an area for an arbitrary number of [GtkTreeModel] rows.\n\n\
     When requesting the size of a cell area one needs to calculate\n\
     the size for a handful of rows, and this will be done differently by\n\
     different layouting widgets. For instance a [Gtk.TreeViewColumn]\n\
     always lines up the areas from top to bottom while a [Gtk.IconView]\n\
     on the other hand might enforce that all areas received the same\n\
     width and wrap the areas around, requesting height for more cell\n\
     areas when allocated less width.\n\n\
     It’s also important for areas to maintain some cell\n\
     alignments with areas rendered for adjacent rows (cells can\n\
     appear “columnized” inside an area even when the size of\n\
     cells are different in each row). For this reason the [GtkCellArea]\n\
     uses a [Gtk.CellAreaContext] object to store the alignments\n\
     and sizes along the way (as well as the overall largest minimum\n\
     and natural size for all the rows which have been calculated\n\
     with the said context).\n\n\
     The [Gtk.CellAreaContext] is an opaque object specific to the\n\
     [GtkCellArea] which created it (see [Gtk.CellArea.create_context]).\n\n\
     The owning cell-layouting widget can create as many contexts as\n\
     it wishes to calculate sizes of rows which should receive the\n\
     same size in at least one orientation (horizontally or vertically),\n\
     However, it’s important that the same [Gtk.CellAreaContext] which\n\
     was used to request the sizes for a given [GtkTreeModel] row be\n\
     used when rendering or processing events for that row.\n\n\
     In order to request the width of all the rows at the root level\n\
     of a [GtkTreeModel] one would do the following:\n\n\
     {[\n\
     GtkTreeIter iter;\n\
     int minimum_width;\n\
     int natural_width;\n\n\
     valid = gtk_tree_model_get_iter_first (model, &iter);\n\
     while (valid)\n\
    \  {\n\
    \    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
    \    gtk_cell_area_get_preferred_width (area, context, widget, NULL, \
     NULL);\n\n\
    \    valid = gtk_tree_model_iter_next (model, &iter);\n\
    \  }\n\n\
     gtk_cell_area_context_get_preferred_width (context, &minimum_width, \
     &natural_width);\n\
     ]}\n\n\
     Note that in this example it’s not important to observe the\n\
     returned minimum and natural width of the area for each row\n\
     unless the cell-layouting object is actually interested in the\n\
     widths of individual rows. The overall width is however stored\n\
     in the accompanying [GtkCellAreaContext] object and can be consulted\n\
     at any time.\n\n\
     This can be useful since [GtkCellLayout] widgets usually have to\n\
     support requesting and rendering rows in treemodels with an\n\
     exceedingly large amount of rows. The [GtkCellLayout] widget in\n\
     that case would calculate the required width of the rows in an\n\
     idle or timeout source (see [GLib.timeout_add]) and when the widget\n\
     is requested its actual width in [Gtk.Widget.measure]\n\
     it can simply consult the width accumulated so far in the\n\
     [GtkCellAreaContext] object.\n\n\
     A simple example where rows are rendered from top to bottom and\n\
     take up the full width of the layouting widget would look like:\n\n\
     {[\n\
     static void\n\
     foo_get_preferred_width (GtkWidget *widget,\n\
    \                         int       *minimum_size,\n\
    \                         int       *natural_size)\n\
     {\n\
    \  Foo *self = FOO (widget);\n\
    \  FooPrivate *priv = foo_get_instance_private (self);\n\n\
    \  foo_ensure_at_least_one_handfull_of_rows_have_been_requested (self);\n\n\
    \  gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, \
     natural_size);\n\
     }\n\
     ]}\n\n\
     In the above example the [Foo] widget has to make sure that some\n\
     row sizes have been calculated (the amount of rows that [Foo] judged\n\
     was appropriate to request space for in a single timeout iteration)\n\
     before simply returning the amount of space required by the area via\n\
     the [GtkCellAreaContext].\n\n\
     Requesting the height for width (or width for height) of an area is\n\
     a similar task except in this case the [GtkCellAreaContext] does not\n\
     store the data (actually, it does not know how much space the layouting\n\
     widget plans to allocate it for every row. It’s up to the layouting\n\
     widget to render each row of data with the appropriate height and\n\
     width which was requested by the [GtkCellArea]).\n\n\
     In order to request the height for width of all the rows at the\n\
     root level of a [GtkTreeModel] one would do the following:\n\n\
     {[\n\
     GtkTreeIter iter;\n\
     int minimum_height;\n\
     int natural_height;\n\
     int full_minimum_height = 0;\n\
     int full_natural_height = 0;\n\n\
     valid = gtk_tree_model_get_iter_first (model, &iter);\n\
     while (valid)\n\
    \  {\n\
    \    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
    \    gtk_cell_area_get_preferred_height_for_width (area, context, widget,\n\
    \                                                  width, &minimum_height, \
     &natural_height);\n\n\
    \    if (width_is_for_allocation)\n\
    \       cache_row_height (&iter, minimum_height, natural_height);\n\n\
    \    full_minimum_height += minimum_height;\n\
    \    full_natural_height += natural_height;\n\n\
    \    valid = gtk_tree_model_iter_next (model, &iter);\n\
    \  }\n\
     ]}\n\n\
     Note that in the above example we would need to cache the heights\n\
     returned for each row so that we would know what sizes to render the\n\
     areas for each row. However we would only want to really cache the\n\
     heights if the request is intended for the layouting widgets real\n\
     allocation.\n\n\
     In some cases the layouting widget is requested the height for an\n\
     arbitrary for_width, this is a special case for layouting widgets\n\
     who need to request size for tens of thousands  of rows. For this\n\
     case it’s only important that the layouting widget calculate\n\
     one reasonably sized chunk of rows and return that height\n\
     synchronously. The reasoning here is that any layouting widget is\n\
     at least capable of synchronously calculating enough height to fill\n\
     the screen height (or scrolled window height) in response to a single\n\
     call to [Gtk.Widget.measure]. Returning\n\
     a perfect height for width that is larger than the screen area is\n\
     inconsequential since after the layouting receives an allocation\n\
     from a scrolled window it simply continues to drive the scrollbar\n\
     values while more and more height is required for the row heights\n\
     that are calculated in the background.\n\n\
     {b Rendering Areas}\n\n\
     Once area sizes have been acquired at least for the rows in the\n\
     visible area of the layouting widget they can be rendered at\n\
     [Gtk.Widget.snapshot] time.\n\n\
     A crude example of how to render all the rows at the root level\n\
     runs as follows:\n\n\
     {[\n\
     GtkAllocation allocation;\n\
     GdkRectangle cell_area = { 0, };\n\
     GtkTreeIter iter;\n\
     int minimum_width;\n\
     int natural_width;\n\n\
     gtk_widget_get_allocation (widget, &allocation);\n\
     cell_area.width = allocation.width;\n\n\
     valid = gtk_tree_model_get_iter_first (model, &iter);\n\
     while (valid)\n\
    \  {\n\
    \    cell_area.height = get_cached_height_for_row (&iter);\n\n\
    \    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
    \    gtk_cell_area_render (area, context, widget, cr,\n\
    \                          &cell_area, &cell_area, state_flags, FALSE);\n\n\
    \    cell_area.y += cell_area.height;\n\n\
    \    valid = gtk_tree_model_iter_next (model, &iter);\n\
    \  }\n\
     ]}\n\n\
     Note that the cached height in this example really depends on how\n\
     the layouting widget works. The layouting widget might decide to\n\
     give every row its minimum or natural height or, if the model content\n\
     is expected to fit inside the layouting widget without scrolling, it\n\
     would make sense to calculate the allocation for each row at\n\
     the time the widget is allocated using \
     [Gtk.distribute_natural_allocation].\n\n\
     {b Handling Events and Driving Keyboard Focus}\n\n\
     Passing events to the area is as simple as handling events on any\n\
     normal widget and then passing them to the [Gtk.CellArea.event]\n\
     API as they come in. Usually [GtkCellArea] is only interested in\n\
     button events, however some customized derived areas can be implemented\n\
     who are interested in handling other events. Handling an event can\n\
     trigger the [Gtk.CellArea::focus-changed] signal to fire; as well\n\
     as [Gtk.CellArea::add-editable] in the case that an editable cell\n\
     was clicked and needs to start editing. You can call\n\
     [Gtk.CellArea.stop_editing] at any time to cancel any cell editing\n\
     that is currently in progress.\n\n\
     The [GtkCellArea] drives keyboard focus from cell to cell in a way\n\
     similar to [GtkWidget]. For layouting widgets that support giving\n\
     focus to cells it’s important to remember to pass \
     [GTK_CELL_RENDERER_FOCUSED]\n\
     to the area functions for the row that has focus and to tell the\n\
     area to paint the focus at render time.\n\n\
     Layouting widgets that accept focus on cells should implement the\n\
     [Gtk.Widget.focus] virtual method. The layouting widget is always\n\
     responsible for knowing where [GtkTreeModel] rows are rendered inside\n\
     the widget, so at [Gtk.Widget.focus] time the layouting widget\n\
     should use the [GtkCellArea] methods to navigate focus inside the area\n\
     and then observe the [Gtk.DirectionType] to pass the focus to adjacent\n\
     rows and areas.\n\n\
     A basic example of how the [Gtk.Widget.focus] virtual method\n\
     should be implemented:\n\n\
     {[\n\
     static gboolean\n\
     foo_focus (GtkWidget       *widget,\n\
    \           GtkDirectionType direction)\n\
     {\n\
    \  Foo *self = FOO (widget);\n\
    \  FooPrivate *priv = foo_get_instance_private (self);\n\
    \  int focus_row = priv->focus_row;\n\
    \  gboolean have_focus = FALSE;\n\n\
    \  if (!gtk_widget_has_focus (widget))\n\
    \    gtk_widget_grab_focus (widget);\n\n\
    \  valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, \
     priv->focus_row);\n\
    \  while (valid)\n\
    \    {\n\
    \      gtk_cell_area_apply_attributes (priv->area, priv->model, &iter, \
     FALSE, FALSE);\n\n\
    \      if (gtk_cell_area_focus (priv->area, direction))\n\
    \        {\n\
    \           priv->focus_row = focus_row;\n\
    \           have_focus = TRUE;\n\
    \           break;\n\
    \        }\n\
    \      else\n\
    \        {\n\
    \          if (direction == GTK_DIR_RIGHT ||\n\
    \              direction == GTK_DIR_LEFT)\n\
    \            break;\n\
    \          else if (direction == GTK_DIR_UP ||\n\
    \                   direction == GTK_DIR_TAB_BACKWARD)\n\
    \           {\n\
    \              if (focus_row == 0)\n\
    \                break;\n\
    \              else\n\
    \               {\n\
    \                  focus_row--;\n\
    \                  valid = gtk_tree_model_iter_nth_child (priv->model, \
     &iter, NULL, focus_row);\n\
    \               }\n\
    \            }\n\
    \          else\n\
    \            {\n\
    \              if (focus_row == last_row)\n\
    \                break;\n\
    \              else\n\
    \                {\n\
    \                  focus_row++;\n\
    \                  valid = gtk_tree_model_iter_next (priv->model, &iter);\n\
    \                }\n\
    \            }\n\
    \        }\n\
    \    }\n\
    \    return have_focus;\n\
     }\n\
     ]}\n\n\
     Note that the layouting widget is responsible for matching the\n\
     [GtkDirectionType] values to the way it lays out its cells.\n\n\
     {b Cell Properties}\n\n\
     The [GtkCellArea] introduces cell properties for [GtkCellRenderer]s.\n\
     This provides some general interfaces for defining the relationship\n\
     cell areas have with their cells. For instance in a [Gtk.CellAreaBox]\n\
     a cell might “expand” and receive extra space when the area is allocated\n\
     more than its full natural request, or a cell might be configured to \
     “align”\n\
     with adjacent rows which were requested and rendered with the same\n\
     [GtkCellAreaContext].\n\n\
     Use [Gtk.CellAreaClass.install_cell_property] to install cell\n\
     properties for a cell area class and [Gtk.CellAreaClass.find_cell_property]\n\
     or [Gtk.CellAreaClass.list_cell_properties] to get information about\n\
     existing cell properties.\n\n\
     To set the value of a cell property, use [Gtk.CellArea.cell_set_property],\n\
     [Gtk.CellArea.cell_set] or [Gtk.CellArea.cell_set_valist]. To obtain\n\
     the value of a cell property, use [Gtk.CellArea.cell_get_property]\n\
     [Gtk.CellArea.cell_get] or [Gtk.CellArea.cell_get_valist]."]

class cell_area : Raw.Cell_area.t -> cell_area_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_area.t}. *)
