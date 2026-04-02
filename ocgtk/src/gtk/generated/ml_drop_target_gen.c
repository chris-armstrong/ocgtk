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
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"


CAMLexport CAMLprim value ml_gtk_drop_target_set_preload(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_target_set_preload(GtkDropTarget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_set_actions(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_target_set_actions(GtkDropTarget_val(self), GdkDragAction_val(arg1));
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

CAMLexport CAMLprim value ml_gtk_drop_target_get_formats(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gtk_drop_target_get_formats(GtkDropTarget_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkContentFormats));
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_drop(value self)
{
CAMLparam1(self);

GdkDrop* result = gtk_drop_target_get_drop(GtkDropTarget_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkDrop));
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_current_drop(value self)
{
CAMLparam1(self);

GdkDrop* result = gtk_drop_target_get_current_drop(GtkDropTarget_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkDrop));
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_actions(value self)
{
CAMLparam1(self);

GdkDragAction result = gtk_drop_target_get_actions(GtkDropTarget_val(self));
CAMLreturn(Val_GdkDragAction(result));
}
