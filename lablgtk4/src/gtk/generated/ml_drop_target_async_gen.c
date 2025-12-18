/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DropTargetAsync */

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

/* Type-specific conversion macros for GtkDropTargetAsync */
#ifndef Val_GtkDropTargetAsync
#define GtkDropTargetAsync_val(val) ((GtkDropTargetAsync*)ext_of_val(val))
#define Val_GtkDropTargetAsync(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDropTargetAsync */


CAMLexport CAMLprim value ml_gtk_drop_target_async_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkDropTargetAsync *obj = gtk_drop_target_async_new(arg1, GdkDragAction_val(arg2));
CAMLreturn(Val_GtkDropTargetAsync(obj));
}

CAMLexport CAMLprim value ml_gtk_drop_target_async_set_actions(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_target_async_set_actions(GtkDropTargetAsync_val(self), GdkDragAction_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_async_get_actions(value self)
{
CAMLparam1(self);

GdkDragAction result = gtk_drop_target_async_get_actions(GtkDropTargetAsync_val(self));
CAMLreturn(Val_GdkDragAction(result));
}
