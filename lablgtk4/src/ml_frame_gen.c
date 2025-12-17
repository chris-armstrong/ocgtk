/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Frame */

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

/* Type-specific conversion macros for GtkFrame */
#ifndef Val_GtkFrame
#define GtkFrame_val(val) ((GtkFrame*)ext_of_val(val))
#define Val_GtkFrame(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFrame */


CAMLexport CAMLprim value ml_gtk_frame_new(value arg1)
{
CAMLparam1(arg1);
GtkFrame *obj = gtk_frame_new(String_option_val(arg1));
CAMLreturn(Val_GtkFrame(obj));
}

CAMLexport CAMLprim value ml_gtk_frame_set_label_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_label_widget(GtkFrame_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_set_label_align(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_label_align(GtkFrame_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_label(GtkFrame_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_child(GtkFrame_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_get_label_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_frame_get_label_widget(GtkFrame_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_frame_get_label_align(value self)
{
CAMLparam1(self);

float result = gtk_frame_get_label_align(GtkFrame_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_frame_get_label(value self)
{
CAMLparam1(self);

const char* result = gtk_frame_get_label(GtkFrame_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_frame_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_frame_get_child(GtkFrame_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}
