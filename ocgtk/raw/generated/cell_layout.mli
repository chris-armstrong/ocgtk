(* GENERATED CODE - DO NOT EDIT *)
(* CellLayout, a member of the cyclic module Cell_area_and__cell_area_context_and__cell_layout *)

[@@@ocaml.text
"An interface for packing cells\n\n\
 [GtkCellLayout] is an interface to be implemented by all objects which\n\
 want to provide a [GtkTreeViewColumn] like API for packing cells,\n\
 setting attributes and data funcs.\n\n\
 One of the notable features provided by implementations of\n\
 [GtkCellLayout] are attributes. Attributes let you set the properties\n\
 in flexible ways. They can just be set to constant values like regular\n\
 properties. But they can also be mapped to a column of the underlying\n\
 tree model with [gtk_cell_layout_set_attributes ()], which means that the value\n\
 of the attribute can change from cell to cell as they are rendered by\n\
 the cell renderer. Finally, it is possible to specify a function with\n\
 [gtk_cell_layout_set_cell_data_func ()] that is called to determine the\n\
 value of the attribute for each cell that is rendered.\n\n\
 {b GtkCellLayouts as GtkBuildable}\n\n\
 Implementations of GtkCellLayout which also implement the GtkBuildable\n\
 interface ([GtkCellView], [GtkIconView], [GtkComboBox],\n\
 [GtkEntryCompletion], [GtkTreeViewColumn]) accept [GtkCellRenderer] objects\n\
 as [<child>] elements in UI definitions. They support a custom [<attributes>]\n\
 element for their children, which can contain multiple [<attribute>]\n\
 elements. Each [<attribute>] element has a name attribute which specifies\n\
 a property of the cell renderer; the content of the element is the\n\
 attribute value.\n\n\
 This is an example of a UI definition fragment specifying attributes:\n\n\
 {[\n\
 <object class=\"GtkCellView\">\n\
\  <child>\n\
\    <object class=\"GtkCellRendererText\"/>\n\
\    <attributes>\n\
\      <attribute name=\"text\">0</attribute>\n\
\    </attributes>\n\
\  </child>\n\
 </object>\n\
 ]}\n\n\
 Furthermore for implementations of [GtkCellLayout] that use a [GtkCellArea]\n\
 to lay out cells (all [GtkCellLayout]s in GTK use a [GtkCellArea])\n\
 cell properties can also be defined\n\
 in the format by specifying the custom [<cell-packing>] attribute which can\n\
 contain multiple [<property>] elements.\n\n\
 Here is a UI definition fragment specifying cell properties:\n\n\
 {[\n\
 <object class=\"GtkTreeViewColumn\">\n\
\  <child>\n\
\    <object class=\"GtkCellRendererText\"/>\n\
\    <cell-packing>\n\
\      <property name=\"align\">True</property>\n\
\      <property name=\"expand\">False</property>\n\
\    </cell-packing>\n\
\  </child>\n\
 </object>\n\
 ]}\n\n\
 {b Subclassing GtkCellLayout implementations}\n\n\
 When subclassing a widget that implements [GtkCellLayout] like\n\
 [GtkIconView] or [GtkComboBox], there are some considerations related\n\
 to the fact that these widgets internally use a [GtkCellArea].\n\
 The cell area is exposed as a construct-only property by these\n\
 widgets. This means that it is possible to e.g. do\n\n\
 {[\n\
 GtkWIdget *combo =\n\
\  g_object_new (GTK_TYPE_COMBO_BOX, \"cell-area\", my_cell_area, NULL);\n\
 ]}\n\n\
 to use a custom cell area with a combo box. But construct properties\n\
 are only initialized after instance [init()]\n\
 functions have run, which means that using functions which rely on\n\
 the existence of the cell area in your subclass [init()] function will\n\
 cause the default cell area to be instantiated. In this case, a provided\n\
 construct property value will be ignored (with a warning, to alert\n\
 you to the problem).\n\n\
 {[\n\
 static void\n\
 my_combo_box_init (MyComboBox *b)\n\
 {\n\
\  GtkCellRenderer *cell;\n\n\
\  cell = gtk_cell_renderer_pixbuf_new ();\n\n\
\  // The following call causes the default cell area for combo boxes,\n\
\  // a GtkCellAreaBox, to be instantiated\n\
\  gtk_cell_layout_pack_start (GTK_CELL_LAYOUT (b), cell, FALSE);\n\
\  ...\n\
 }\n\n\
 GtkWidget *\n\
 my_combo_box_new (GtkCellArea *area)\n\
 {\n\
\  // This call is going to cause a warning about area being ignored\n\
\  return g_object_new (MY_TYPE_COMBO_BOX, \"cell-area\", area, NULL);\n\
 }\n\
 ]}\n\n\
 If supporting alternative cell areas with your derived widget is\n\
 not important, then this does not have to concern you. If you want\n\
 to support alternative cell areas, you can do so by moving the\n\
 problematic calls out of [init()] and into a [constructor()]\n\
 for your class.\n\n\
 The class built on this module is in {!Ocgtk.Cell_layout}."]

include module type of struct
  include Cell_area_and__cell_area_context_and__cell_layout.Cell_layout
end
