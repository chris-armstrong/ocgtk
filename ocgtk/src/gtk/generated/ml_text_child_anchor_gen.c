/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextChildAnchor */

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


CAMLexport CAMLprim value ml_gtk_text_child_anchor_new(value unit)
{
CAMLparam1(unit);
GtkTextChildAnchor *obj = gtk_text_child_anchor_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkTextChildAnchor(obj));
}

CAMLexport CAMLprim value ml_gtk_text_child_anchor_new_with_replacement(value arg1)
{
CAMLparam1(arg1);
GtkTextChildAnchor *obj = gtk_text_child_anchor_new_with_replacement(String_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkTextChildAnchor(obj));
}

CAMLexport CAMLprim value ml_gtk_text_child_anchor_get_deleted(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_child_anchor_get_deleted(GtkTextChildAnchor_val(self));
CAMLreturn(Val_bool(result));
}
