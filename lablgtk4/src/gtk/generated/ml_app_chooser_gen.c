/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooser */

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

/* Type-specific conversion macros for GtkAppChooser */
#ifndef Val_GtkAppChooser
#define GtkAppChooser_val(val) ((GtkAppChooser*)ext_of_val(val))
#define Val_GtkAppChooser(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAppChooser */


CAMLexport CAMLprim value ml_gtk_app_chooser_refresh(value self)
{
CAMLparam1(self);

gtk_app_chooser_refresh(GtkAppChooser_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_get_content_type(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooser *obj = (GtkAppChooser *)GtkAppChooser_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "content-type");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_get_content_type: property 'content-type' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "content-type", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
