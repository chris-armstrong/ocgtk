(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for LayoutManager from cyclic group Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** Handles the preferred size and allocation for children of a widget.

    Its methods, signals and properties are on {!class-type-layout_manager_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Layout_manager}. *)

(** {1:class Class} *)

class type layout_manager_t =
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .layout_manager_t
  [@@ocaml.doc
    "{b The methods, signals and properties of a [LayoutManager].}\n\n\
     Inherits from: [GObject.Object]\n\n\
     Handles the preferred size and allocation for children of a widget.\n\n\
     You typically subclass [GtkLayoutManager] if you want to implement a\n\
     layout policy for the children of a widget, or if you want to determine\n\
     the size of a widget depending on its contents.\n\n\
     Each [GtkWidget] can only have a [GtkLayoutManager] instance associated\n\
     to it at any given time; it is possible, though, to replace the layout\n\
     manager instance using [Gtk.Widget.set_layout_manager].\n\n\
     {b Layout properties}\n\n\
     A layout manager can expose properties for controlling the layout of\n\
     each child, by creating an object type derived from [Gtk.LayoutChild]\n\
     and installing the properties on it as normal [GObject] properties.\n\n\
     Each [GtkLayoutChild] instance storing the layout properties for a\n\
     specific child is created through the [Gtk.LayoutManager.get_layout_child]\n\
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
     The [Gtk.LayoutChild:layout-manager] and\n\
     [Gtk.LayoutChild:child-widget] properties\n\
     on the newly created [GtkLayoutChild] instance are mandatory. The\n\
     [GtkLayoutManager] will cache the newly created [GtkLayoutChild] instance\n\
     until the widget is removed from its parent, or the parent removes the\n\
     layout manager.\n\n\
     Each [GtkLayoutManager] instance creating a [GtkLayoutChild] should use\n\
     [Gtk.LayoutManager.get_layout_child] every time it needs to query\n\
     the layout properties; each [GtkLayoutChild] instance should call\n\
     [Gtk.LayoutManager.layout_changed] every time a property is\n\
     updated, in order to queue a new size measuring and allocation."]

class layout_manager : Raw.Layout_manager.t -> layout_manager_t
(** Wraps a raw handle of {!Ocgtk.Raw.Layout_manager.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Handles the preferred size and allocation for children of a widget.\n\n\
 You typically subclass [GtkLayoutManager] if you want to implement a\n\
 layout policy for the children of a widget, or if you want to determine\n\
 the size of a widget depending on its contents.\n\n\
 Each [GtkWidget] can only have a [GtkLayoutManager] instance associated\n\
 to it at any given time; it is possible, though, to replace the layout\n\
 manager instance using [Gtk.Widget.set_layout_manager].\n\n\
 {b Layout properties}\n\n\
 A layout manager can expose properties for controlling the layout of\n\
 each child, by creating an object type derived from [Gtk.LayoutChild]\n\
 and installing the properties on it as normal [GObject] properties.\n\n\
 Each [GtkLayoutChild] instance storing the layout properties for a\n\
 specific child is created through the [Gtk.LayoutManager.get_layout_child]\n\
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
 The [Gtk.LayoutChild:layout-manager] and\n\
 [Gtk.LayoutChild:child-widget] properties\n\
 on the newly created [GtkLayoutChild] instance are mandatory. The\n\
 [GtkLayoutManager] will cache the newly created [GtkLayoutChild] instance\n\
 until the widget is removed from its parent, or the parent removes the\n\
 layout manager.\n\n\
 Each [GtkLayoutManager] instance creating a [GtkLayoutChild] should use\n\
 [Gtk.LayoutManager.get_layout_child] every time it needs to query\n\
 the layout properties; each [GtkLayoutChild] instance should call\n\
 [Gtk.LayoutManager.layout_changed] every time a property is\n\
 updated, in order to queue a new size measuring and allocation."]
