/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LayoutManager */

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

/* Type-specific conversion macros for GtkLayoutManager */
#ifndef Val_GtkLayoutManager
#define GtkLayoutManager_val(val) ((GtkLayoutManager*)ext_of_val(val))
#define Val_GtkLayoutManager(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkLayoutManager */


CAMLexport CAMLprim value ml_gtk_layout_manager_layout_changed(value self)
{
CAMLparam1(self);

gtk_layout_manager_layout_changed(GtkLayoutManager_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_layout_manager_get_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_layout_manager_get_widget(GtkLayoutManager_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_layout_manager_get_request_mode(value self)
{
CAMLparam1(self);

GtkSizeRequestMode result = gtk_layout_manager_get_request_mode(GtkLayoutManager_val(self));
CAMLreturn(Val_GtkSizeRequestMode(result));
}

CAMLexport CAMLprim value ml_gtk_layout_manager_get_layout_child(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkLayoutChild* result = gtk_layout_manager_get_layout_child(GtkLayoutManager_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkLayoutChild(result));
}

CAMLexport CAMLprim value ml_gtk_layout_manager_allocate(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_layout_manager_allocate(GtkLayoutManager_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_unit);
}
