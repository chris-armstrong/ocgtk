/* GENERATED CODE - DO NOT EDIT */
/* C bindings for WindowGroup */

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


CAMLexport CAMLprim value ml_gtk_window_group_new(value unit)
{
CAMLparam1(unit);
GtkWindowGroup *obj = gtk_window_group_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkWindowGroup(obj));
}

CAMLexport CAMLprim value ml_gtk_window_group_remove_window(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_group_remove_window(GtkWindowGroup_val(self), GtkWindow_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_group_add_window(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_group_add_window(GtkWindowGroup_val(self), GtkWindow_val(arg1));
CAMLreturn(Val_unit);
}
