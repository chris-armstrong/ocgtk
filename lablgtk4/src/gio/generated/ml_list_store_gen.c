/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListStore */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_g_list_store_new(value arg1)
{
CAMLparam1(arg1);
GListStore *obj = g_list_store_new(arg1);
CAMLreturn(Val_GListStore(obj));
}

CAMLexport CAMLprim value ml_g_list_store_remove_all(value self)
{
CAMLparam1(self);

g_list_store_remove_all(GListStore_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_list_store_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

g_list_store_remove(GListStore_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GListStore *obj = (GListStore *)GListStore_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_list_store_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
