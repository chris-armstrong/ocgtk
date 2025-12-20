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
#include "converters.h"

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
GtkDropTargetAsync *obj = gtk_drop_target_async_new(arg1, arg2);
CAMLreturn(Val_GtkDropTargetAsync(obj));
}
