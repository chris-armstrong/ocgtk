[@@@ocaml.text
"Presents a large dynamic list of items.\n\n\
 [GtkListView] uses its factory to generate one row widget for each visible\n\
 item and shows them in a linear display, either vertically or horizontally.\n\n\
 The [Gtk.ListView:show-separators] property offers a simple way to\n\
 display separators between the rows.\n\n\
 [GtkListView] allows the user to select items according to the selection\n\
 characteristics of the model. For models that allow multiple selected items,\n\
 it is possible to turn on _rubberband selection_, using\n\
 [Gtk.ListView:enable-rubberband].\n\n\
 If you need multiple columns with headers, see [Gtk.ColumnView].\n\n\
 To learn more about the list widget framework, see the\n\
 overview.\n\n\
 An example of using [GtkListView]:\n\n\
 {[\n\
 static void\n\
 setup_listitem_cb (GtkListItemFactory *factory,\n\
\                   GtkListItem        *list_item)\n\
 {\n\
\  GtkWidget *image;\n\n\
\  image = gtk_image_new ();\n\
\  gtk_image_set_icon_size (GTK_IMAGE (image), GTK_ICON_SIZE_LARGE);\n\
\  gtk_list_item_set_child (list_item, image);\n\
 }\n\n\
 static void\n\
 bind_listitem_cb (GtkListItemFactory *factory,\n\
\                  GtkListItem        *list_item)\n\
 {\n\
\  GtkWidget *image;\n\
\  GAppInfo *app_info;\n\n\
\  image = gtk_list_item_get_child (list_item);\n\
\  app_info = gtk_list_item_get_item (list_item);\n\
\  gtk_image_set_from_gicon (GTK_IMAGE (image), g_app_info_get_icon (app_info));\n\
 }\n\n\
 static void\n\
 activate_cb (GtkListView  *list,\n\
\             guint         position,\n\
\             gpointer      unused)\n\
 {\n\
\  GAppInfo *app_info;\n\n\
\  app_info = g_list_model_get_item (G_LIST_MODEL (gtk_list_view_get_model \
 (list)), position);\n\
\  g_app_info_launch (app_info, NULL, NULL, NULL);\n\
\  g_object_unref (app_info);\n\
 }\n\n\
 ...\n\n\
\  model = create_application_list ();\n\n\
\  factory = gtk_signal_list_item_factory_new ();\n\
\  g_signal_connect (factory, \"setup\", G_CALLBACK (setup_listitem_cb), NULL);\n\
\  g_signal_connect (factory, \"bind\", G_CALLBACK (bind_listitem_cb), NULL);\n\n\
\  list = gtk_list_view_new (GTK_SELECTION_MODEL (gtk_single_selection_new \
 (model)), factory);\n\n\
\  g_signal_connect (list, \"activate\", G_CALLBACK (activate_cb), NULL);\n\n\
\  gtk_scrolled_window_set_child (GTK_SCROLLED_WINDOW (sw), list);\n\
 ]}\n\n\
 {b Actions}\n\n\
 [GtkListView] defines a set of built-in actions:\n\n\
 - [list.activate-item] activates the item at given position by emitting\n\
 the [Gtk.ListView::activate] signal.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 listview[.separators][.rich-list][.navigation-sidebar][.data-table]\n\
 ├── row[.activatable]\n\
 │\n\
 ├── row[.activatable]\n\
 │\n\
 ┊\n\
 ╰── [rubberband]\n\
 ]}\n\n\
 [GtkListView] uses a single CSS node named [listview]. It may carry the\n\
 [.separators] style class, when [Gtk.ListView:show-separators]\n\
 property is set. Each child widget uses a single CSS node named [row].\n\
 If the [Gtk.ListItem:activatable] property is set, the\n\
 corresponding row will have the [.activatable] style class. For\n\
 rubberband selection, a node with name [rubberband] is used.\n\n\
 The main listview node may also carry style classes to select\n\
 the style of list presentation:\n\
 .rich-list, .navigation-sidebar or .data-table.\n\n\
 {b Accessibility}\n\n\
 [GtkListView] uses the [Gtk.AccessibleRole.list] role, and the list\n\
 items use the [Gtk.AccessibleRole.list_item] role.\n\n\
 Its methods, signals and properties are on {!class-type-list_view_t}. The \
 functions it is built on are in {!Ocgtk.Raw.List_view}."]

(** The methods, signals and properties of a [GtkListView]. *)
class type list_view_t = object
  inherit List_base.list_base_t

  method on_activate :
    ?after:bool ->
    callback:(position:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_enable_rubberband : unit -> bool
  method get_factory : unit -> List_item_factory.list_item_factory_t option

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option

  method get_model : unit -> Selection_model.selection_model_t option
  method get_show_separators : unit -> bool
  method get_single_click_activate : unit -> bool
  method get_tab_behavior : unit -> Enums.listtabbehavior

  method scroll_to :
    int -> Enums.listscrollflags -> Raw.Scroll_info.t option -> unit

  method set_enable_rubberband : bool -> unit
  method set_factory : List_item_factory.list_item_factory_t option -> unit

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit

  method set_model : Selection_model.selection_model_t option -> unit
  method set_show_separators : bool -> unit
  method set_single_click_activate : bool -> unit
  method set_tab_behavior : Enums.listtabbehavior -> unit
  method as_list_view : Raw.List_view.t
end

class list_view : Raw.List_view.t -> list_view_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.List_view.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkListView], give one already wrapped. *)

val new_ :
  Selection_model.selection_model_t option ->
  List_item_factory.list_item_factory_t option ->
  list_view_t
