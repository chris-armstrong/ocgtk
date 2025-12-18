/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MountOperation */

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

/* Type-specific conversion macros for GtkMountOperation */
#ifndef Val_GtkMountOperation
#define GtkMountOperation_val(val) ((GtkMountOperation*)ext_of_val(val))
#define Val_GtkMountOperation(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMountOperation */


CAMLexport CAMLprim value ml_gtk_mount_operation_new(value arg1)
{
CAMLparam1(arg1);
GtkMountOperation *obj = gtk_mount_operation_new(Option_val(arg1, GtkWindow_val, NULL));
CAMLreturn(Val_GtkMountOperation(obj));
}

CAMLexport CAMLprim value ml_gtk_mount_operation_set_parent(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_mount_operation_set_parent(GtkMountOperation_val(self), Option_val(arg1, GtkWindow_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_mount_operation_get_parent(value self)
{
CAMLparam1(self);

GtkWindow* result = gtk_mount_operation_get_parent(GtkMountOperation_val(self));
CAMLreturn(Val_option(result, Val_GtkWindow));
}

CAMLexport CAMLprim value ml_gtk_mount_operation_get_is_showing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMountOperation *obj = (GtkMountOperation *)GtkMountOperation_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "is-showing");
if (pspec == NULL) caml_failwith("ml_gtk_mount_operation_get_is_showing: property 'is-showing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "is-showing", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
