/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuilderListItemFactory */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkBuilderListItemFactory */
#define GtkBuilderListItemFactory_val(val) ((GtkBuilderListItemFactory*)ext_of_val(val))
#define Val_GtkBuilderListItemFactory(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_builder_list_item_factory_new_from_bytes(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBuilderListItemFactory *obj = gtk_builder_list_item_factory_new_from_bytes((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2);
CAMLreturn(Val_GtkBuilderListItemFactory(obj));
}

CAMLexport CAMLprim value ml_gtk_builder_list_item_factory_new_from_resource(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBuilderListItemFactory *obj = gtk_builder_list_item_factory_new_from_resource((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), String_val(arg2));
CAMLreturn(Val_GtkBuilderListItemFactory(obj));
}

CAMLexport CAMLprim value ml_gtk_builder_list_item_factory_get_scope(value self)
{
CAMLparam1(self);

GtkBuilderScope* result = gtk_builder_list_item_factory_get_scope(GtkBuilderListItemFactory_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_builder_list_item_factory_get_resource(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBuilderListItemFactory *obj = (GtkBuilderListItemFactory *)GtkBuilderListItemFactory_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "resource", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}
