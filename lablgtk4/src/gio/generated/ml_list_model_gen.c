/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListModel */

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

/* Type-specific conversion macros for GListModel */
#ifndef Val_GListModel
#define GListModel_val(val) ((GListModel*)ext_of_val(val))
#define Val_GListModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GListModel */


CAMLexport CAMLprim value ml_g_list_model_items_changed(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_list_model_items_changed(GListModel_val(self), Int_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_list_model_get_n_items(value self)
{
CAMLparam1(self);

guint result = g_list_model_get_n_items(GListModel_val(self));
CAMLreturn(Val_int(result));
}
