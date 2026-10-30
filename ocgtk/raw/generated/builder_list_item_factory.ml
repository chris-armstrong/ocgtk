(* GENERATED CODE - DO NOT EDIT *)
(* BuilderListItemFactory: BuilderListItemFactory *)

[@@@ocaml.text
"Creates widgets by instantiating [GtkBuilder] UI templates.\n\n\
 The templates must extend the class that the parent widget expects.\n\
 For example, a factory provided to \
 {{!Ocgtk.Raw.List_view.val-get_factory}[Gtk.ListView:factory]} must have\n\
 a template that extends {{!Ocgtk.Raw.List_item}[Gtk.ListItem]}.\n\n\
 Templates typically use {{!Ocgtk.Raw.Expression}[Gtk.Expression]} to obtain \
 data from the items\n\
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
 The class built on this module is in {!Ocgtk.Builder_list_item_factory}."]

type t =
  [ `builder_list_item_factory | `list_item_factory | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_builder_list_item_factory_get_type"

external new_from_bytes : Builder_scope.t option -> Glib_bytes.t -> t
  = "ml_gtk_builder_list_item_factory_new_from_bytes"
(** Creates a new [GtkBuilderListItemFactory] that instantiates widgets using
    [bytes] as the data to pass to [GtkBuilder]. *)

external new_from_resource : Builder_scope.t option -> string -> t
  = "ml_gtk_builder_list_item_factory_new_from_resource"
(** Creates a new [GtkBuilderListItemFactory] that instantiates widgets using
    data read from the given [resource_path] to pass to [GtkBuilder]. *)

(* Methods *)

external get_scope : t -> Builder_scope.t option
  = "ml_gtk_builder_list_item_factory_get_scope"
(** Gets the scope used when constructing listitems. *)

external get_resource : t -> string option
  = "ml_gtk_builder_list_item_factory_get_resource"
(** If the data references a resource, gets the path of that resource. *)

external get_bytes : t -> Glib_bytes.t
  = "ml_gtk_builder_list_item_factory_get_bytes"
(** Gets the data used as the [GtkBuilder] UI template for constructing
    listitems. *)

(* Properties *)
