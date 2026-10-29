(* GENERATED CODE - DO NOT EDIT *)
(* LayoutManager, a member of the cyclic module Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

[@@@ocaml.text
"Handles the preferred size and allocation for children of a widget.\n\n\
 You typically subclass [GtkLayoutManager] if you want to implement a\n\
 layout policy for the children of a widget, or if you want to determine\n\
 the size of a widget depending on its contents.\n\n\
 Each [GtkWidget] can only have a [GtkLayoutManager] instance associated\n\
 to it at any given time; it is possible, though, to replace the layout\n\
 manager instance using \
 {{!Ocgtk.Raw.Widget.val-set_layout_manager}[Gtk.Widget.set_layout_manager]}.\n\n\
 {b Layout properties}\n\n\
 A layout manager can expose properties for controlling the layout of\n\
 each child, by creating an object type derived from \
 {{!Ocgtk.Raw.Layout_child}[Gtk.LayoutChild]}\n\
 and installing the properties on it as normal [GObject] properties.\n\n\
 Each [GtkLayoutChild] instance storing the layout properties for a\n\
 specific child is created through the \
 {{!Ocgtk.Raw.Layout_manager.val-get_layout_child}[Gtk.LayoutManager.get_layout_child]}\n\
 method; a [GtkLayoutManager] controls the creation of its [GtkLayoutChild]\n\
 instances by overriding the GtkLayoutManagerClass.create_layout_child()\n\
 virtual function. The typical implementation should look like:\n\n\
 {[\n\
 static GtkLayoutChild *\n\
 create_layout_child (GtkLayoutManager *manager,\n\
\                     GtkWidget        *container,\n\
\                     GtkWidget        *child)\n\
 {\n\
\  return g_object_new (your_layout_child_get_type (),\n\
\                       \"layout-manager\", manager,\n\
\                       \"child-widget\", child,\n\
\                       NULL);\n\
 }\n\
 ]}\n\n\
 The \
 {{!Ocgtk.Raw.Layout_child.val-get_layout_manager}[Gtk.LayoutChild:layout-manager]} \
 and\n\
 {{!Ocgtk.Raw.Layout_child.val-get_child_widget}[Gtk.LayoutChild:child-widget]} \
 properties\n\
 on the newly created [GtkLayoutChild] instance are mandatory. The\n\
 [GtkLayoutManager] will cache the newly created [GtkLayoutChild] instance\n\
 until the widget is removed from its parent, or the parent removes the\n\
 layout manager.\n\n\
 Each [GtkLayoutManager] instance creating a [GtkLayoutChild] should use\n\
 {{!Ocgtk.Raw.Layout_manager.val-get_layout_child}[Gtk.LayoutManager.get_layout_child]} \
 every time it needs to query\n\
 the layout properties; each [GtkLayoutChild] instance should call\n\
 {{!Ocgtk.Raw.Layout_manager.val-layout_changed}[Gtk.LayoutManager.layout_changed]} \
 every time a property is\n\
 updated, in order to queue a new size measuring and allocation.\n\n\
 The class built on this module is in {!Ocgtk.Layout_manager}."]

include module type of struct
  include
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .Layout_manager
end
