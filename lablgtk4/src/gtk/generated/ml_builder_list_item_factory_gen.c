/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuilderListItemFactory */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkBuilderListItemFactory */
#ifndef Val_GtkBuilderListItemFactory
#define GtkBuilderListItemFactory_val(val) ((GtkBuilderListItemFactory*)ext_of_val(val))
#define Val_GtkBuilderListItemFactory(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBuilderListItemFactory */


CAMLexport CAMLprim value ml_gtk_builder_list_item_factory_new_from_bytes(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBuilderListItemFactory *obj = gtk_builder_list_item_factory_new_from_bytes(Option_val(arg1, GtkBuilderScope_val, NULL), arg2);
CAMLreturn(Val_GtkBuilderListItemFactory(obj));
}

CAMLexport CAMLprim value ml_gtk_builder_list_item_factory_new_from_resource(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBuilderListItemFactory *obj = gtk_builder_list_item_factory_new_from_resource(Option_val(arg1, GtkBuilderScope_val, NULL), String_val(arg2));
CAMLreturn(Val_GtkBuilderListItemFactory(obj));
}

CAMLexport CAMLprim value ml_gtk_builder_list_item_factory_get_scope(value self)
{
CAMLparam1(self);

GtkBuilderScope* result = gtk_builder_list_item_factory_get_scope(GtkBuilderListItemFactory_val(self));
CAMLreturn(Val_option(result, Val_GtkBuilderScope));
}

CAMLexport CAMLprim value ml_gtk_builder_list_item_factory_get_resource(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBuilderListItemFactory *obj = (GtkBuilderListItemFactory *)GtkBuilderListItemFactory_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "resource");
if (pspec == NULL) caml_failwith("ml_gtk_builder_list_item_factory_get_resource: property 'resource' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "resource", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
