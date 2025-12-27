/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Popover */

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


CAMLexport CAMLprim value ml_gtk_popover_new(value unit)
{
CAMLparam1(unit);
GtkPopover *obj = gtk_popover_new();
CAMLreturn(Val_GtkPopover(obj));
}

CAMLexport CAMLprim value ml_gtk_popover_set_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_popover_set_position(GtkPopover_val(self), GtkPositionType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_set_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_popover_set_offset(GtkPopover_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_set_mnemonics_visible(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_popover_set_mnemonics_visible(GtkPopover_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_set_has_arrow(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_popover_set_has_arrow(GtkPopover_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_set_default_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_popover_set_default_widget(GtkPopover_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_popover_set_child(GtkPopover_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_set_cascade_popdown(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_popover_set_cascade_popdown(GtkPopover_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_set_autohide(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_popover_set_autohide(GtkPopover_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_present(value self)
{
CAMLparam1(self);

gtk_popover_present(GtkPopover_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_popup(value self)
{
CAMLparam1(self);

gtk_popover_popup(GtkPopover_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_popdown(value self)
{
CAMLparam1(self);

gtk_popover_popdown(GtkPopover_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_get_position(value self)
{
CAMLparam1(self);

GtkPositionType result = gtk_popover_get_position(GtkPopover_val(self));
CAMLreturn(Val_GtkPositionType(result));
}

CAMLexport CAMLprim value ml_gtk_popover_get_offset(value self)
{
CAMLparam1(self);
int out1;
int out2;

gtk_popover_get_offset(GtkPopover_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_int(out1));
    Store_field(ret, 1, Val_int(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_popover_get_mnemonics_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_popover_get_mnemonics_visible(GtkPopover_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_get_has_arrow(value self)
{
CAMLparam1(self);

gboolean result = gtk_popover_get_has_arrow(GtkPopover_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_popover_get_child(GtkPopover_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_popover_get_cascade_popdown(value self)
{
CAMLparam1(self);

gboolean result = gtk_popover_get_cascade_popdown(GtkPopover_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_get_autohide(value self)
{
CAMLparam1(self);

gboolean result = gtk_popover_get_autohide(GtkPopover_val(self));
CAMLreturn(Val_bool(result));
}
