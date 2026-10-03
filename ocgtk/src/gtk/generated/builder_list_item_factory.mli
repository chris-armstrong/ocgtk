(* GENERATED CODE - DO NOT EDIT *)
(* BuilderListItemFactory: BuilderListItemFactory *)

type t =
  [ `builder_list_item_factory | `list_item_factory | `object_ ] Gobject.obj
(** Creates widgets by instantiating [GtkBuilder] UI templates.

    The templates must extend the class that the parent widget expects. For
    example, a factory provided to [Gtk.ListView:factory] must have a template
    that extends [Gtk.ListItem].

    Templates typically use [Gtk.Expression] to obtain data from the items in
    the model.

    Example:

    {[
      <interface>
        <template class=”GtkListItem”>
          <property name=”child”>
            <object class=”GtkLabel”>
              <property name=”xalign”>0</property>
              <binding name=”label”>
                <lookup name=”name” type=”SettingsKey”>
                  <lookup name=”item”>GtkListItem</lookup>
                </lookup>
              </binding>
            </object>
          </property>
        </template>
      </interface>
    ]}

    A common approach is to embed such templates as CDATA marked sections into a
    surrounding UI file. Note that if you use this approach, extracting
    translatable strings with xgettext will not work for strings inside the
    marked section. *)

external new_from_bytes : Builder_scope.t option -> Glib_bytes.t -> t
  = "ml_gtk_builder_list_item_factory_new_from_bytes"
(** Create a new BuilderListItemFactory *)

external new_from_resource : Builder_scope.t option -> string -> t
  = "ml_gtk_builder_list_item_factory_new_from_resource"
(** Create a new BuilderListItemFactory *)

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
