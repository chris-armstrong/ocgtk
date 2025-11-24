/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Accessible */

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


CAMLexport CAMLprim value ml_gtk_accessible_update_state_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_accessible_update_state_value(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_update_relation_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_accessible_update_relation_value(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_update_property_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_accessible_update_property_value(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_update_next_accessible_sibling(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_accessible_update_next_accessible_sibling(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_set_accessible_parent(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_accessible_set_accessible_parent(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_state(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_accessible_reset_state(GtkWidget_val(self), GtkAccessibleState_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_relation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_accessible_reset_relation(GtkWidget_val(self), GtkAccessibleRelation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_property(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_accessible_reset_property(GtkWidget_val(self), GtkAccessibleProperty_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_get_platform_state(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_accessible_get_platform_state(GtkWidget_val(self), GtkAccessiblePlatformState_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_next_accessible_sibling(value self)
{
CAMLparam1(self);


    GtkAccessible* result = gtk_accessible_get_next_accessible_sibling(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_first_accessible_child(value self)
{
CAMLparam1(self);


    GtkAccessible* result = gtk_accessible_get_first_accessible_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_bounds(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gboolean result = gtk_accessible_get_bounds(GtkWidget_val(self), arg1, arg2, arg3, arg4);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_at_context(value self)
{
CAMLparam1(self);


    GtkATContext* result = gtk_accessible_get_at_context(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_accessible_role(value self)
{
CAMLparam1(self);


    GtkAccessibleRole result = gtk_accessible_get_accessible_role(GtkWidget_val(self));
CAMLreturn(Val_GtkAccessibleRole(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_accessible_parent(value self)
{
CAMLparam1(self);


    GtkAccessible* result = gtk_accessible_get_accessible_parent(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_announce(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_accessible_announce(GtkWidget_val(self), String_val(arg1), GtkAccessibleAnnouncementPriority_val(arg2));
CAMLreturn(Val_unit);
}
