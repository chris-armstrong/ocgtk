(* GENERATED CODE - DO NOT EDIT *)
(* Expression: Expression *)

[@@@ocaml.text
"Provides a way to describe references to values.\n\n\
 An important aspect of expressions is that the value can be obtained\n\
 from a source that is several steps away. For example, an expression\n\
 may describe ‘the value of property A of [object1], which is itself the\n\
 value of a property of [object2]’. And [object1] may not even exist yet\n\
 at the time that the expression is created. This is contrast to [GObject]\n\
 property bindings, which can only create direct connections between\n\
 the properties of two objects that must both exist for the duration\n\
 of the binding.\n\n\
 An expression needs to be \"evaluated\" to obtain the value that it currently\n\
 refers to. An evaluation always happens in the context of a current object\n\
 called [this] (it mirrors the behavior of object-oriented languages),\n\
 which may or may not influence the result of the evaluation. Use\n\
 [Gtk.Expression.evaluate] for evaluating an expression.\n\n\
 Various methods for defining expressions exist, from simple constants via\n\
 [Gtk.ConstantExpression.new] to looking up properties in a [GObject]\n\
 (even recursively) via [Gtk.PropertyExpression.new] or providing\n\
 custom functions to transform and combine expressions via\n\
 [Gtk.ClosureExpression.new].\n\n\
 Here is an example of a complex expression:\n\n\
 {[\n\
\  color_expr = gtk_property_expression_new (GTK_TYPE_LIST_ITEM,\n\
\                                            NULL, \"item\");\n\
\  expression = gtk_property_expression_new (GTK_TYPE_COLOR,\n\
\                                            color_expr, \"name\");\n\
 ]}\n\n\
 when evaluated with [this] being a [GtkListItem], it will obtain the\n\
 \"item\" property from the [GtkListItem], and then obtain the \"name\" property\n\
 from the resulting object (which is assumed to be of type [GTK_TYPE_COLOR]).\n\n\
 A more concise way to describe this would be\n\n\
 {[\n\
\  this->item->name\n\
 ]}\n\n\
 The most likely place where you will encounter expressions is in the context\n\
 of list models and list widgets using them. For example, [GtkDropDown] is\n\
 evaluating a [GtkExpression] to obtain strings from the items in its model\n\
 that it can then use to match against the contents of its search entry.\n\
 [GtkStringFilter] is using a [GtkExpression] for similar reasons.\n\n\
 By default, expressions are not paying attention to changes and evaluation is\n\
 just a snapshot of the current state at a given time. To get informed about\n\
 changes, an expression needs to be \"watched\" via a [Gtk.ExpressionWatch],\n\
 which will cause a callback to be called whenever the value of the expression \
 may\n\
 have changed; [Gtk.Expression.watch] starts watching an expression, and\n\
 [Gtk.ExpressionWatch.unwatch] stops.\n\n\
 Watches can be created for automatically updating the property of an object,\n\
 similar to GObject's [GBinding] mechanism, by using [Gtk.Expression.bind].\n\n\
 {b GtkExpression in GObject properties}\n\n\
 In order to use a [GtkExpression] as a [GObject] property, you must use the\n\
 [Gtk.param_spec_expression] when creating a [GParamSpec] to install in the\n\
 [GObject] class being defined; for instance:\n\n\
 {[\n\
 obj_props[PROP_EXPRESSION] =\n\
\  gtk_param_spec_expression (\"expression\",\n\
\                             \"Expression\",\n\
\                             \"The expression used by the widget\",\n\
\                             G_PARAM_READWRITE |\n\
\                             G_PARAM_STATIC_STRINGS |\n\
\                             G_PARAM_EXPLICIT_NOTIFY);\n\
 ]}\n\n\
 When implementing the [GObjectClass.set_property] and \
 [GObjectClass.get_property]\n\
 virtual functions, you must use [Gtk.value_get_expression], to retrieve the\n\
 stored [GtkExpression] from the [GValue] container, and \
 [Gtk.value_set_expression],\n\
 to store the [GtkExpression] into the [GValue]; for instance:\n\n\
 {[\n\
\  // in set_property()...\n\
\  case PROP_EXPRESSION:\n\
\    foo_widget_set_expression (foo, gtk_value_get_expression (value));\n\
\    break;\n\n\
\  // in get_property()...\n\
\  case PROP_EXPRESSION:\n\
\    gtk_value_set_expression (value, foo->expression);\n\
\    break;\n\
 ]}\n\n\
 {b GtkExpression in .ui files}\n\n\
 [GtkBuilder] has support for creating expressions. The syntax here can be \
 used where\n\
 a [GtkExpression] object is needed like in a [<property>] tag for an expression\n\
 property, or in a [<binding name=\"property\">] tag to bind a property to an \
 expression.\n\n\
 To create a property expression, use the [<lookup>] element. It can have a \
 [type]\n\
 attribute to specify the object type, and a [name] attribute to specify the \
 property\n\
 to look up. The content of [<lookup>] can either be a string that specifies \
 the name\n\
 of the object to use, an element specifying an expression to provide an \
 object, or\n\
 empty to use the [this] object.\n\n\
 Example:\n\n\
 {[\n\
\  <lookup name='search'>string_filter</lookup>\n\
 ]}\n\n\
 Since the [<lookup>] element creates an expression and its element content can\n\
 itself be an expression, this means that [<lookup>] tags can also be nested.\n\
 This is a common idiom when dealing with [GtkListItem]s. See\n\
 [Gtk.BuilderListItemFactory] for an example of this technique.\n\n\
 To create a constant expression, use the [<constant>] element. If the type \
 attribute\n\
 is specified, the element content is interpreted as a value of that type. \
 Otherwise,\n\
 it is assumed to be an object. For instance:\n\n\
 {[\n\
\  <constant>string_filter</constant>\n\
\  <constant type='gchararray'>Hello, world</constant>\n\
 ]}\n\n\
 String ([type='gchararray']) constants can be marked for translation with the\n\
 [translatable=] attribute, and will then be looked up in the\n\
 [Gtk.Builder:translation-domain] when the expression is constructed.\n\n\
 {[\n\
\  <constant type='gchararray' translatable='yes'>I'm translatable!</constant>\n\
 ]}\n\n\
 As with other translatable strings in [Gtk.Builder], constants can\n\
 also have a context and/or translation comment:\n\n\
 {[\n\
\  <constant type='gchararray'\n\
\            translatable='yes'\n\
\            context='example'\n\
\            comments='A sample string'>I'm translatable!</constant>\n\
 ]}\n\n\
 To create a closure expression, use the [<closure>] element. The [function]\n\
 attribute specifies what function to use for the closure, and the [type]\n\
 attribute specifies its return type. The content of the element contains the\n\
 expressions for the parameters. For instance:\n\n\
 {[\n\
\  <closure type='gchararray' function='combine_args_somehow'>\n\
\    <constant type='gchararray'>File size:</constant>\n\
\    <lookup type='GFile' name='size'>myfile</lookup>\n\
\  </closure>\n\
 ]}\n\n\
 To create a property binding, use the [<binding>] element in place of where a\n\
 [<property>] tag would ordinarily be used. The [name] and [object] attributes \
 are\n\
 supported. The [name] attribute is required, and pertains to the applicable \
 property\n\
 name. The [object] attribute is optional. If provided, it will use the \
 specified object\n\
 as the [this] object when the expression is evaluated. Here is an example in \
 which the\n\
 [label] property of a [GtkLabel] is bound to the [string] property of another \
 arbitrary\n\
 object:\n\n\
 {[\n\
\  <object class='GtkLabel'>\n\
\    <binding name='label'>\n\
\      <lookup name='string'>some_other_object</lookup>\n\
\    </binding>\n\
\  </object>\n\
 ]}"]

type t = [ `expression ] Gobject.obj

(* Methods *)

external unref : t -> unit = "ml_gtk_expression_unref"
(** Releases a reference on the given [GtkExpression].

    If the reference was the last, the resources associated to the [self] are
    freed. *)

external ref : t -> t = "ml_gtk_expression_ref"
(** Acquires a reference on the given [GtkExpression]. *)

external is_static : t -> bool = "ml_gtk_expression_is_static"
(** Checks if the expression is static.

    A static expression will never change its result when
    [Gtk.Expression.evaluate] is called on it with the same arguments.

    That means a call to [Gtk.Expression.watch] is not necessary because it will
    never trigger a notify. *)

external get_value_type : t -> Gobject.Type.t
  = "ml_gtk_expression_get_value_type"
(** Gets the [GType] that this expression evaluates to.

    This type is constant and will not change over the lifetime of this
    expression. *)

external evaluate :
  t -> [ `object_ ] Gobject.obj option -> Gobject.Value.t -> bool
  = "ml_gtk_expression_evaluate"
(** Evaluates the given expression and on success stores the result in [value].

    The [GType] of [value] will be the type given by
    [Gtk.Expression.get_value_type].

    It is possible that expressions cannot be evaluated - for example when the
    expression references objects that have been destroyed or set to [NULL]. In
    that case [value] will remain empty and [FALSE] will be returned. *)

external bind :
  t ->
  [ `object_ ] Gobject.obj ->
  string ->
  [ `object_ ] Gobject.obj option ->
  Expression_watch.t = "ml_gtk_expression_bind"
(** Bind [target]'s property named [property] to [self].

    The value that [self] evaluates to is set via [g_object_set()] on [target].
    This is repeated whenever [self] changes to ensure that the object's
    property stays synchronized with [self].

    If [self]'s evaluation fails, [target]'s [property] is not updated. You can
    ensure that this doesn't happen by using a fallback expression.

    Note that this function takes ownership of [self]. If you want to keep it
    around, you should [Gtk.Expression.ref] it beforehand. *)
