/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MountOperation */

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

/* Type-specific conversion macros for GtkMountOperation */
#define GtkMountOperation_val(val) ((GtkMountOperation*)ext_of_val(val))
#define Val_GtkMountOperation(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_mount_operation_new(value arg1)
{
CAMLparam1(arg1);
GtkMountOperation *obj = gtk_mount_operation_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkMountOperation(obj));
}

CAMLexport CAMLprim value ml_gtk_mount_operation_set_parent(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_mount_operation_set_parent(GtkMountOperation_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_mount_operation_is_showing(value self)
{
CAMLparam1(self);

gboolean result = gtk_mount_operation_is_showing(GtkMountOperation_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_mount_operation_get_parent(value self)
{
CAMLparam1(self);

GtkWindow* result = gtk_mount_operation_get_parent(GtkMountOperation_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_mount_operation_get_is_showing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMountOperation *obj = (GtkMountOperation *)GtkMountOperation_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "is-showing", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}
