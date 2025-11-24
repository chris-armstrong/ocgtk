/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListStore */

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


CAMLexport CAMLprim value ml_gtk_list_store_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_list_store_new(Int_val(arg1), arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_list_store_newv(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_list_store_newv(Int_val(arg1), arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_list_store_swap(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_store_swap(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_set_valuesv(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_list_store_set_valuesv(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3, Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_set_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_list_store_set_value(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_set_valist(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_store_set_valist(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_set_column_types(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_store_set_column_types(GtkWidget_val(self), Int_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_reorder(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_store_reorder(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_list_store_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_store_prepend(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_store_prepend(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_move_before(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_store_move_before(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_move_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_store_move_after(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_iter_is_valid(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_list_store_iter_is_valid(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_store_insert_with_valuesv_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_list_store_insert_with_valuesv(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), arg3, arg4, Int_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_insert_with_valuesv_bytecode(value * argv, int argn)
{
return ml_gtk_list_store_insert_with_valuesv_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_list_store_insert_before(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_store_insert_before(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_insert_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_store_insert_after(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_insert(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_store_insert(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_clear(value self)
{
CAMLparam1(self);


    gtk_list_store_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_append(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_store_append(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
