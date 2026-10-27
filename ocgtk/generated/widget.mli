(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Widget from cyclic group Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

[@@@ocaml.text
"The base class for all widgets.\n\n\
 It manages the widget lifecycle, layout, states and style.\n\n\
 {b Height-for-width Geometry Management}\n\n\
 GTK uses a height-for-width (and width-for-height) geometry management\n\
 system. Height-for-width means that a widget can change how much\n\
 vertical space it needs, depending on the amount of horizontal space\n\
 that it is given (and similar for width-for-height). The most common\n\
 example is a label that reflows to fill up the available width, wraps\n\
 to fewer lines, and therefore needs less height.\n\n\
 Height-for-width geometry management is implemented in GTK by way\n\
 of two virtual methods:\n\n\
 - [Gtk.Widget.get_request_mode]\n\
 - [Gtk.Widget.measure]\n\n\
 There are some important things to keep in mind when implementing\n\
 height-for-width and when using it in widget implementations.\n\n\
 If you implement a direct [GtkWidget] subclass that supports\n\
 height-for-width or width-for-height geometry management for itself\n\
 or its child widgets, the [Gtk.Widget.get_request_mode] virtual\n\
 function must be implemented as well and return the widget's preferred\n\
 request mode. The default implementation of this virtual function\n\
 returns [GTK_SIZE_REQUEST_CONSTANT_SIZE], which means that the widget will\n\
 only ever get -1 passed as the for_size value to its\n\
 [Gtk.Widget.measure] implementation.\n\n\
 The geometry management system will query a widget hierarchy in\n\
 only one orientation at a time. When widgets are initially queried\n\
 for their minimum sizes it is generally done in two initial passes\n\
 in the [Gtk.SizeRequestMode] chosen by the toplevel.\n\n\
 For example, when queried in the normal [GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH] \
 mode:\n\n\
 First, the default minimum and natural width for each widget\n\
 in the interface will be computed using [Gtk.Widget.measure] with an\n\
 orientation of [GTK_ORIENTATION_HORIZONTAL] and a for_size of -1.\n\
 Because the preferred widths for each widget depend on the preferred\n\
 widths of their children, this information propagates up the hierarchy,\n\
 and finally a minimum and natural width is determined for the entire\n\
 toplevel. Next, the toplevel will use the minimum width to query for the\n\
 minimum height contextual to that width using [Gtk.Widget.measure] with an\n\
 orientation of [GTK_ORIENTATION_VERTICAL] and a for_size of the just computed\n\
 width. This will also be a highly recursive operation. The minimum height\n\
 for the minimum width is normally used to set the minimum size constraint\n\
 on the toplevel.\n\n\
 After the toplevel window has initially requested its size in both\n\
 dimensions it can go on to allocate itself a reasonable size (or a size\n\
 previously specified with [Gtk.Window.set_default_size]). During the\n\
 recursive allocation process it’s important to note that request cycles\n\
 will be recursively executed while widgets allocate their children.\n\
 Each widget, once allocated a size, will go on to first share the\n\
 space in one orientation among its children and then request each child's\n\
 height for its target allocated width or its width for allocated height,\n\
 depending. In this way a widget will typically be requested its size\n\
 a number of times before actually being allocated a size. The size a\n\
 widget is finally allocated can of course differ from the size it has\n\
 requested. For this reason, [GtkWidget] caches a  small number of results\n\
 to avoid re-querying for the same sizes in one allocation cycle.\n\n\
 If a widget does move content around to intelligently use up the\n\
 allocated size then it must support the request in both\n\
 [GtkSizeRequestMode]s even if the widget in question only\n\
 trades sizes in a single orientation.\n\n\
 For instance, a [Gtk.Label] that does height-for-width word wrapping\n\
 will not expect to have [Gtk.Widget.measure] with an orientation of\n\
 [GTK_ORIENTATION_VERTICAL] called because that call is specific to a\n\
 width-for-height request. In this case the label must return the height\n\
 required for its own minimum possible width. By following this rule any\n\
 widget that handles height-for-width or width-for-height requests will\n\
 always be allocated at least enough space to fit its own content.\n\n\
 Here are some examples of how a [GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH] widget\n\
 generally deals with width-for-height requests:\n\n\
 {[\n\
 static void\n\
 foo_widget_measure (GtkWidget      *widget,\n\
\                    GtkOrientation  orientation,\n\
\                    int             for_size,\n\
\                    int            *minimum_size,\n\
\                    int            *natural_size,\n\
\                    int            *minimum_baseline,\n\
\                    int            *natural_baseline)\n\
 {\n\
\  if (orientation == GTK_ORIENTATION_HORIZONTAL)\n\
\    {\n\
\      // Calculate minimum and natural width\n\
\    }\n\
\  else // VERTICAL\n\
\    {\n\
\      if (i_am_in_height_for_width_mode)\n\
\        {\n\
\          int min_width, dummy;\n\n\
\          // First, get the minimum width of our widget\n\
\          GTK_WIDGET_GET_CLASS (widget)->measure (widget, \
 GTK_ORIENTATION_HORIZONTAL, -1,\n\
\                                                  &min_width, &dummy, &dummy, \
 &dummy);\n\n\
\          // Now use the minimum width to retrieve the minimum and natural \
 height to display\n\
\          // that width.\n\
\          GTK_WIDGET_GET_CLASS (widget)->measure (widget, \
 GTK_ORIENTATION_VERTICAL, min_width,\n\
\                                                  minimum_size, natural_size, \
 &dummy, &dummy);\n\
\        }\n\
\      else\n\
\        {\n\
\          // ... some widgets do both.\n\
\        }\n\
\    }\n\
 }\n\
 ]}\n\n\
 Often a widget needs to get its own request during size request or\n\
 allocation. For example, when computing height it may need to also\n\
 compute width. Or when deciding how to use an allocation, the widget\n\
 may need to know its natural size. In these cases, the widget should\n\
 be careful to call its virtual methods directly, like in the code\n\
 example above.\n\n\
 It will not work to use the wrapper function [Gtk.Widget.measure]\n\
 inside your own [Gtk.Widget.size_allocate] implementation.\n\
 These return a request adjusted by [Gtk.SizeGroup], the widget's\n\
 align and expand flags, as well as its CSS style.\n\n\
 If a widget used the wrappers inside its virtual method implementations,\n\
 then the adjustments (such as widget margins) would be applied\n\
 twice. GTK therefore does not allow this and will warn if you try\n\
 to do it.\n\n\
 Of course if you are getting the size request for another widget, such\n\
 as a child widget, you must use [Gtk.Widget.measure]; otherwise, you\n\
 would not properly consider widget margins, [Gtk.SizeGroup], and\n\
 so forth.\n\n\
 GTK also supports baseline vertical alignment of widgets. This\n\
 means that widgets are positioned such that the typographical baseline of\n\
 widgets in the same row are aligned. This happens if a widget supports\n\
 baselines, has a vertical alignment using baselines, and is inside\n\
 a widget that supports baselines and has a natural “row” that it aligns to\n\
 the baseline, or a baseline assigned to it by the grandparent.\n\n\
 Baseline alignment support for a widget is also done by the\n\
 [Gtk.Widget.measure] virtual function. It allows you to report\n\
 both a minimum and natural size.\n\n\
 If a widget ends up baseline aligned it will be allocated all the space in\n\
 the parent as if it was [GTK_ALIGN_FILL], but the selected baseline can be\n\
 found via [Gtk.Widget.get_baseline]. If the baseline has a\n\
 value other than -1 you need to align the widget such that the baseline\n\
 appears at the position.\n\n\
 {b GtkWidget as GtkBuildable}\n\n\
 The [GtkWidget] implementation of the [GtkBuildable] interface\n\
 supports various custom elements to specify additional aspects of widgets\n\
 that are not directly expressed as properties.\n\n\
 If the widget uses a [Gtk.LayoutManager], [GtkWidget] supports\n\
 a custom [<layout>] element, used to define layout properties:\n\n\
 {[\n\
 <object class=\"GtkGrid\" id=\"my_grid\">\n\
\  <child>\n\
\    <object class=\"GtkLabel\" id=\"label1\">\n\
\      <property name=\"label\">Description</property>\n\
\      <layout>\n\
\        <property name=\"column\">0</property>\n\
\        <property name=\"row\">0</property>\n\
\        <property name=\"row-span\">1</property>\n\
\        <property name=\"column-span\">1</property>\n\
\      </layout>\n\
\    </object>\n\
\  </child>\n\
\  <child>\n\
\    <object class=\"GtkEntry\" id=\"description_entry\">\n\
\      <layout>\n\
\        <property name=\"column\">1</property>\n\
\        <property name=\"row\">0</property>\n\
\        <property name=\"row-span\">1</property>\n\
\        <property name=\"column-span\">1</property>\n\
\      </layout>\n\
\    </object>\n\
\  </child>\n\
 </object>\n\
 ]}\n\n\
 [GtkWidget] allows style information such as style classes to\n\
 be associated with widgets, using the custom [<style>] element:\n\n\
 {[\n\
 <object class=\"GtkButton\" id=\"button1\">\n\
\  <style>\n\
\    <class name=\"my-special-button-class\"/>\n\
\    <class name=\"dark-button\"/>\n\
\  </style>\n\
 </object>\n\
 ]}\n\n\
 [GtkWidget] allows defining accessibility information, such as properties,\n\
 relations, and states, using the custom [<accessibility>] element:\n\n\
 {[\n\
 <object class=\"GtkButton\" id=\"button1\">\n\
\  <accessibility>\n\
\    <property name=\"label\">Download</property>\n\
\    <relation name=\"labelled-by\">label1</relation>\n\
\  </accessibility>\n\
 </object>\n\
 ]}\n\n\
 {b Building composite widgets from template XML}\n\n\
 [GtkWidget ]exposes some facilities to automate the procedure\n\
 of creating composite widgets using \"templates\".\n\n\
 To create composite widgets with [GtkBuilder] XML, one must associate\n\
 the interface description with the widget class at class initialization\n\
 time using [Gtk.WidgetClass.set_template].\n\n\
 The interface description semantics expected in composite template descriptions\n\
 is slightly different from regular [Gtk.Builder] XML.\n\n\
 Unlike regular interface descriptions, [Gtk.WidgetClass.set_template]\n\
 will expect a [<template>] tag as a direct child of the toplevel\n\
 [<interface>] tag. The [<template>] tag must specify the “class” attribute\n\
 which must be the type name of the widget. Optionally, the “parent”\n\
 attribute may be specified to specify the direct parent type of the widget\n\
 type; this is ignored by [GtkBuilder] but can be used by UI design tools to\n\
 introspect what kind of properties and internal children exist for a given\n\
 type when the actual type does not exist.\n\n\
 The XML which is contained inside the [<template>] tag behaves as if it were\n\
 added to the [<object>] tag defining the widget itself. You may set properties\n\
 on a widget by inserting [<property>] tags into the [<template>] tag, and also\n\
 add [<child>] tags to add children and extend a widget in the normal way you\n\
 would with [<object>] tags.\n\n\
 Additionally, [<object>] tags can also be added before and after the initial\n\
 [<template>] tag in the normal way, allowing one to define auxiliary objects\n\
 which might be referenced by other widgets declared as children of the\n\
 [<template>] tag.\n\n\
 Since, unlike the [<object>] tag, the [<template>] tag does not contain an\n\
 “id” attribute, if you need to refer to the instance of the object itself that\n\
 the template will create, simply refer to the template class name in an\n\
 applicable element content.\n\n\
 Here is an example of a template definition, which includes an example of\n\
 this in the [<signal>] tag:\n\n\
 {[\n\
 <interface>\n\
\  <template class=\"FooWidget\" parent=\"GtkBox\">\n\
\    <property name=\"orientation\">horizontal</property>\n\
\    <property name=\"spacing\">4</property>\n\
\    <child>\n\
\      <object class=\"GtkButton\" id=\"hello_button\">\n\
\        <property name=\"label\">Hello World</property>\n\
\        <signal name=\"clicked\" handler=\"hello_button_clicked\" \
 object=\"FooWidget\" swapped=\"yes\"/>\n\
\      </object>\n\
\    </child>\n\
\    <child>\n\
\      <object class=\"GtkButton\" id=\"goodbye_button\">\n\
\        <property name=\"label\">Goodbye World</property>\n\
\      </object>\n\
\    </child>\n\
\  </template>\n\
 </interface>\n\
 ]}\n\n\
 Typically, you'll place the template fragment into a file that is\n\
 bundled with your project, using [GResource]. In order to load the\n\
 template, you need to call [Gtk.WidgetClass.set_template_from_resource]\n\
 from the class initialization of your [GtkWidget] type:\n\n\
 {[\n\
 static void\n\
 foo_widget_class_init (FooWidgetClass *klass)\n\
 {\n\
\  // ...\n\n\
\  gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),\n\
\                                               \
 \"/com/example/ui/foowidget.ui\");\n\
 }\n\
 ]}\n\n\
 You will also need to call [Gtk.Widget.init_template] from the\n\
 instance initialization function:\n\n\
 {[\n\
 static void\n\
 foo_widget_init (FooWidget *self)\n\
 {\n\
\  gtk_widget_init_template (GTK_WIDGET (self));\n\n\
\  // Initialize the rest of the widget...\n\
 }\n\
 ]}\n\n\
 as well as calling [Gtk.Widget.dispose_template] from the dispose\n\
 function:\n\n\
 {[\n\
 static void\n\
 foo_widget_dispose (GObject *gobject)\n\
 {\n\
\  FooWidget *self = FOO_WIDGET (gobject);\n\n\
\  // Dispose objects for which you have a reference...\n\n\
\  // Clear the template children for this widget type\n\
\  gtk_widget_dispose_template (GTK_WIDGET (self), FOO_TYPE_WIDGET);\n\n\
\  G_OBJECT_CLASS (foo_widget_parent_class)->dispose (gobject);\n\
 }\n\
 ]}\n\n\
 You can access widgets defined in the template using the\n\
 [Gtk.Widget.get_template_child] function, but you will typically declare\n\
 a pointer in the instance private data structure of your type using the same\n\
 name as the widget in the template definition, and call\n\
 [Gtk.WidgetClass.bind_template_child_full] (or one of its wrapper macros\n\
 [Gtk.widget_class_bind_template_child] and \
 [Gtk.widget_class_bind_template_child_private])\n\
 with that name, e.g.\n\n\
 {[\n\
 typedef struct {\n\
\  GtkWidget *hello_button;\n\
\  GtkWidget *goodbye_button;\n\
 } FooWidgetPrivate;\n\n\
 G_DEFINE_TYPE_WITH_PRIVATE (FooWidget, foo_widget, GTK_TYPE_BOX)\n\n\
 static void\n\
 foo_widget_dispose (GObject *gobject)\n\
 {\n\
\  gtk_widget_dispose_template (GTK_WIDGET (gobject), FOO_TYPE_WIDGET);\n\n\
\  G_OBJECT_CLASS (foo_widget_parent_class)->dispose (gobject);\n\
 }\n\n\
 static void\n\
 foo_widget_class_init (FooWidgetClass *klass)\n\
 {\n\
\  // ...\n\
\  G_OBJECT_CLASS (klass)->dispose = foo_widget_dispose;\n\n\
\  gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),\n\
\                                               \
 \"/com/example/ui/foowidget.ui\");\n\
\  gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),\n\
\                                                FooWidget, hello_button);\n\
\  gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),\n\
\                                                FooWidget, goodbye_button);\n\
 }\n\n\
 static void\n\
 foo_widget_init (FooWidget *widget)\n\
 {\n\
\  gtk_widget_init_template (GTK_WIDGET (widget));\n\
 }\n\
 ]}\n\n\
 You can also use [Gtk.WidgetClass.bind_template_callback_full] (or\n\
 is wrapper macro [Gtk.widget_class_bind_template_callback]) to connect\n\
 a signal callback defined in the template with a function visible in the\n\
 scope of the class, e.g.\n\n\
 {[\n\
 // the signal handler has the instance and user data swapped\n\
 // because of the swapped=\"yes\" attribute in the template XML\n\
 static void\n\
 hello_button_clicked (FooWidget *self,\n\
\                      GtkButton *button)\n\
 {\n\
\  g_print (\"Hello, world!\\n\");\n\
 }\n\n\
 static void\n\
 foo_widget_class_init (FooWidgetClass *klass)\n\
 {\n\
\  // ...\n\
\  gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),\n\
\                                               \
 \"/com/example/ui/foowidget.ui\");\n\
\  gtk_widget_class_bind_template_callback (GTK_WIDGET_CLASS (klass), \
 hello_button_clicked);\n\
 }\n\
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-widget_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Widget}."]

class type widget_t =
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .widget_t
(** The methods, signals and properties of a [GtkWidget]. *)

class widget : Raw.Widget.t -> widget_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Widget.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkWidget], give one already wrapped. *)
