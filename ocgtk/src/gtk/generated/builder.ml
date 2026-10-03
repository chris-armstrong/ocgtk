(* GENERATED CODE - DO NOT EDIT *)
(* Builder: Builder *)

(** Reads XML descriptions of a user interface and instantiates the described
    objects.

    To create a [GtkBuilder] from a user interface description, call
    [Gtk.Builder.new_from_file], [Gtk.Builder.new_from_resource] or
    [Gtk.Builder.new_from_string].

    In the (unusual) case that you want to add user interface descriptions from
    multiple sources to the same [GtkBuilder] you can call [Gtk.Builder.new] to
    get an empty builder and populate it by (multiple) calls to
    [Gtk.Builder.add_from_file], [Gtk.Builder.add_from_resource] or
    [Gtk.Builder.add_from_string].

    A [GtkBuilder] holds a reference to all objects that it has constructed and
    drops these references when it is finalized. This finalization can cause the
    destruction of non-widget objects or widgets which are not contained in a
    toplevel window. For toplevel windows constructed by a builder, it is the
    responsibility of the user to call [Gtk.Window.destroy] to get rid of them
    and all the widgets they contain.

    The functions [Gtk.Builder.get_object] and [Gtk.Builder.get_objects] can be
    used to access the widgets in the interface by the names assigned to them
    inside the UI description. Toplevel windows returned by these functions will
    stay around until the user explicitly destroys them with
    [Gtk.Window.destroy]. Other widgets will either be part of a larger
    hierarchy constructed by the builder (in which case you should not have to
    worry about their lifecycle), or without a parent, in which case they have
    to be added to some container to make use of them. Non-widget objects need
    to be reffed with g_object_ref() to keep them beyond the lifespan of the
    builder.

    {b GtkBuilder UI Definitions}

    [GtkBuilder] parses textual descriptions of user interfaces which are
    specified in XML format. We refer to these descriptions as “GtkBuilder UI
    definitions” or just “UI definitions” if the context is clear.

    {b Structure of UI definitions}

    UI definition files are always encoded in UTF-8.

    The toplevel element is [<interface>]. It optionally takes a “domain”
    attribute, which will make the builder look for translated strings using
    [dgettext()] in the domain specified. This can also be done by calling
    [Gtk.Builder.set_translation_domain] on the builder. For example:

    {[
    <?xml version=”1.0” encoding=”UTF-8”?>
    <interface domain=”your-app”>
      ...
    </interface>
    ]}

    {b Requirements}

    The target toolkit version(s) are described by [<requires>] elements, the
    “lib” attribute specifies the widget library in question (currently the only
    supported value is “gtk”) and the “version” attribute specifies the target
    version in the form “[<major>].[<minor>]”. [GtkBuilder] will error out if
    the version requirements are not met. For example:

    {[
    <?xml version=”1.0” encoding=”UTF-8”?>
    <interface domain=”your-app”>
      <requires lib=”gtk” version=”4.0” />
    </interface>
    ]}

    {b Objects}

    Objects are defined as children of the [<interface>] element.

    Objects are described by [<object>] elements, which can contain [<property>]
    elements to set properties, [<signal>] elements which connect signals to
    handlers, and [<child>] elements, which describe child objects.

    Typically, the specific kind of object represented by an [<object>] element
    is specified by the “class” attribute. If the type has not been loaded yet,
    GTK tries to find the [get_type()] function from the class name by applying
    heuristics. This works in most cases, but if necessary, it is possible to
    specify the name of the [get_type()] function explicitly with the
    “type-func” attribute. If your UI definition is referencing internal types,
    you should make sure to call [g_type_ensure()] for each object type before
    parsing the UI definition.

    Objects may be given a name with the “id” attribute, which allows the
    application to retrieve them from the builder with [Gtk.Builder.get_object].
    An id is also necessary to use the object as property value in other parts
    of the UI definition. GTK reserves ids starting and ending with [___] (three
    consecutive underscores) for its own purposes.

    {b Properties}

    Setting properties of objects is pretty straightforward with the
    [<property>] element: the “name” attribute specifies the name of the
    property, and the content of the element specifies the value:

    {[
    <object class=”GtkButton”>
      <property name=”label”>Hello, world</property>
    </object>
    ]}

    If the “translatable” attribute is set to a true value, GTK uses [gettext()]
    (or [dgettext()] if the builder has a translation domain set) to find a
    translation for the value. This happens before the value is parsed, so it
    can be used for properties of any type, but it is probably most useful for
    string properties. It is also possible to specify a context to disambiguate
    short strings, and comments which may help the translators:

    {[
    <object class=”GtkButton”>
      <property name=”label”
                translatable=”yes”
                context=”button”
                comments=”A classic”>Hello, world</property>
    </object>
    ]}

    The xgettext tool that is part of gettext can extract these strings, but
    note that it only looks for translatable=”yes”.

    [GtkBuilder] can parse textual representations for the most common property
    types:

    - characters
    - strings
    - integers
    - floating-point numbers
    - booleans (strings like “TRUE”, “t”, “yes”, “y”, “1” are interpreted as
      true values, strings like “FALSE”, “f”, “no”, “n”, “0” are interpreted as
      false values)
    - string lists (separated by newlines)
    - enumeration types (can be specified by their full C identifier their short
      name used when registering the enumeration type, or their integer value)
    - flag types (can be specified by their C identifier or short name,
      optionally combined with “|” for bitwise OR, or a single integer value
      e.g., “GTK_INPUT_HINT_EMOJI|GTK_INPUT_HINT_LOWERCASE”, or
      “emoji|lowercase” or 520).
    - colors (in the format understood by [Gdk.RGBA.parse])
    - transforms (in the format understood by [Gsk.Transform.parse])
    - Pango attribute lists (in the format understood by
      [Pango.AttrList.to_string])
    - Pango tab arrays (in the format understood by [Pango.TabArray.to_string])
    - Pango font descriptions (in the format understood by
      [Pango.FontDescription.from_string])
    - [GVariant] (in the format understood by [GLib.Variant.parse])
    - textures (can be specified as an object id, a resource path or a filename
      of an image file to load relative to the Builder file or the CWD if
      [Gtk.Builder.add_from_string] was used)
    - GFile (like textures, can be specified as an object id, a URI or a
      filename of a file to load relative to the Builder file or the CWD if
      [Gtk.Builder.add_from_string] was used)

    Objects can be referred to by their name and by default refer to objects
    declared in the local XML fragment and objects exposed via
    [Gtk.Builder.expose_object]. In general, [GtkBuilder] allows forward
    references to objects declared in the local XML; an object doesn’t have to
    be constructed before it can be referred to. The exception to this rule is
    that an object has to be constructed before it can be used as the value of a
    construct-only property.

    {b Child objects}

    Many widgets have properties for child widgets, such as
    [Gtk.Expander:child]. In this case, the preferred way to specify the child
    widget in a ui file is to simply set the property:

    {[
    <object class=”GtkExpander”>
      <property name=”child”>
        <object class=”GtkLabel”>
        ...
        </object>
      </property>
    </object>
    ]}

    Generic containers that can contain an arbitrary number of children, such as
    [Gtk.Box] instead use the [<child>] element. A [<child>] element contains an
    [<object>] element which describes the child object. Most often, child
    objects are widgets inside a container, but they can also be, e.g., actions
    in an action group, or columns in a tree model.

    Any object type that implements the [Gtk.Buildable] interface can specify
    how children may be added to it. Since many objects and widgets that are
    included with GTK already implement the [GtkBuildable] interface, typically
    child objects can be added using the [<child>] element without having to be
    concerned about the underlying implementation.

    See the [GtkWidget] documentation for many examples of using [GtkBuilder]
    with widgets, including setting child objects using the [<child>] element.

    A noteworthy special case to the general rule that only objects implementing
    [GtkBuildable] may specify how to handle the [<child>] element is that
    [GtkBuilder] provides special support for adding objects to a
    [Gio.ListStore] by using the [<child>] element. For instance:

    {[
    <object class=”GListStore”>
      <property name=”item-type”>MyObject</property>
      <child>
        <object class=”MyObject” />
      </child>
      ...
    </object>
    ]}

    {b Property bindings}

    It is also possible to bind a property value to another object's property
    value using the attributes “bind-source” to specify the source object of the
    binding, and optionally, “bind-property” and “bind-flags” to specify the
    source property and source binding flags respectively. Internally,
    [GtkBuilder] implements this using [GObject.Binding] objects.

    For instance, in the example below the “label” property of the
    [bottom_label] widget is bound to the “label” property of the [top_button]
    widget:

    {[
    <object class=”GtkBox”>
      <property name=”orientation”>vertical</property>
      <child>
        <object class=”GtkButton” id=”top_button”>
          <property name=”label”>Hello, world</property>
        </object>
      </child>
      <child>
        <object class=”GtkLabel” id=”bottom_label”>
          <property name=”label”
                    bind-source=”top_button”
                    bind-property=”label”
                    bind-flags=”sync-create” />
        </object>
      </child>
    </object>
    ]}

    For more information, see the documentation of the
    [GObject.Object.bind_property] method.

    Please note that another way to set up bindings between objects in .ui files
    is to use the [GtkExpression] methodology. See the [GtkExpression]
    documentation for more information.

    {b Internal children}

    Sometimes it is necessary to refer to widgets which have implicitly been
    constructed by GTK as part of a composite widget, to set properties on them
    or to add further children (e.g. the content area of a [GtkDialog]). This
    can be achieved by setting the “internal-child” property of the [<child>]
    element to a true value. Note that [GtkBuilder] still requires an [<object>]
    element for the internal child, even if it has already been constructed.

    {b Specialized children}

    A number of widgets have different places where a child can be added (e.g.
    tabs vs. page content in notebooks). This can be reflected in a UI
    definition by specifying the “type” attribute on a [<child>] The possible
    values for the “type” attribute are described in the sections describing the
    widget-specific portions of UI definitions.

    {b Signal handlers and function pointers}

    Signal handlers are set up with the [<signal>] element. The “name” attribute
    specifies the name of the signal, and the “handler” attribute specifies the
    function to connect to the signal.

    {[
    <object class=”GtkButton” id=”hello_button”>
      <signal name=”clicked” handler=”hello_button__clicked” />
    </object>
    ]}

    The remaining attributes, “after”, “swapped” and “object”, have the same
    meaning as the corresponding parameters of the
    [GObject.signal_connect_object] or [GObject.signal_connect_data] functions:

    - “after” matches the [G_CONNECT_AFTER] flag, and will ensure that the
      handler is called after the default class closure for the signal
    - “swapped” matches the [G_CONNECT_SWAPPED] flag, and will swap the instance
      and closure arguments when invoking the signal handler
    - “object” will bind the signal handler to the lifetime of the object
      referenced by the attribute

    By default “swapped” will be set to “yes” if not specified otherwise, in the
    case where “object” is set, for convenience. A “last_modification_time”
    attribute is also allowed, but it does not have a meaning to the builder.

    When compiling applications for Windows, you must declare signal callbacks
    with the [G_MODULE_EXPORT] decorator, or they will not be put in the symbol
    table:

    {[
    G_MODULE_EXPORT void
    hello_button__clicked (GtkButton *button,
                           gpointer data)
    {
      // ...
    }
    ]}

    On Linux and Unix, this is not necessary; applications should instead be
    compiled with the [-Wl,--export-dynamic] argument inside their compiler
    flags, and linked against [gmodule-export-2.0].

    {b Example UI Definition}

    {[
    <interface>
      <object class=”GtkDialog” id=”dialog1”>
        <child internal-child=”content_area”>
          <object class=”GtkBox”>
            <child internal-child=”action_area”>
              <object class=”GtkBox”>
                <child>
                  <object class=”GtkButton” id=”ok_button”>
                    <property name=”label” translatable=”yes”>_Ok</property>
                    <property name=”use-underline”>True</property>
                    <signal name=”clicked” handler=”ok_button_clicked”/>
                  </object>
                </child>
              </object>
            </child>
          </object>
        </child>
      </object>
    </interface>
    ]}

    {b Using GtkBuildable for extending UI definitions}

    Objects can implement the [Gtk.Buildable] interface to add custom elements
    and attributes to the XML. Typically, any extension will be documented in
    each type that implements the interface.

    {b Menus}

    In addition to objects with properties that are created with [<object>] and
    [<property>] elements, [GtkBuilder] also allows to parse XML menu
    definitions as used by [Gio.Menu] when exporting menu models over D-Bus, and
    as described in the [Gtk.PopoverMenu] documentation. Menus can be defined as
    toplevel elements, or as property values for properties of type
    [GMenuModel].

    {b Templates}

    When describing a [Gtk.Widget], you can use the [<template>] tag to describe
    a UI bound to a specific widget type. GTK will automatically load the UI
    definition when instantiating the type, and bind children and signal
    handlers to instance fields and function symbols.

    For more information, see the [GtkWidget] documentation for details. *)

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
