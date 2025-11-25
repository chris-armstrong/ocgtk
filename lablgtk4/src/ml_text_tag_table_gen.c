/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextTagTable */

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

/* Type-specific conversion macros for GtkTextTagTable */
#ifndef Val_GtkTextTagTable
#define GtkTextTagTable_val(val) ((GtkTextTagTable*)ext_of_val(val))
#define Val_GtkTextTagTable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTextTagTable */


CAMLexport CAMLprim value ml_gtk_text_tag_table_new(value unit)
{
CAMLparam1(unit);
GtkTextTagTable *obj = gtk_text_tag_table_new();
CAMLreturn(Val_GtkTextTagTable(obj));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_tag_table_remove(GtkTextTagTable_val(self), GtkTextTag_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_lookup(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTextTag* result = gtk_text_tag_table_lookup(GtkTextTagTable_val(self), String_val(arg1));
CAMLreturn(Val_GtkTextTag(result));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_get_size(value self)
{
CAMLparam1(self);

int result = gtk_text_tag_table_get_size(GtkTextTagTable_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_add(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_text_tag_table_add(GtkTextTagTable_val(self), GtkTextTag_val(arg1));
CAMLreturn(Val_bool(result));
}
