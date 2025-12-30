/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CallbackAction */

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


CAMLexport CAMLprim value ml_gtk_callback_action_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkCallbackAction *obj = gtk_callback_action_new(arg1, arg2, arg3);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkCallbackAction(obj));
}
