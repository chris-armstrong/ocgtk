(* GENERATED CODE - DO NOT EDIT *)
(* ListView: ListView *)

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
 items use the [Gtk.AccessibleRole.list_item] role."]

type t =
  [ `list_view | `list_base | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external new_ : Selection_model.t option -> List_item_factory.t option -> t
  = "ml_gtk_list_view_new"
(** Create a new ListView *)

(* Methods *)

external set_tab_behavior : t -> Gtk_enums.listtabbehavior -> unit
  = "ml_gtk_list_view_set_tab_behavior"
(** Sets the <kbd>Tab</kbd> key behavior.

    This influences how the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd>
    keys move the focus in the listview. *)

external set_single_click_activate : t -> bool -> unit
  = "ml_gtk_list_view_set_single_click_activate"
(** Sets whether rows should be activated on single click and selected on hover.
*)

external set_show_separators : t -> bool -> unit
  = "ml_gtk_list_view_set_show_separators"
(** Sets whether the listview should show separators between rows. *)

external set_model : t -> Selection_model.t option -> unit
  = "ml_gtk_list_view_set_model"
(** Sets the model to use.

    This must be a [Gtk.SelectionModel] to use. *)

external set_header_factory : t -> List_item_factory.t option -> unit
  = "ml_gtk_list_view_set_header_factory"
(** Sets the [GtkListItemFactory] to use for populating the [Gtk.ListHeader]
    objects used in section headers.

    If this factory is set to [NULL], the list will not show section headers. *)

external set_factory : t -> List_item_factory.t option -> unit
  = "ml_gtk_list_view_set_factory"
(** Sets the [GtkListItemFactory] to use for populating list items. *)

external set_enable_rubberband : t -> bool -> unit
  = "ml_gtk_list_view_set_enable_rubberband"
(** Sets whether selections can be changed by dragging with the mouse. *)

external scroll_to :
  t -> int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit
  = "ml_gtk_list_view_scroll_to"
(** Scrolls to the item at the given position and performs the actions specified
    in [flags].

    This function works no matter if the listview is shown or focused. If it
    isn't, then the changes will take effect once that happens. *)

external get_tab_behavior : t -> Gtk_enums.listtabbehavior
  = "ml_gtk_list_view_get_tab_behavior"
(** Gets the behavior set for the <kbd>Tab</kbd> key. *)

external get_single_click_activate : t -> bool
  = "ml_gtk_list_view_get_single_click_activate"
(** Returns whether rows will be activated on single click and selected on
    hover. *)

external get_show_separators : t -> bool
  = "ml_gtk_list_view_get_show_separators"
(** Returns whether the listview should show separators between rows. *)

external get_model : t -> Selection_model.t option
  = "ml_gtk_list_view_get_model"
(** Gets the model that's currently used to read the items displayed. *)

external get_header_factory : t -> List_item_factory.t option
  = "ml_gtk_list_view_get_header_factory"
(** Gets the factory that's currently used to populate section headers. *)

external get_factory : t -> List_item_factory.t option
  = "ml_gtk_list_view_get_factory"
(** Gets the factory that's currently used to populate list items. *)

external get_enable_rubberband : t -> bool
  = "ml_gtk_list_view_get_enable_rubberband"
(** Returns whether rows can be selected by dragging with the mouse. *)

(* Properties *)

val on_activate :
  ?after:bool ->
  t ->
  callback:(position:int -> unit) ->
  Gobject.Signal.handler_id
