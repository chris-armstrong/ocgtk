/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextTag */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkTextTag */
#ifndef Val_GtkTextTag
#define GtkTextTag_val(val) ((GtkTextTag*)ext_of_val(val))
#define Val_GtkTextTag(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTextTag */


CAMLexport CAMLprim value ml_gtk_text_tag_new(value arg1)
{
CAMLparam1(arg1);
GtkTextTag *obj = gtk_text_tag_new(String_option_val(arg1));
CAMLreturn(Val_GtkTextTag(obj));
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_priority(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_tag_set_priority(GtkTextTag_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_priority(value self)
{
CAMLparam1(self);

int result = gtk_text_tag_get_priority(GtkTextTag_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_tag_changed(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_tag_changed(GtkTextTag_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}
