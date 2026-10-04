(* GENERATED CODE - DO NOT EDIT *)
(* Builder: Builder *)

[@@@ocaml.text
"Reads XML descriptions of a user interface and instantiates the described \
 objects.\n\n\
 To create a [GtkBuilder] from a user interface description, call\n\
 [Gtk.Builder.new_from_file], [Gtk.Builder.new_from_resource]\n\
 or [Gtk.Builder.new_from_string].\n\n\
 In the (unusual) case that you want to add user interface\n\
 descriptions from multiple sources to the same [GtkBuilder] you can\n\
 call [Gtk.Builder.new] to get an empty builder and populate it by\n\
 (multiple) calls to [Gtk.Builder.add_from_file],\n\
 [Gtk.Builder.add_from_resource] or\n\
 [Gtk.Builder.add_from_string].\n\n\
 A [GtkBuilder] holds a reference to all objects that it has constructed\n\
 and drops these references when it is finalized. This finalization can\n\
 cause the destruction of non-widget objects or widgets which are not\n\
 contained in a toplevel window. For toplevel windows constructed by a\n\
 builder, it is the responsibility of the user to call\n\
 [Gtk.Window.destroy] to get rid of them and all the widgets\n\
 they contain.\n\n\
 The functions [Gtk.Builder.get_object] and\n\
 [Gtk.Builder.get_objects] can be used to access the widgets in\n\
 the interface by the names assigned to them inside the UI description.\n\
 Toplevel windows returned by these functions will stay around until the\n\
 user explicitly destroys them with [Gtk.Window.destroy]. Other\n\
 widgets will either be part of a larger hierarchy constructed by the\n\
 builder (in which case you should not have to worry about their lifecycle),\n\
 or without a parent, in which case they have to be added to some container\n\
 to make use of them. Non-widget objects need to be reffed with\n\
 g_object_ref() to keep them beyond the lifespan of the builder.\n\n\
 {b GtkBuilder UI Definitions}\n\n\
 [GtkBuilder] parses textual descriptions of user interfaces which are\n\
 specified in XML format. We refer to these descriptions as “GtkBuilder\n\
 UI definitions” or just “UI definitions” if the context is clear.\n\n\
 {b Structure of UI definitions}\n\n\
 UI definition files are always encoded in UTF-8.\n\n\
 The toplevel element is [<interface>]. It optionally takes a “domain”\n\
 attribute, which will make the builder look for translated strings\n\
 using [dgettext()] in the domain specified. This can also be done by\n\
 calling [Gtk.Builder.set_translation_domain] on the builder.\n\
 For example:\n\n\
 {[\n\
 <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\
 <interface domain=\"your-app\">\n\
\  ...\n\
 </interface>\n\
 ]}\n\n\
 {b Requirements}\n\n\
 The target toolkit version(s) are described by [<requires>] elements,\n\
 the “lib” attribute specifies the widget library in question (currently\n\
 the only supported value is “gtk”) and the “version” attribute specifies\n\
 the target version in the form “[<major>].[<minor>]”. [GtkBuilder] will\n\
 error out if the version requirements are not met. For example:\n\n\
 {[\n\
 <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\
 <interface domain=\"your-app\">\n\
\  <requires lib=\"gtk\" version=\"4.0\" />\n\
 </interface>\n\
 ]}\n\n\
 {b Objects}\n\n\
 Objects are defined as children of the [<interface>] element.\n\n\
 Objects are described by [<object>] elements, which can contain\n\
 [<property>] elements to set properties, [<signal>] elements which\n\
 connect signals to handlers, and [<child>] elements, which describe\n\
 child objects.\n\n\
 Typically, the specific kind of object represented by an [<object>]\n\
 element is specified by the “class” attribute. If the type has not\n\
 been loaded yet, GTK tries to find the [get_type()] function from the\n\
 class name by applying heuristics. This works in most cases, but if\n\
 necessary, it is possible to specify the name of the [get_type()]\n\
 function explicitly with the \"type-func\" attribute. If your UI definition\n\
 is referencing internal types, you should make sure to call\n\
 [g_type_ensure()] for each object type before parsing the UI definition.\n\n\
 Objects may be given a name with the “id” attribute, which allows the\n\
 application to retrieve them from the builder with\n\
 [Gtk.Builder.get_object]. An id is also necessary to use the\n\
 object as property value in other parts of the UI definition. GTK\n\
 reserves ids starting and ending with [___] (three consecutive\n\
 underscores) for its own purposes.\n\n\
 {b Properties}\n\n\
 Setting properties of objects is pretty straightforward with the\n\
 [<property>] element: the “name” attribute specifies the name of the\n\
 property, and the content of the element specifies the value:\n\n\
 {[\n\
 <object class=\"GtkButton\">\n\
\  <property name=\"label\">Hello, world</property>\n\
 </object>\n\
 ]}\n\n\
 If the “translatable” attribute is set to a true value, GTK uses\n\
 [gettext()] (or [dgettext()] if the builder has a translation domain set)\n\
 to find a translation for the value. This happens before the value\n\
 is parsed, so it can be used for properties of any type, but it is\n\
 probably most useful for string properties. It is also possible to\n\
 specify a context to disambiguate short strings, and comments which\n\
 may help the translators:\n\n\
 {[\n\
 <object class=\"GtkButton\">\n\
\  <property name=\"label\"\n\
\            translatable=\"yes\"\n\
\            context=\"button\"\n\
\            comments=\"A classic\">Hello, world</property>\n\
 </object>\n\
 ]}\n\n\
 The xgettext tool that is part of gettext can extract these strings,\n\
 but note that it only looks for translatable=\"yes\".\n\n\
 [GtkBuilder] can parse textual representations for the most common\n\
 property types:\n\n\
 - characters\n\
 - strings\n\
 - integers\n\
 - floating-point numbers\n\
 - booleans (strings like “TRUE”, “t”, “yes”, “y”, “1” are interpreted\n\
 as true values, strings like “FALSE”, “f”, “no”, “n”, “0” are interpreted\n\
 as false values)\n\
 - string lists (separated by newlines)\n\
 - enumeration types (can be specified by their full C identifier their short\n\
 name used when registering the enumeration type, or their integer value)\n\
 - flag types (can be specified by their C identifier or short name,\n\
 optionally combined with “|” for bitwise OR, or a single integer value\n\
 e.g., “GTK_INPUT_HINT_EMOJI|GTK_INPUT_HINT_LOWERCASE”, or “emoji|lowercase” \
 or 520).\n\
 - colors (in the format understood by [Gdk.RGBA.parse])\n\
 - transforms (in the format understood by [Gsk.Transform.parse])\n\
 - Pango attribute lists (in the format understood by \
 [Pango.AttrList.to_string])\n\
 - Pango tab arrays (in the format understood by [Pango.TabArray.to_string])\n\
 - Pango font descriptions (in the format understood by \
 [Pango.FontDescription.from_string])\n\
 - [GVariant] (in the format understood by [GLib.Variant.parse])\n\
 - textures (can be specified as an object id, a resource path or a filename \
 of an image file to load relative to the Builder file or the CWD if \
 [Gtk.Builder.add_from_string] was used)\n\
 - GFile (like textures, can be specified as an object id, a URI or a filename \
 of a file to load relative to the Builder file or the CWD if \
 [Gtk.Builder.add_from_string] was used)\n\n\
 Objects can be referred to by their name and by default refer to\n\
 objects declared in the local XML fragment and objects exposed via\n\
 [Gtk.Builder.expose_object]. In general, [GtkBuilder] allows\n\
 forward references to objects declared in the local XML; an object\n\
 doesn’t have to be constructed before it can be referred to. The\n\
 exception to this rule is that an object has to be constructed before\n\
 it can be used as the value of a construct-only property.\n\n\
 {b Child objects}\n\n\
 Many widgets have properties for child widgets, such as\n\
 [Gtk.Expander:child]. In this case, the preferred way to\n\
 specify the child widget in a ui file is to simply set the property:\n\n\
 {[\n\
 <object class=\"GtkExpander\">\n\
\  <property name=\"child\">\n\
\    <object class=\"GtkLabel\">\n\
\    ...\n\
\    </object>\n\
\  </property>\n\
 </object>\n\
 ]}\n\n\
 Generic containers that can contain an arbitrary number of children,\n\
 such as [Gtk.Box] instead use the [<child>] element. A [<child>]\n\
 element contains an [<object>] element which describes the child object.\n\
 Most often, child objects are widgets inside a container, but they can\n\
 also be, e.g., actions in an action group, or columns in a tree model.\n\n\
 Any object type that implements the [Gtk.Buildable] interface can\n\
 specify how children may be added to it. Since many objects and widgets that\n\
 are included with GTK already implement the [GtkBuildable] interface,\n\
 typically child objects can be added using the [<child>] element without\n\
 having to be concerned about the underlying implementation.\n\n\
 See the [GtkWidget] documentation\n\
 for many examples of using [GtkBuilder] with widgets, including setting\n\
 child objects using the [<child>] element.\n\n\
 A noteworthy special case to the general rule that only objects implementing\n\
 [GtkBuildable] may specify how to handle the [<child>] element is that\n\
 [GtkBuilder] provides special support for adding objects to a\n\
 [Gio.ListStore] by using the [<child>] element. For instance:\n\n\
 {[\n\
 <object class=\"GListStore\">\n\
\  <property name=\"item-type\">MyObject</property>\n\
\  <child>\n\
\    <object class=\"MyObject\" />\n\
\  </child>\n\
\  ...\n\
 </object>\n\
 ]}\n\n\
 {b Property bindings}\n\n\
 It is also possible to bind a property value to another object's\n\
 property value using the attributes \"bind-source\" to specify the\n\
 source object of the binding, and optionally, \"bind-property\" and\n\
 \"bind-flags\" to specify the source property and source binding flags\n\
 respectively. Internally, [GtkBuilder] implements this using\n\
 [GObject.Binding] objects.\n\n\
 For instance, in the example below the “label” property of the\n\
 [bottom_label] widget is bound to the “label” property of the\n\
 [top_button] widget:\n\n\
 {[\n\
 <object class=\"GtkBox\">\n\
\  <property name=\"orientation\">vertical</property>\n\
\  <child>\n\
\    <object class=\"GtkButton\" id=\"top_button\">\n\
\      <property name=\"label\">Hello, world</property>\n\
\    </object>\n\
\  </child>\n\
\  <child>\n\
\    <object class=\"GtkLabel\" id=\"bottom_label\">\n\
\      <property name=\"label\"\n\
\                bind-source=\"top_button\"\n\
\                bind-property=\"label\"\n\
\                bind-flags=\"sync-create\" />\n\
\    </object>\n\
\  </child>\n\
 </object>\n\
 ]}\n\n\
 For more information, see the documentation of the\n\
 [GObject.Object.bind_property] method.\n\n\
 Please note that another way to set up bindings between objects in .ui files\n\
 is to use the [GtkExpression] methodology. See the\n\
 [GtkExpression] documentation\n\
 for more information.\n\n\
 {b Internal children}\n\n\
 Sometimes it is necessary to refer to widgets which have implicitly\n\
 been constructed by GTK as part of a composite widget, to set\n\
 properties on them or to add further children (e.g. the content area\n\
 of a [GtkDialog]). This can be achieved by setting the “internal-child”\n\
 property of the [<child>] element to a true value. Note that [GtkBuilder]\n\
 still requires an [<object>] element for the internal child, even if it\n\
 has already been constructed.\n\n\
 {b Specialized children}\n\n\
 A number of widgets have different places where a child can be added\n\
 (e.g. tabs vs. page content in notebooks). This can be reflected in\n\
 a UI definition by specifying the “type” attribute on a [<child>]\n\
 The possible values for the “type” attribute are described in the\n\
 sections describing the widget-specific portions of UI definitions.\n\n\
 {b Signal handlers and function pointers}\n\n\
 Signal handlers are set up with the [<signal>] element. The “name”\n\
 attribute specifies the name of the signal, and the “handler” attribute\n\
 specifies the function to connect to the signal.\n\n\
 {[\n\
 <object class=\"GtkButton\" id=\"hello_button\">\n\
\  <signal name=\"clicked\" handler=\"hello_button__clicked\" />\n\
 </object>\n\
 ]}\n\n\
 The remaining attributes, “after”, “swapped” and “object”, have the\n\
 same meaning as the corresponding parameters of the\n\
 [GObject.signal_connect_object] or [GObject.signal_connect_data]\n\
 functions:\n\n\
 - “after” matches the [G_CONNECT_AFTER] flag, and will ensure that the\n\
 handler is called after the default class closure for the signal\n\
 - “swapped” matches the [G_CONNECT_SWAPPED] flag, and will swap the\n\
 instance and closure arguments when invoking the signal handler\n\
 - “object” will bind the signal handler to the lifetime of the object\n\
 referenced by the attribute\n\n\
 By default \"swapped\" will be set to \"yes\" if not specified otherwise, in\n\
 the case where \"object\" is set, for convenience. A “last_modification_time”\n\
 attribute is also allowed, but it does not have a meaning to the builder.\n\n\
 When compiling applications for Windows, you must declare signal callbacks\n\
 with the [G_MODULE_EXPORT] decorator, or they will not be put in the symbol\n\
 table:\n\n\
 {[\n\
 G_MODULE_EXPORT void\n\
 hello_button__clicked (GtkButton *button,\n\
\                       gpointer data)\n\
 {\n\
\  // ...\n\
 }\n\
 ]}\n\n\
 On Linux and Unix, this is not necessary; applications should instead\n\
 be compiled with the [-Wl,--export-dynamic] argument inside their compiler\n\
 flags, and linked against [gmodule-export-2.0].\n\n\
 {b Example UI Definition}\n\n\
 {[\n\
 <interface>\n\
\  <object class=\"GtkDialog\" id=\"dialog1\">\n\
\    <child internal-child=\"content_area\">\n\
\      <object class=\"GtkBox\">\n\
\        <child internal-child=\"action_area\">\n\
\          <object class=\"GtkBox\">\n\
\            <child>\n\
\              <object class=\"GtkButton\" id=\"ok_button\">\n\
\                <property name=\"label\" translatable=\"yes\">_Ok</property>\n\
\                <property name=\"use-underline\">True</property>\n\
\                <signal name=\"clicked\" handler=\"ok_button_clicked\"/>\n\
\              </object>\n\
\            </child>\n\
\          </object>\n\
\        </child>\n\
\      </object>\n\
\    </child>\n\
\  </object>\n\
 </interface>\n\
 ]}\n\n\
 {b Using GtkBuildable for extending UI definitions}\n\n\
 Objects can implement the [Gtk.Buildable] interface to add custom\n\
 elements and attributes to the XML. Typically, any extension will be\n\
 documented in each type that implements the interface.\n\n\
 {b Menus}\n\n\
 In addition to objects with properties that are created with [<object>] and\n\
 [<property>] elements, [GtkBuilder] also allows to parse XML menu definitions\n\
 as used by [Gio.Menu] when exporting menu models over D-Bus, and as\n\
 described in the [Gtk.PopoverMenu] documentation. Menus can be defined\n\
 as toplevel elements, or as property values for properties of type \
 [GMenuModel].\n\n\
 {b Templates}\n\n\
 When describing a [Gtk.Widget], you can use the [<template>] tag to\n\
 describe a UI bound to a specific widget type. GTK will automatically load\n\
 the UI definition when instantiating the type, and bind children and\n\
 signal handlers to instance fields and function symbols.\n\n\
 For more information, see the [GtkWidget] documentation\n\
 for details."]

type t = [ `builder | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_builder_new"
(** Create a new Builder *)

external new_from_file : string -> t = "ml_gtk_builder_new_from_file"
(** Create a new Builder *)

external new_from_resource : string -> t = "ml_gtk_builder_new_from_resource"
(** Create a new Builder *)

external new_from_string : string -> int -> t = "ml_gtk_builder_new_from_string"
(** Create a new Builder *)

(* Methods *)

external value_from_string_type :
  t -> Gobject.Type.t -> string -> (bool * Gobject.Value.t, GError.t) result
  = "ml_gtk_builder_value_from_string_type"
(** Demarshals a value from a string.

    Unlike [Gtk.Builder.value_from_string], this function takes a [GType]
    instead of [GParamSpec].

    Calls g_value_init() on the [value] argument, so it need not be initialised
    beforehand.

    Upon errors [FALSE] will be returned and [error] will be assigned a [GError]
    from the [GTK_BUILDER_ERROR] domain. *)

external set_translation_domain : t -> string option -> unit
  = "ml_gtk_builder_set_translation_domain"
(** Sets the translation domain of [builder]. *)

external set_scope : t -> Builder_scope.t option -> unit
  = "ml_gtk_builder_set_scope"
(** Sets the scope the builder should operate in.

    If [scope] is [NULL], a new [Gtk.BuilderCScope] will be created. *)

external set_current_object : t -> [ `object_ ] Gobject.obj option -> unit
  = "ml_gtk_builder_set_current_object"
(** Sets the current object for the [builder].

    The current object can be thought of as the [this] object that the builder
    is working for and will often be used as the default object when an object
    is optional.

    [Gtk.Widget.init_template] for example will set the current object to the
    widget the template is inited for. For functions like
    [Gtk.Builder.new_from_resource], the current object will be [NULL]. *)

external get_type_from_name : t -> string -> Gobject.Type.t
  = "ml_gtk_builder_get_type_from_name"
(** Looks up a type by name.

    This is using the virtual function that [GtkBuilder] has for that purpose.
    This is mainly used when implementing the [GtkBuildable] interface on a
    type. *)

external get_translation_domain : t -> string option
  = "ml_gtk_builder_get_translation_domain"
(** Gets the translation domain of [builder]. *)

external get_scope : t -> Builder_scope.t = "ml_gtk_builder_get_scope"
(** Gets the scope in use that was set via gtk_builder_set_scope(). *)

external get_objects : t -> [ `object_ ] Gobject.obj list
  = "ml_gtk_builder_get_objects"
(** Gets all objects that have been constructed by [builder].

    Note that this function does not increment the reference counts of the
    returned objects. *)

external get_object : t -> string -> [ `object_ ] Gobject.obj option
  = "ml_gtk_builder_get_object"
(** Gets the object named [name].

    Note that this function does not increment the reference count of the
    returned object. *)

external get_current_object : t -> [ `object_ ] Gobject.obj option
  = "ml_gtk_builder_get_current_object"
(** Gets the current object set via gtk_builder_set_current_object(). *)

external extend_with_template :
  t ->
  [ `object_ ] Gobject.obj ->
  Gobject.Type.t ->
  string ->
  int ->
  (bool, GError.t) result = "ml_gtk_builder_extend_with_template"
(** Main private entry point for building composite components from template
    XML.

    Most likely you do not need to call this function in applications as
    templates are handled by [GtkWidget]. *)

external expose_object : t -> string -> [ `object_ ] Gobject.obj -> unit
  = "ml_gtk_builder_expose_object"
(** Add [object] to the [builder] object pool so it can be referenced just like
    any other object built by builder.

    Only a single object may be added using [name]. However, it is not an error
    to expose the same object under multiple names. [gtk_builder_get_object()]
    may be used to determine if an object has already been added with [name]. *)

external add_objects_from_string :
  t -> string -> int -> string array -> (bool, GError.t) result
  = "ml_gtk_builder_add_objects_from_string"
(** Parses a string containing a UI definition, building only the requested
    objects and merges them with the current contents of [builder].

    Upon errors [FALSE] will be returned and [error] will be assigned a [GError]
    from the [GTK_BUILDER_ERROR] or [G_MARKUP_ERROR] domain.

    If you are adding an object that depends on an object that is not its child
    (for instance a [GtkTreeView] that depends on its [GtkTreeModel]), you have
    to explicitly list all of them in [object_ids]. *)

external add_objects_from_resource :
  t -> string -> string array -> (bool, GError.t) result
  = "ml_gtk_builder_add_objects_from_resource"
(** Parses a resource file containing a UI definition, building only the
    requested objects and merges them with the current contents of [builder].

    Upon errors, 0 will be returned and [error] will be assigned a [GError] from
    the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or [G_RESOURCE_ERROR] domain.

    If you are adding an object that depends on an object that is not its child
    (for instance a [GtkTreeView] that depends on its [GtkTreeModel]), you have
    to explicitly list all of them in [object_ids]. *)

external add_objects_from_file :
  t -> string -> string array -> (bool, GError.t) result
  = "ml_gtk_builder_add_objects_from_file"
(** Parses a file containing a UI definition building only the requested objects
    and merges them with the current contents of [builder].

    Upon errors, 0 will be returned and [error] will be assigned a [GError] from
    the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or [G_FILE_ERROR] domain.

    If you are adding an object that depends on an object that is not its child
    (for instance a [GtkTreeView] that depends on its [GtkTreeModel]), you have
    to explicitly list all of them in [object_ids]. *)

external add_from_string : t -> string -> int -> (bool, GError.t) result
  = "ml_gtk_builder_add_from_string"
(** Parses a string containing a UI definition and merges it with the current
    contents of [builder].

    This function is useful if you need to call [Gtk.Builder.set_current_object]
    to add user data to callbacks before loading [GtkBuilder] UI. Otherwise, you
    probably want [Gtk.Builder.new_from_string] instead.

    Upon errors [FALSE] will be returned and [error] will be assigned a [GError]
    from the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or [G_VARIANT_PARSE_ERROR]
    domain.

    It’s not really reasonable to attempt to handle failures of this call. The
    only reasonable thing to do when an error is detected is to call g_error().
*)

external add_from_resource : t -> string -> (bool, GError.t) result
  = "ml_gtk_builder_add_from_resource"
(** Parses a resource file containing a UI definition and merges it with the
    current contents of [builder].

    This function is useful if you need to call [Gtk.Builder.set_current_object]
    to add user data to callbacks before loading GtkBuilder UI. Otherwise, you
    probably want [Gtk.Builder.new_from_resource] instead.

    If an error occurs, 0 will be returned and [error] will be assigned a
    [GError] from the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or
    [G_RESOURCE_ERROR] domain.

    It’s not really reasonable to attempt to handle failures of this call. The
    only reasonable thing to do when an error is detected is to call g_error().
*)

external add_from_file : t -> string -> (bool, GError.t) result
  = "ml_gtk_builder_add_from_file"
(** Parses a file containing a UI definition and merges it with the current
    contents of [builder].

    This function is useful if you need to call
    [Gtk.Builder.set_current_object]) to add user data to callbacks before
    loading GtkBuilder UI. Otherwise, you probably want
    [Gtk.Builder.new_from_file] instead.

    If an error occurs, 0 will be returned and [error] will be assigned a
    [GError] from the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or [G_FILE_ERROR]
    domains.

    It’s not really reasonable to attempt to handle failures of this call. You
    should not use this function with untrusted files (ie: files that are not
    part of your application). Broken [GtkBuilder] files can easily crash your
    program, and it’s possible that memory was leaked leading up to the reported
    failure. The only reasonable thing to do when an error is detected is to
    call [g_error()]. *)

(* Properties *)
