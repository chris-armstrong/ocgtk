[@@@ocaml.text
"Creates widgets by instantiating [GtkBuilder] UI templates.\n\n\
 The templates must extend the class that the parent widget expects.\n\
 For example, a factory provided to [Gtk.ListView:factory] must have\n\
 a template that extends [Gtk.ListItem].\n\n\
 Templates typically use [Gtk.Expression] to obtain data from the items\n\
 in the model.\n\n\
 Example:\n\n\
 {[\n\
\  <interface>\n\
\    <template class=\"GtkListItem\">\n\
\      <property name=\"child\">\n\
\        <object class=\"GtkLabel\">\n\
\          <property name=\"xalign\">0</property>\n\
\          <binding name=\"label\">\n\
\            <lookup name=\"name\" type=\"SettingsKey\">\n\
\              <lookup name=\"item\">GtkListItem</lookup>\n\
\            </lookup>\n\
\          </binding>\n\
\        </object>\n\
\      </property>\n\
\    </template>\n\
\  </interface>\n\
 ]}\n\n\
 A common approach is to embed such templates as CDATA marked sections into\n\
 a surrounding UI file. Note that if you use this approach, extracting\n\
 translatable strings with xgettext will not work for strings inside the\n\
 marked section.\n\n\
 Its methods, signals and properties are on \
 {!class-type-builder_list_item_factory_t}. Its constructors are under \
 {!section-constructors}. The functions it is built on are in \
 {!Ocgtk.Raw.Builder_list_item_factory}."]

class type builder_list_item_factory_t = object
  inherit List_item_factory.list_item_factory_t

  method get_bytes : unit -> Glib_bytes.t
  (** Gets the data used as the [GtkBuilder] UI template for constructing
      listitems. *)

  method get_resource : unit -> string option
  (** If the data references a resource, gets the path of that resource. *)

  method get_scope : unit -> Builder_scope.builder_scope_t option
  (** Gets the scope used when constructing listitems. *)

  method as_builder_list_item_factory : Raw.Builder_list_item_factory.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [BuilderListItemFactory].}\n\n\
     Creates widgets by instantiating [GtkBuilder] UI templates.\n\n\
     The templates must extend the class that the parent widget expects.\n\
     For example, a factory provided to [Gtk.ListView:factory] must have\n\
     a template that extends [Gtk.ListItem].\n\n\
     Templates typically use [Gtk.Expression] to obtain data from the items\n\
     in the model.\n\n\
     Example:\n\n\
     {[\n\
    \  <interface>\n\
    \    <template class=\"GtkListItem\">\n\
    \      <property name=\"child\">\n\
    \        <object class=\"GtkLabel\">\n\
    \          <property name=\"xalign\">0</property>\n\
    \          <binding name=\"label\">\n\
    \            <lookup name=\"name\" type=\"SettingsKey\">\n\
    \              <lookup name=\"item\">GtkListItem</lookup>\n\
    \            </lookup>\n\
    \          </binding>\n\
    \        </object>\n\
    \      </property>\n\
    \    </template>\n\
    \  </interface>\n\
     ]}\n\n\
     A common approach is to embed such templates as CDATA marked sections into\n\
     a surrounding UI file. Note that if you use this approach, extracting\n\
     translatable strings with xgettext will not work for strings inside the\n\
     marked section."]

class builder_list_item_factory :
  Raw.Builder_list_item_factory.t ->
  builder_list_item_factory_t
(** Wraps a raw handle of {!Ocgtk.Raw.Builder_list_item_factory.t}. *)

(** {2:constructors Constructors} *)

val new_from_bytes :
  Builder_scope.builder_scope_t option ->
  Glib_bytes.t ->
  builder_list_item_factory_t
(** Creates a new [GtkBuilderListItemFactory] that instantiates widgets using
    [bytes] as the data to pass to [GtkBuilder]. *)

val new_from_resource :
  Builder_scope.builder_scope_t option -> string -> builder_list_item_factory_t
(** Creates a new [GtkBuilderListItemFactory] that instantiates widgets using
    data read from the given [resource_path] to pass to [GtkBuilder]. *)
