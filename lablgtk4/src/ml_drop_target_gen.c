/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DropTarget */

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


CAMLexport CAMLprim value ml_gtk_drop_target_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_drop_target_new(arg1, GdkDragAction_val(arg2));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_drop_target_set_gtypes(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_drop_target_set_gtypes(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_set_actions(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_target_set_actions(GtkWidget_val(self), GdkDragAction_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_reject(value self)
{
CAMLparam1(self);


    gtk_drop_target_reject(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_gtypes(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_target_get_gtypes(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_actions(value self)
{
CAMLparam1(self);


    GdkDragAction result = gtk_drop_target_get_actions(GtkWidget_val(self));
CAMLreturn(Val_GdkDragAction(result));
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_preload(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "preload", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drop_target_set_preload(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "preload", c_value, NULL);
CAMLreturn(Val_unit);
}
