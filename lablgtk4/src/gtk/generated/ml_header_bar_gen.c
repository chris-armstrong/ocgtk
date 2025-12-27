/* GENERATED CODE - DO NOT EDIT */
/* C bindings for HeaderBar */

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


CAMLexport CAMLprim value ml_gtk_header_bar_new(value unit)
{
CAMLparam1(unit);
GtkHeaderBar *obj = gtk_header_bar_new();
CAMLreturn(Val_GtkHeaderBar(obj));
}

CAMLexport CAMLprim value ml_gtk_header_bar_set_title_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_set_title_widget(GtkHeaderBar_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_set_show_title_buttons(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_set_show_title_buttons(GtkHeaderBar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_set_decoration_layout(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_set_decoration_layout(GtkHeaderBar_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_remove(GtkHeaderBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_pack_start(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_pack_start(GtkHeaderBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_pack_end(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_pack_end(GtkHeaderBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_get_title_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_header_bar_get_title_widget(GtkHeaderBar_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_header_bar_get_show_title_buttons(value self)
{
CAMLparam1(self);

gboolean result = gtk_header_bar_get_show_title_buttons(GtkHeaderBar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_header_bar_get_decoration_layout(value self)
{
CAMLparam1(self);

const char* result = gtk_header_bar_get_decoration_layout(GtkHeaderBar_val(self));
CAMLreturn(Val_option_string(result));
}
