/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DropTarget */

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

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_drop_target_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkDropTarget *obj = gtk_drop_target_new(arg1, GtkDragAction_val(arg2));
CAMLreturn(Val_GtkDropTarget(obj));
}

CAMLexport CAMLprim value ml_gtk_drop_target_set_preload(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_target_set_preload(GtkDropTarget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_reject(value self)
{
CAMLparam1(self);

gtk_drop_target_reject(GtkDropTarget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_preload(value self)
{
CAMLparam1(self);

gboolean result = gtk_drop_target_get_preload(GtkDropTarget_val(self));
CAMLreturn(Val_bool(result));
}
