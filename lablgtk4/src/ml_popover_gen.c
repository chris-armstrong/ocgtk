/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Popover */

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

/* Type-specific conversion macros for GtkPopover */
#ifndef Val_GtkPopover
#define GtkPopover_val(val) ((GtkPopover*)ext_of_val(val))
#define Val_GtkPopover(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPopover */


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

gtk_popover_set_default_widget(GtkPopover_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_popover_set_child(GtkPopover_val(self), GtkWidget_option_val(arg1));
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
CAMLreturn(Val_GtkWidget_option(result));
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
