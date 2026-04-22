/* GENERATED CODE - DO NOT EDIT */
/* Forward declarations for generated enum, bitfield, class and record converters */

#ifndef _gio_decls_h_
#define _gio_decls_h_

#include <gio/gio.h>
#if !(defined(_WIN32))
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#endif /* not windows */
#if defined(__linux__)
#include <gio/gdesktopappinfo.h>
#endif /* linux */
#include <caml/mlvalues.h>

/* Class-specific conversion macros (shared) */
#if GLIB_CHECK_VERSION(2,40,0)
#ifndef Val_GAppInfoMonitor
#define GAppInfoMonitor_val(val) ((GAppInfoMonitor*)ml_gobject_ext_of_val(val))
#define Val_GAppInfoMonitor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GAppInfoMonitor */

#endif
#ifndef Val_GAppLaunchContext
#define GAppLaunchContext_val(val) ((GAppLaunchContext*)ml_gobject_ext_of_val(val))
#define Val_GAppLaunchContext(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GAppLaunchContext */

#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GApplication
#define GApplication_val(val) ((GApplication*)ml_gobject_ext_of_val(val))
#define Val_GApplication(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GApplication */

#endif
#ifndef Val_GApplicationCommandLine
#define GApplicationCommandLine_val(val) ((GApplicationCommandLine*)ml_gobject_ext_of_val(val))
#define Val_GApplicationCommandLine(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GApplicationCommandLine */

#ifndef Val_GBufferedInputStream
#define GBufferedInputStream_val(val) ((GBufferedInputStream*)ml_gobject_ext_of_val(val))
#define Val_GBufferedInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GBufferedInputStream */

#ifndef Val_GBufferedOutputStream
#define GBufferedOutputStream_val(val) ((GBufferedOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GBufferedOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GBufferedOutputStream */

#if GLIB_CHECK_VERSION(2,38,0)
#ifndef Val_GBytesIcon
#define GBytesIcon_val(val) ((GBytesIcon*)ml_gobject_ext_of_val(val))
#define Val_GBytesIcon(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GBytesIcon */

#endif
#ifndef Val_GCancellable
#define GCancellable_val(val) ((GCancellable*)ml_gobject_ext_of_val(val))
#define Val_GCancellable(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GCancellable */

#ifndef Val_GCharsetConverter
#define GCharsetConverter_val(val) ((GCharsetConverter*)ml_gobject_ext_of_val(val))
#define Val_GCharsetConverter(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GCharsetConverter */

#ifndef Val_GConverterInputStream
#define GConverterInputStream_val(val) ((GConverterInputStream*)ml_gobject_ext_of_val(val))
#define Val_GConverterInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GConverterInputStream */

#ifndef Val_GConverterOutputStream
#define GConverterOutputStream_val(val) ((GConverterOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GConverterOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GConverterOutputStream */

#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GCredentials
#define GCredentials_val(val) ((GCredentials*)ml_gobject_ext_of_val(val))
#define Val_GCredentials(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GCredentials */

#endif
#ifndef Val_GDBusActionGroup
#define GDBusActionGroup_val(val) ((GDBusActionGroup*)ml_gobject_ext_of_val(val))
#define Val_GDBusActionGroup(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusActionGroup */

#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GDBusAuthObserver
#define GDBusAuthObserver_val(val) ((GDBusAuthObserver*)ml_gobject_ext_of_val(val))
#define Val_GDBusAuthObserver(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusAuthObserver */

#endif
#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GDBusConnection
#define GDBusConnection_val(val) ((GDBusConnection*)ml_gobject_ext_of_val(val))
#define Val_GDBusConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusConnection */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GDBusInterfaceSkeleton
#define GDBusInterfaceSkeleton_val(val) ((GDBusInterfaceSkeleton*)ml_gobject_ext_of_val(val))
#define Val_GDBusInterfaceSkeleton(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusInterfaceSkeleton */

#endif
#ifndef Val_GDBusMenuModel
#define GDBusMenuModel_val(val) ((GDBusMenuModel*)ml_gobject_ext_of_val(val))
#define Val_GDBusMenuModel(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusMenuModel */

#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GDBusMessage
#define GDBusMessage_val(val) ((GDBusMessage*)ml_gobject_ext_of_val(val))
#define Val_GDBusMessage(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusMessage */

#endif
#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GDBusMethodInvocation
#define GDBusMethodInvocation_val(val) ((GDBusMethodInvocation*)ml_gobject_ext_of_val(val))
#define Val_GDBusMethodInvocation(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusMethodInvocation */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GDBusObjectManagerClient
#define GDBusObjectManagerClient_val(val) ((GDBusObjectManagerClient*)ml_gobject_ext_of_val(val))
#define Val_GDBusObjectManagerClient(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusObjectManagerClient */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GDBusObjectManagerServer
#define GDBusObjectManagerServer_val(val) ((GDBusObjectManagerServer*)ml_gobject_ext_of_val(val))
#define Val_GDBusObjectManagerServer(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusObjectManagerServer */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GDBusObjectProxy
#define GDBusObjectProxy_val(val) ((GDBusObjectProxy*)ml_gobject_ext_of_val(val))
#define Val_GDBusObjectProxy(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusObjectProxy */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GDBusObjectSkeleton
#define GDBusObjectSkeleton_val(val) ((GDBusObjectSkeleton*)ml_gobject_ext_of_val(val))
#define Val_GDBusObjectSkeleton(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusObjectSkeleton */

#endif
#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GDBusProxy
#define GDBusProxy_val(val) ((GDBusProxy*)ml_gobject_ext_of_val(val))
#define Val_GDBusProxy(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusProxy */

#endif
#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GDBusServer
#define GDBusServer_val(val) ((GDBusServer*)ml_gobject_ext_of_val(val))
#define Val_GDBusServer(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusServer */

#endif
#ifndef Val_GDataInputStream
#define GDataInputStream_val(val) ((GDataInputStream*)ml_gobject_ext_of_val(val))
#define Val_GDataInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDataInputStream */

#ifndef Val_GDataOutputStream
#define GDataOutputStream_val(val) ((GDataOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GDataOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDataOutputStream */

#if GLIB_CHECK_VERSION(2,72,0)
#ifndef Val_GDebugControllerDBus
#define GDebugControllerDBus_val(val) ((GDebugControllerDBus*)ml_gobject_ext_of_val(val))
#define Val_GDebugControllerDBus(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDebugControllerDBus */

#endif
#if defined(__linux__)
#ifndef Val_GDesktopAppInfo
#define GDesktopAppInfo_val(val) ((GDesktopAppInfo*)ml_gobject_ext_of_val(val))
#define Val_GDesktopAppInfo(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDesktopAppInfo */

#endif /* linux */
#ifndef Val_GEmblem
#define GEmblem_val(val) ((GEmblem*)ml_gobject_ext_of_val(val))
#define Val_GEmblem(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GEmblem */

#ifndef Val_GEmblemedIcon
#define GEmblemedIcon_val(val) ((GEmblemedIcon*)ml_gobject_ext_of_val(val))
#define Val_GEmblemedIcon(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GEmblemedIcon */

#ifndef Val_GFileEnumerator
#define GFileEnumerator_val(val) ((GFileEnumerator*)ml_gobject_ext_of_val(val))
#define Val_GFileEnumerator(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFileEnumerator */

#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GFileIOStream
#define GFileIOStream_val(val) ((GFileIOStream*)ml_gobject_ext_of_val(val))
#define Val_GFileIOStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFileIOStream */

#endif
#ifndef Val_GFileIcon
#define GFileIcon_val(val) ((GFileIcon*)ml_gobject_ext_of_val(val))
#define Val_GFileIcon(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFileIcon */

#ifndef Val_GFileInfo
#define GFileInfo_val(val) ((GFileInfo*)ml_gobject_ext_of_val(val))
#define Val_GFileInfo(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFileInfo */

#ifndef Val_GFileInputStream
#define GFileInputStream_val(val) ((GFileInputStream*)ml_gobject_ext_of_val(val))
#define Val_GFileInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFileInputStream */

#ifndef Val_GFileMonitor
#define GFileMonitor_val(val) ((GFileMonitor*)ml_gobject_ext_of_val(val))
#define Val_GFileMonitor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFileMonitor */

#ifndef Val_GFileOutputStream
#define GFileOutputStream_val(val) ((GFileOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GFileOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFileOutputStream */

#ifndef Val_GFilenameCompleter
#define GFilenameCompleter_val(val) ((GFilenameCompleter*)ml_gobject_ext_of_val(val))
#define Val_GFilenameCompleter(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFilenameCompleter */

#ifndef Val_GFilterInputStream
#define GFilterInputStream_val(val) ((GFilterInputStream*)ml_gobject_ext_of_val(val))
#define Val_GFilterInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFilterInputStream */

#ifndef Val_GFilterOutputStream
#define GFilterOutputStream_val(val) ((GFilterOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GFilterOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFilterOutputStream */

#ifndef Val_GIOModule
#define GIOModule_val(val) ((GIOModule*)ml_gobject_ext_of_val(val))
#define Val_GIOModule(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GIOModule */

#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GIOStream
#define GIOStream_val(val) ((GIOStream*)ml_gobject_ext_of_val(val))
#define Val_GIOStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GIOStream */

#endif
#ifndef Val_GInetAddress
#define GInetAddress_val(val) ((GInetAddress*)ml_gobject_ext_of_val(val))
#define Val_GInetAddress(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GInetAddress */

#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GInetAddressMask
#define GInetAddressMask_val(val) ((GInetAddressMask*)ml_gobject_ext_of_val(val))
#define Val_GInetAddressMask(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GInetAddressMask */

#endif
#ifndef Val_GInetSocketAddress
#define GInetSocketAddress_val(val) ((GInetSocketAddress*)ml_gobject_ext_of_val(val))
#define Val_GInetSocketAddress(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GInetSocketAddress */

#ifndef Val_GInputStream
#define GInputStream_val(val) ((GInputStream*)ml_gobject_ext_of_val(val))
#define Val_GInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GInputStream */

#ifndef Val_GListStore
#define GListStore_val(val) ((GListStore*)ml_gobject_ext_of_val(val))
#define Val_GListStore(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GListStore */

#ifndef Val_GMemoryInputStream
#define GMemoryInputStream_val(val) ((GMemoryInputStream*)ml_gobject_ext_of_val(val))
#define Val_GMemoryInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMemoryInputStream */

#ifndef Val_GMemoryOutputStream
#define GMemoryOutputStream_val(val) ((GMemoryOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GMemoryOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMemoryOutputStream */

#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GMenu
#define GMenu_val(val) ((GMenu*)ml_gobject_ext_of_val(val))
#define Val_GMenu(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMenu */

#endif
#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GMenuAttributeIter
#define GMenuAttributeIter_val(val) ((GMenuAttributeIter*)ml_gobject_ext_of_val(val))
#define Val_GMenuAttributeIter(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMenuAttributeIter */

#endif
#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GMenuItem
#define GMenuItem_val(val) ((GMenuItem*)ml_gobject_ext_of_val(val))
#define Val_GMenuItem(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMenuItem */

#endif
#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GMenuLinkIter
#define GMenuLinkIter_val(val) ((GMenuLinkIter*)ml_gobject_ext_of_val(val))
#define Val_GMenuLinkIter(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMenuLinkIter */

#endif
#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GMenuModel
#define GMenuModel_val(val) ((GMenuModel*)ml_gobject_ext_of_val(val))
#define Val_GMenuModel(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMenuModel */

#endif
#ifndef Val_GMountOperation
#define GMountOperation_val(val) ((GMountOperation*)ml_gobject_ext_of_val(val))
#define Val_GMountOperation(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMountOperation */

#if GLIB_CHECK_VERSION(2,46,0)
#ifndef Val_GNativeSocketAddress
#define GNativeSocketAddress_val(val) ((GNativeSocketAddress*)ml_gobject_ext_of_val(val))
#define Val_GNativeSocketAddress(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GNativeSocketAddress */

#endif
#ifndef Val_GNativeVolumeMonitor
#define GNativeVolumeMonitor_val(val) ((GNativeVolumeMonitor*)ml_gobject_ext_of_val(val))
#define Val_GNativeVolumeMonitor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GNativeVolumeMonitor */

#ifndef Val_GNetworkAddress
#define GNetworkAddress_val(val) ((GNetworkAddress*)ml_gobject_ext_of_val(val))
#define Val_GNetworkAddress(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GNetworkAddress */

#ifndef Val_GNetworkService
#define GNetworkService_val(val) ((GNetworkService*)ml_gobject_ext_of_val(val))
#define Val_GNetworkService(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GNetworkService */

#if GLIB_CHECK_VERSION(2,40,0)
#ifndef Val_GNotification
#define GNotification_val(val) ((GNotification*)ml_gobject_ext_of_val(val))
#define Val_GNotification(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GNotification */

#endif
#ifndef Val_GOutputStream
#define GOutputStream_val(val) ((GOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GOutputStream */

#ifndef Val_GPermission
#define GPermission_val(val) ((GPermission*)ml_gobject_ext_of_val(val))
#define Val_GPermission(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GPermission */

#if GLIB_CHECK_VERSION(2,38,0)
#ifndef Val_GPropertyAction
#define GPropertyAction_val(val) ((GPropertyAction*)ml_gobject_ext_of_val(val))
#define Val_GPropertyAction(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GPropertyAction */

#endif
#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GProxyAddress
#define GProxyAddress_val(val) ((GProxyAddress*)ml_gobject_ext_of_val(val))
#define Val_GProxyAddress(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GProxyAddress */

#endif
#ifndef Val_GProxyAddressEnumerator
#define GProxyAddressEnumerator_val(val) ((GProxyAddressEnumerator*)ml_gobject_ext_of_val(val))
#define Val_GProxyAddressEnumerator(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GProxyAddressEnumerator */

#ifndef Val_GResolver
#define GResolver_val(val) ((GResolver*)ml_gobject_ext_of_val(val))
#define Val_GResolver(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GResolver */

#ifndef Val_GSettings
#define GSettings_val(val) ((GSettings*)ml_gobject_ext_of_val(val))
#define Val_GSettings(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSettings */

#ifndef Val_GSimpleAction
#define GSimpleAction_val(val) ((GSimpleAction*)ml_gobject_ext_of_val(val))
#define Val_GSimpleAction(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSimpleAction */

#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GSimpleActionGroup
#define GSimpleActionGroup_val(val) ((GSimpleActionGroup*)ml_gobject_ext_of_val(val))
#define Val_GSimpleActionGroup(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSimpleActionGroup */

#endif
#ifndef Val_GSimpleAsyncResult
#define GSimpleAsyncResult_val(val) ((GSimpleAsyncResult*)ml_gobject_ext_of_val(val))
#define Val_GSimpleAsyncResult(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSimpleAsyncResult */

#if GLIB_CHECK_VERSION(2,44,0)
#ifndef Val_GSimpleIOStream
#define GSimpleIOStream_val(val) ((GSimpleIOStream*)ml_gobject_ext_of_val(val))
#define Val_GSimpleIOStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSimpleIOStream */

#endif
#ifndef Val_GSimplePermission
#define GSimplePermission_val(val) ((GSimplePermission*)ml_gobject_ext_of_val(val))
#define Val_GSimplePermission(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSimplePermission */

#if GLIB_CHECK_VERSION(2,36,0)
#ifndef Val_GSimpleProxyResolver
#define GSimpleProxyResolver_val(val) ((GSimpleProxyResolver*)ml_gobject_ext_of_val(val))
#define Val_GSimpleProxyResolver(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSimpleProxyResolver */

#endif
#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GSocket
#define GSocket_val(val) ((GSocket*)ml_gobject_ext_of_val(val))
#define Val_GSocket(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocket */

#endif
#ifndef Val_GSocketAddress
#define GSocketAddress_val(val) ((GSocketAddress*)ml_gobject_ext_of_val(val))
#define Val_GSocketAddress(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocketAddress */

#ifndef Val_GSocketAddressEnumerator
#define GSocketAddressEnumerator_val(val) ((GSocketAddressEnumerator*)ml_gobject_ext_of_val(val))
#define Val_GSocketAddressEnumerator(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocketAddressEnumerator */

#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GSocketClient
#define GSocketClient_val(val) ((GSocketClient*)ml_gobject_ext_of_val(val))
#define Val_GSocketClient(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocketClient */

#endif
#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GSocketConnection
#define GSocketConnection_val(val) ((GSocketConnection*)ml_gobject_ext_of_val(val))
#define Val_GSocketConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocketConnection */

#endif
#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GSocketControlMessage
#define GSocketControlMessage_val(val) ((GSocketControlMessage*)ml_gobject_ext_of_val(val))
#define Val_GSocketControlMessage(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocketControlMessage */

#endif
#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GSocketListener
#define GSocketListener_val(val) ((GSocketListener*)ml_gobject_ext_of_val(val))
#define Val_GSocketListener(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocketListener */

#endif
#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GSocketService
#define GSocketService_val(val) ((GSocketService*)ml_gobject_ext_of_val(val))
#define Val_GSocketService(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocketService */

#endif
#if GLIB_CHECK_VERSION(2,40,0)
#ifndef Val_GSubprocess
#define GSubprocess_val(val) ((GSubprocess*)ml_gobject_ext_of_val(val))
#define Val_GSubprocess(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSubprocess */

#endif
#if GLIB_CHECK_VERSION(2,40,0)
#ifndef Val_GSubprocessLauncher
#define GSubprocessLauncher_val(val) ((GSubprocessLauncher*)ml_gobject_ext_of_val(val))
#define Val_GSubprocessLauncher(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSubprocessLauncher */

#endif
#ifndef Val_GTask
#define GTask_val(val) ((GTask*)ml_gobject_ext_of_val(val))
#define Val_GTask(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTask */

#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GTcpConnection
#define GTcpConnection_val(val) ((GTcpConnection*)ml_gobject_ext_of_val(val))
#define Val_GTcpConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTcpConnection */

#endif
#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GTcpWrapperConnection
#define GTcpWrapperConnection_val(val) ((GTcpWrapperConnection*)ml_gobject_ext_of_val(val))
#define Val_GTcpWrapperConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTcpWrapperConnection */

#endif
#if GLIB_CHECK_VERSION(2,34,0)
#ifndef Val_GTestDBus
#define GTestDBus_val(val) ((GTestDBus*)ml_gobject_ext_of_val(val))
#define Val_GTestDBus(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTestDBus */

#endif
#ifndef Val_GThemedIcon
#define GThemedIcon_val(val) ((GThemedIcon*)ml_gobject_ext_of_val(val))
#define Val_GThemedIcon(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GThemedIcon */

#if GLIB_CHECK_VERSION(2,20,0)
#ifndef Val_GThreadedResolver
#define GThreadedResolver_val(val) ((GThreadedResolver*)ml_gobject_ext_of_val(val))
#define Val_GThreadedResolver(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GThreadedResolver */

#endif
#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GThreadedSocketService
#define GThreadedSocketService_val(val) ((GThreadedSocketService*)ml_gobject_ext_of_val(val))
#define Val_GThreadedSocketService(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GThreadedSocketService */

#endif
#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GTlsCertificate
#define GTlsCertificate_val(val) ((GTlsCertificate*)ml_gobject_ext_of_val(val))
#define Val_GTlsCertificate(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsCertificate */

#endif
#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GTlsConnection
#define GTlsConnection_val(val) ((GTlsConnection*)ml_gobject_ext_of_val(val))
#define Val_GTlsConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsConnection */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GTlsDatabase
#define GTlsDatabase_val(val) ((GTlsDatabase*)ml_gobject_ext_of_val(val))
#define Val_GTlsDatabase(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsDatabase */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GTlsInteraction
#define GTlsInteraction_val(val) ((GTlsInteraction*)ml_gobject_ext_of_val(val))
#define Val_GTlsInteraction(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsInteraction */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GTlsPassword
#define GTlsPassword_val(val) ((GTlsPassword*)ml_gobject_ext_of_val(val))
#define Val_GTlsPassword(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsPassword */

#endif
#if !(defined(_WIN32))
#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GUnixConnection
#define GUnixConnection_val(val) ((GUnixConnection*)ml_gobject_ext_of_val(val))
#define Val_GUnixConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GUnixConnection */

#endif
#endif /* not windows */
#if !(defined(_WIN32))
#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GUnixCredentialsMessage
#define GUnixCredentialsMessage_val(val) ((GUnixCredentialsMessage*)ml_gobject_ext_of_val(val))
#define Val_GUnixCredentialsMessage(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GUnixCredentialsMessage */

#endif
#endif /* not windows */
#ifndef Val_GUnixFDList
#define GUnixFDList_val(val) ((GUnixFDList*)ml_gobject_ext_of_val(val))
#define Val_GUnixFDList(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GUnixFDList */

#if !(defined(_WIN32))
#ifndef Val_GUnixFDMessage
#define GUnixFDMessage_val(val) ((GUnixFDMessage*)ml_gobject_ext_of_val(val))
#define Val_GUnixFDMessage(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GUnixFDMessage */

#endif /* not windows */
#if !(defined(_WIN32))
#ifndef Val_GUnixInputStream
#define GUnixInputStream_val(val) ((GUnixInputStream*)ml_gobject_ext_of_val(val))
#define Val_GUnixInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GUnixInputStream */

#endif /* not windows */
#if !(defined(_WIN32))
#ifndef Val_GUnixMountMonitor
#define GUnixMountMonitor_val(val) ((GUnixMountMonitor*)ml_gobject_ext_of_val(val))
#define Val_GUnixMountMonitor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GUnixMountMonitor */

#endif /* not windows */
#if !(defined(_WIN32))
#ifndef Val_GUnixOutputStream
#define GUnixOutputStream_val(val) ((GUnixOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GUnixOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GUnixOutputStream */

#endif /* not windows */
#if !(defined(_WIN32))
#ifndef Val_GUnixSocketAddress
#define GUnixSocketAddress_val(val) ((GUnixSocketAddress*)ml_gobject_ext_of_val(val))
#define Val_GUnixSocketAddress(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GUnixSocketAddress */

#endif /* not windows */
#ifndef Val_GVfs
#define GVfs_val(val) ((GVfs*)ml_gobject_ext_of_val(val))
#define Val_GVfs(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GVfs */

#ifndef Val_GVolumeMonitor
#define GVolumeMonitor_val(val) ((GVolumeMonitor*)ml_gobject_ext_of_val(val))
#define Val_GVolumeMonitor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GVolumeMonitor */

#ifndef Val_GZlibCompressor
#define GZlibCompressor_val(val) ((GZlibCompressor*)ml_gobject_ext_of_val(val))
#define Val_GZlibCompressor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GZlibCompressor */

#ifndef Val_GZlibDecompressor
#define GZlibDecompressor_val(val) ((GZlibDecompressor*)ml_gobject_ext_of_val(val))
#define Val_GZlibDecompressor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GZlibDecompressor */

/* Interface-specific conversion macros (shared) */
#ifndef Val_GAction
#define GAction_val(val) ((GAction*)ml_gobject_ext_of_val(val))
#define Val_GAction(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GAction */

#ifndef Val_GActionGroup
#define GActionGroup_val(val) ((GActionGroup*)ml_gobject_ext_of_val(val))
#define Val_GActionGroup(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GActionGroup */

#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GActionMap
#define GActionMap_val(val) ((GActionMap*)ml_gobject_ext_of_val(val))
#define Val_GActionMap(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GActionMap */

#endif
#ifndef Val_GAppInfo
#define GAppInfo_val(val) ((GAppInfo*)ml_gobject_ext_of_val(val))
#define Val_GAppInfo(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GAppInfo */

#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GAsyncInitable
#define GAsyncInitable_val(val) ((GAsyncInitable*)ml_gobject_ext_of_val(val))
#define Val_GAsyncInitable(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GAsyncInitable */

#endif
#ifndef Val_GAsyncResult
#define GAsyncResult_val(val) ((GAsyncResult*)ml_gobject_ext_of_val(val))
#define Val_GAsyncResult(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GAsyncResult */

#if GLIB_CHECK_VERSION(2,24,0)
#ifndef Val_GConverter
#define GConverter_val(val) ((GConverter*)ml_gobject_ext_of_val(val))
#define Val_GConverter(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GConverter */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GDBusInterface
#define GDBusInterface_val(val) ((GDBusInterface*)ml_gobject_ext_of_val(val))
#define Val_GDBusInterface(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusInterface */

#endif
#ifndef Val_GDBusObject
#define GDBusObject_val(val) ((GDBusObject*)ml_gobject_ext_of_val(val))
#define Val_GDBusObject(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusObject */

#ifndef Val_GDBusObjectManager
#define GDBusObjectManager_val(val) ((GDBusObjectManager*)ml_gobject_ext_of_val(val))
#define Val_GDBusObjectManager(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDBusObjectManager */

#if GLIB_CHECK_VERSION(2,48,0)
#ifndef Val_GDatagramBased
#define GDatagramBased_val(val) ((GDatagramBased*)ml_gobject_ext_of_val(val))
#define Val_GDatagramBased(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDatagramBased */

#endif
#if GLIB_CHECK_VERSION(2,72,0)
#ifndef Val_GDebugController
#define GDebugController_val(val) ((GDebugController*)ml_gobject_ext_of_val(val))
#define Val_GDebugController(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDebugController */

#endif
#if defined(__linux__)
#ifndef Val_GDesktopAppInfoLookup
#define GDesktopAppInfoLookup_val(val) ((GDesktopAppInfoLookup*)ml_gobject_ext_of_val(val))
#define Val_GDesktopAppInfoLookup(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDesktopAppInfoLookup */

#endif /* linux */
#ifndef Val_GDrive
#define GDrive_val(val) ((GDrive*)ml_gobject_ext_of_val(val))
#define Val_GDrive(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDrive */

#if GLIB_CHECK_VERSION(2,48,0)
#ifndef Val_GDtlsClientConnection
#define GDtlsClientConnection_val(val) ((GDtlsClientConnection*)ml_gobject_ext_of_val(val))
#define Val_GDtlsClientConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDtlsClientConnection */

#endif
#if GLIB_CHECK_VERSION(2,48,0)
#ifndef Val_GDtlsConnection
#define GDtlsConnection_val(val) ((GDtlsConnection*)ml_gobject_ext_of_val(val))
#define Val_GDtlsConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDtlsConnection */

#endif
#if GLIB_CHECK_VERSION(2,48,0)
#ifndef Val_GDtlsServerConnection
#define GDtlsServerConnection_val(val) ((GDtlsServerConnection*)ml_gobject_ext_of_val(val))
#define Val_GDtlsServerConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GDtlsServerConnection */

#endif
#ifndef Val_GFile
#define GFile_val(val) ((GFile*)ml_gobject_ext_of_val(val))
#define Val_GFile(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFile */

#if defined(__linux__)
#if GLIB_CHECK_VERSION(2,24,0)
#ifndef Val_GFileDescriptorBased
#define GFileDescriptorBased_val(val) ((GFileDescriptorBased*)ml_gobject_ext_of_val(val))
#define Val_GFileDescriptorBased(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GFileDescriptorBased */

#endif
#endif /* linux */
#ifndef Val_GIcon
#define GIcon_val(val) ((GIcon*)ml_gobject_ext_of_val(val))
#define Val_GIcon(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GIcon */

#if GLIB_CHECK_VERSION(2,22,0)
#ifndef Val_GInitable
#define GInitable_val(val) ((GInitable*)ml_gobject_ext_of_val(val))
#define Val_GInitable(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GInitable */

#endif
#ifndef Val_GListModel
#define GListModel_val(val) ((GListModel*)ml_gobject_ext_of_val(val))
#define Val_GListModel(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GListModel */

#ifndef Val_GLoadableIcon
#define GLoadableIcon_val(val) ((GLoadableIcon*)ml_gobject_ext_of_val(val))
#define Val_GLoadableIcon(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GLoadableIcon */

#if GLIB_CHECK_VERSION(2,64,0)
#ifndef Val_GMemoryMonitor
#define GMemoryMonitor_val(val) ((GMemoryMonitor*)ml_gobject_ext_of_val(val))
#define Val_GMemoryMonitor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMemoryMonitor */

#endif
#ifndef Val_GMount
#define GMount_val(val) ((GMount*)ml_gobject_ext_of_val(val))
#define Val_GMount(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GMount */

#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GNetworkMonitor
#define GNetworkMonitor_val(val) ((GNetworkMonitor*)ml_gobject_ext_of_val(val))
#define Val_GNetworkMonitor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GNetworkMonitor */

#endif
#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GPollableInputStream
#define GPollableInputStream_val(val) ((GPollableInputStream*)ml_gobject_ext_of_val(val))
#define Val_GPollableInputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GPollableInputStream */

#endif
#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GPollableOutputStream
#define GPollableOutputStream_val(val) ((GPollableOutputStream*)ml_gobject_ext_of_val(val))
#define Val_GPollableOutputStream(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GPollableOutputStream */

#endif
#if GLIB_CHECK_VERSION(2,70,0)
#ifndef Val_GPowerProfileMonitor
#define GPowerProfileMonitor_val(val) ((GPowerProfileMonitor*)ml_gobject_ext_of_val(val))
#define Val_GPowerProfileMonitor(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GPowerProfileMonitor */

#endif
#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GProxy
#define GProxy_val(val) ((GProxy*)ml_gobject_ext_of_val(val))
#define Val_GProxy(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GProxy */

#endif
#if GLIB_CHECK_VERSION(2,26,0)
#ifndef Val_GProxyResolver
#define GProxyResolver_val(val) ((GProxyResolver*)ml_gobject_ext_of_val(val))
#define Val_GProxyResolver(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GProxyResolver */

#endif
#if GLIB_CHECK_VERSION(2,32,0)
#ifndef Val_GRemoteActionGroup
#define GRemoteActionGroup_val(val) ((GRemoteActionGroup*)ml_gobject_ext_of_val(val))
#define Val_GRemoteActionGroup(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GRemoteActionGroup */

#endif
#ifndef Val_GSeekable
#define GSeekable_val(val) ((GSeekable*)ml_gobject_ext_of_val(val))
#define Val_GSeekable(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSeekable */

#ifndef Val_GSocketConnectable
#define GSocketConnectable_val(val) ((GSocketConnectable*)ml_gobject_ext_of_val(val))
#define Val_GSocketConnectable(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GSocketConnectable */

#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GTlsBackend
#define GTlsBackend_val(val) ((GTlsBackend*)ml_gobject_ext_of_val(val))
#define Val_GTlsBackend(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsBackend */

#endif
#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GTlsClientConnection
#define GTlsClientConnection_val(val) ((GTlsClientConnection*)ml_gobject_ext_of_val(val))
#define Val_GTlsClientConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsClientConnection */

#endif
#if GLIB_CHECK_VERSION(2,30,0)
#ifndef Val_GTlsFileDatabase
#define GTlsFileDatabase_val(val) ((GTlsFileDatabase*)ml_gobject_ext_of_val(val))
#define Val_GTlsFileDatabase(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsFileDatabase */

#endif
#if GLIB_CHECK_VERSION(2,28,0)
#ifndef Val_GTlsServerConnection
#define GTlsServerConnection_val(val) ((GTlsServerConnection*)ml_gobject_ext_of_val(val))
#define Val_GTlsServerConnection(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GTlsServerConnection */

#endif
#ifndef Val_GVolume
#define GVolume_val(val) ((GVolume*)ml_gobject_ext_of_val(val))
#define Val_GVolume(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GVolume */

/* Forward declarations for record converters (non-opaque records) */
/* Forward declarations for GActionEntry converters */
GActionEntry *GActionEntry_val(value val);
value Val_GActionEntry(const GActionEntry *ptr);
value Val_GActionEntry_option(const GActionEntry *ptr);

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusAnnotationInfo converters */
GDBusAnnotationInfo *GDBusAnnotationInfo_val(value val);
value Val_GDBusAnnotationInfo(const GDBusAnnotationInfo *ptr);
value Val_GDBusAnnotationInfo_option(const GDBusAnnotationInfo *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusArgInfo converters */
GDBusArgInfo *GDBusArgInfo_val(value val);
value Val_GDBusArgInfo(const GDBusArgInfo *ptr);
value Val_GDBusArgInfo_option(const GDBusArgInfo *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusErrorEntry converters */
GDBusErrorEntry *GDBusErrorEntry_val(value val);
value Val_GDBusErrorEntry(const GDBusErrorEntry *ptr);
value Val_GDBusErrorEntry_option(const GDBusErrorEntry *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusInterfaceInfo converters */
GDBusInterfaceInfo *GDBusInterfaceInfo_val(value val);
value Val_GDBusInterfaceInfo(const GDBusInterfaceInfo *ptr);
value Val_GDBusInterfaceInfo_option(const GDBusInterfaceInfo *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusInterfaceVTable converters */
GDBusInterfaceVTable *GDBusInterfaceVTable_val(value val);
value Val_GDBusInterfaceVTable(const GDBusInterfaceVTable *ptr);
value Val_GDBusInterfaceVTable_option(const GDBusInterfaceVTable *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusMethodInfo converters */
GDBusMethodInfo *GDBusMethodInfo_val(value val);
value Val_GDBusMethodInfo(const GDBusMethodInfo *ptr);
value Val_GDBusMethodInfo_option(const GDBusMethodInfo *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusNodeInfo converters */
GDBusNodeInfo *GDBusNodeInfo_val(value val);
value Val_GDBusNodeInfo(const GDBusNodeInfo *ptr);
value Val_GDBusNodeInfo_option(const GDBusNodeInfo *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusPropertyInfo converters */
GDBusPropertyInfo *GDBusPropertyInfo_val(value val);
value Val_GDBusPropertyInfo(const GDBusPropertyInfo *ptr);
value Val_GDBusPropertyInfo_option(const GDBusPropertyInfo *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusSignalInfo converters */
GDBusSignalInfo *GDBusSignalInfo_val(value val);
value Val_GDBusSignalInfo(const GDBusSignalInfo *ptr);
value Val_GDBusSignalInfo_option(const GDBusSignalInfo *ptr);
#endif

#if GLIB_CHECK_VERSION(2,26,0)
/* Forward declarations for GDBusSubtreeVTable converters */
GDBusSubtreeVTable *GDBusSubtreeVTable_val(value val);
value Val_GDBusSubtreeVTable(const GDBusSubtreeVTable *ptr);
value Val_GDBusSubtreeVTable_option(const GDBusSubtreeVTable *ptr);
#endif

/* Forward declarations for GFileAttributeInfo converters */
GFileAttributeInfo *GFileAttributeInfo_val(value val);
value Val_GFileAttributeInfo(const GFileAttributeInfo *ptr);
value Val_GFileAttributeInfo_option(const GFileAttributeInfo *ptr);

/* Forward declarations for GFileAttributeInfoList converters */
GFileAttributeInfoList *GFileAttributeInfoList_val(value val);
value Val_GFileAttributeInfoList(const GFileAttributeInfoList *ptr);
value Val_GFileAttributeInfoList_option(const GFileAttributeInfoList *ptr);

/* Forward declarations for GFileAttributeMatcher converters */
GFileAttributeMatcher *GFileAttributeMatcher_val(value val);
value Val_GFileAttributeMatcher(const GFileAttributeMatcher *ptr);
value Val_GFileAttributeMatcher_option(const GFileAttributeMatcher *ptr);

/* Forward declarations for GIOExtension converters */
GIOExtension *GIOExtension_val(value val);
value Val_GIOExtension(const GIOExtension *ptr);
value Val_GIOExtension_option(const GIOExtension *ptr);

/* Forward declarations for GIOExtensionPoint converters */
GIOExtensionPoint *GIOExtensionPoint_val(value val);
value Val_GIOExtensionPoint(const GIOExtensionPoint *ptr);
value Val_GIOExtensionPoint_option(const GIOExtensionPoint *ptr);

#if GLIB_CHECK_VERSION(2,30,0)
/* Forward declarations for GIOModuleScope converters */
GIOModuleScope *GIOModuleScope_val(value val);
value Val_GIOModuleScope(const GIOModuleScope *ptr);
value Val_GIOModuleScope_option(const GIOModuleScope *ptr);
#endif

/* Forward declarations for GIOSchedulerJob converters */
GIOSchedulerJob *GIOSchedulerJob_val(value val);
value Val_GIOSchedulerJob(const GIOSchedulerJob *ptr);
value Val_GIOSchedulerJob_option(const GIOSchedulerJob *ptr);

/* Forward declarations for GIOStreamAdapter converters */
GIOStreamAdapter *GIOStreamAdapter_val(value val);
value Val_GIOStreamAdapter(const GIOStreamAdapter *ptr);
value Val_GIOStreamAdapter_option(const GIOStreamAdapter *ptr);

#if GLIB_CHECK_VERSION(2,48,0)
/* Forward declarations for GInputMessage converters */
GInputMessage *GInputMessage_val(value val);
value Val_GInputMessage(const GInputMessage *ptr);
value Val_GInputMessage_option(const GInputMessage *ptr);
#endif

#if GLIB_CHECK_VERSION(2,22,0)
/* Forward declarations for GInputVector converters */
GInputVector *GInputVector_val(value val);
value Val_GInputVector(const GInputVector *ptr);
value Val_GInputVector_option(const GInputVector *ptr);
#endif

#if GLIB_CHECK_VERSION(2,44,0)
/* Forward declarations for GOutputMessage converters */
GOutputMessage *GOutputMessage_val(value val);
value Val_GOutputMessage(const GOutputMessage *ptr);
value Val_GOutputMessage_option(const GOutputMessage *ptr);
#endif

#if GLIB_CHECK_VERSION(2,22,0)
/* Forward declarations for GOutputVector converters */
GOutputVector *GOutputVector_val(value val);
value Val_GOutputVector(const GOutputVector *ptr);
value Val_GOutputVector_option(const GOutputVector *ptr);
#endif

#if GLIB_CHECK_VERSION(2,32,0)
/* Forward declarations for GResource converters */
GResource *GResource_val(value val);
value Val_GResource(const GResource *ptr);
value Val_GResource_option(const GResource *ptr);
#endif

#if GLIB_CHECK_VERSION(2,32,0)
/* Forward declarations for GSettingsSchema converters */
GSettingsSchema *GSettingsSchema_val(value val);
value Val_GSettingsSchema(const GSettingsSchema *ptr);
value Val_GSettingsSchema_option(const GSettingsSchema *ptr);
#endif

/* Forward declarations for GSettingsSchemaKey converters */
GSettingsSchemaKey *GSettingsSchemaKey_val(value val);
value Val_GSettingsSchemaKey(const GSettingsSchemaKey *ptr);
value Val_GSettingsSchemaKey_option(const GSettingsSchemaKey *ptr);

#if GLIB_CHECK_VERSION(2,32,0)
/* Forward declarations for GSettingsSchemaSource converters */
GSettingsSchemaSource *GSettingsSchemaSource_val(value val);
value Val_GSettingsSchemaSource(const GSettingsSchemaSource *ptr);
value Val_GSettingsSchemaSource_option(const GSettingsSchemaSource *ptr);
#endif

/* Forward declarations for GSrvTarget converters */
GSrvTarget *GSrvTarget_val(value val);
value Val_GSrvTarget(const GSrvTarget *ptr);
value Val_GSrvTarget_option(const GSrvTarget *ptr);

/* Forward declarations for GStaticResource converters */
GStaticResource *GStaticResource_val(value val);
value Val_GStaticResource(const GStaticResource *ptr);
value Val_GStaticResource_option(const GStaticResource *ptr);

#if !(defined(_WIN32))
/* Forward declarations for GUnixMountEntry converters */
GUnixMountEntry *GUnixMountEntry_val(value val);
value Val_GUnixMountEntry(const GUnixMountEntry *ptr);
value Val_GUnixMountEntry_option(const GUnixMountEntry *ptr);
#endif /* not windows */

#if !(defined(_WIN32))
/* Forward declarations for GUnixMountPoint converters */
GUnixMountPoint *GUnixMountPoint_val(value val);
value Val_GUnixMountPoint(const GUnixMountPoint *ptr);
value Val_GUnixMountPoint_option(const GUnixMountPoint *ptr);
#endif /* not windows */

/* Const-safe string extraction for setters */
#define ML_DECL_CONST_STRING(name, expr) const gchar *name = (const gchar *)(expr)

/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */

/* Forward declarations for enum converters */
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioBusType(GBusType val);
GBusType GioBusType_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,24,0)
value Val_GioConverterResult(GConverterResult val);
GConverterResult GioConverterResult_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioCredentialsType(GCredentialsType val);
GCredentialsType GioCredentialsType_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusError(GDBusError val);
GDBusError GioDBusError_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusMessageByteOrder(GDBusMessageByteOrder val);
GDBusMessageByteOrder GioDBusMessageByteOrder_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusMessageHeaderField(GDBusMessageHeaderField val);
GDBusMessageHeaderField GioDBusMessageHeaderField_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusMessageType(GDBusMessageType val);
GDBusMessageType GioDBusMessageType_val(value val);
#endif
value Val_GioDataStreamByteOrder(GDataStreamByteOrder val);
GDataStreamByteOrder GioDataStreamByteOrder_val(value val);
value Val_GioDataStreamNewlineType(GDataStreamNewlineType val);
GDataStreamNewlineType GioDataStreamNewlineType_val(value val);
#if GLIB_CHECK_VERSION(2,22,0)
value Val_GioDriveStartStopType(GDriveStartStopType val);
GDriveStartStopType GioDriveStartStopType_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,18,0)
value Val_GioEmblemOrigin(GEmblemOrigin val);
GEmblemOrigin GioEmblemOrigin_val(value val);
#endif
value Val_GioFileAttributeStatus(GFileAttributeStatus val);
GFileAttributeStatus GioFileAttributeStatus_val(value val);
value Val_GioFileAttributeType(GFileAttributeType val);
GFileAttributeType GioFileAttributeType_val(value val);
value Val_GioFileMonitorEvent(GFileMonitorEvent val);
GFileMonitorEvent GioFileMonitorEvent_val(value val);
value Val_GioFileType(GFileType val);
GFileType GioFileType_val(value val);
value Val_GioFilesystemPreviewType(GFilesystemPreviewType val);
GFilesystemPreviewType GioFilesystemPreviewType_val(value val);
value Val_GioIOErrorEnum(GIOErrorEnum val);
GIOErrorEnum GioIOErrorEnum_val(value val);
#if GLIB_CHECK_VERSION(2,30,0)
value Val_GioIOModuleScopeFlags(GIOModuleScopeFlags val);
GIOModuleScopeFlags GioIOModuleScopeFlags_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,64,0)
value Val_GioMemoryMonitorWarningLevel(GMemoryMonitorWarningLevel val);
GMemoryMonitorWarningLevel GioMemoryMonitorWarningLevel_val(value val);
#endif
value Val_GioMountOperationResult(GMountOperationResult val);
GMountOperationResult GioMountOperationResult_val(value val);
#if GLIB_CHECK_VERSION(2,44,0)
value Val_GioNetworkConnectivity(GNetworkConnectivity val);
GNetworkConnectivity GioNetworkConnectivity_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,42,0)
value Val_GioNotificationPriority(GNotificationPriority val);
GNotificationPriority GioNotificationPriority_val(value val);
#endif
value Val_GioPasswordSave(GPasswordSave val);
GPasswordSave GioPasswordSave_val(value val);
#if GLIB_CHECK_VERSION(2,60,0)
value Val_GioPollableReturn(GPollableReturn val);
GPollableReturn GioPollableReturn_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,22,0)
value Val_GioResolverError(GResolverError val);
GResolverError GioResolverError_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,34,0)
value Val_GioResolverRecordType(GResolverRecordType val);
GResolverRecordType GioResolverRecordType_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,32,0)
value Val_GioResourceError(GResourceError val);
GResourceError GioResourceError_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,32,0)
value Val_GioSocketClientEvent(GSocketClientEvent val);
GSocketClientEvent GioSocketClientEvent_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,22,0)
value Val_GioSocketFamily(GSocketFamily val);
GSocketFamily GioSocketFamily_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,46,0)
value Val_GioSocketListenerEvent(GSocketListenerEvent val);
GSocketListenerEvent GioSocketListenerEvent_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,22,0)
value Val_GioSocketProtocol(GSocketProtocol val);
GSocketProtocol GioSocketProtocol_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,22,0)
value Val_GioSocketType(GSocketType val);
GSocketType GioSocketType_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,28,0)
value Val_GioTlsAuthenticationMode(GTlsAuthenticationMode val);
GTlsAuthenticationMode GioTlsAuthenticationMode_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,40,0)
value Val_GioTlsCertificateRequestFlags(GTlsCertificateRequestFlags val);
GTlsCertificateRequestFlags GioTlsCertificateRequestFlags_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,66,0)
value Val_GioTlsChannelBindingError(GTlsChannelBindingError val);
GTlsChannelBindingError GioTlsChannelBindingError_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,66,0)
value Val_GioTlsChannelBindingType(GTlsChannelBindingType val);
GTlsChannelBindingType GioTlsChannelBindingType_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,30,0)
value Val_GioTlsDatabaseLookupFlags(GTlsDatabaseLookupFlags val);
GTlsDatabaseLookupFlags GioTlsDatabaseLookupFlags_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,28,0)
value Val_GioTlsError(GTlsError val);
GTlsError GioTlsError_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,30,0)
value Val_GioTlsInteractionResult(GTlsInteractionResult val);
GTlsInteractionResult GioTlsInteractionResult_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,70,0)
value Val_GioTlsProtocolVersion(GTlsProtocolVersion val);
GTlsProtocolVersion GioTlsProtocolVersion_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,28,0)
value Val_GioTlsRehandshakeMode(GTlsRehandshakeMode val);
GTlsRehandshakeMode GioTlsRehandshakeMode_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioUnixSocketAddressType(GUnixSocketAddressType val);
GUnixSocketAddressType GioUnixSocketAddressType_val(value val);
#endif
#if GLIB_CHECK_VERSION(2,24,0)
value Val_GioZlibCompressorFormat(GZlibCompressorFormat val);
GZlibCompressorFormat GioZlibCompressorFormat_val(value val);
#endif

/* Forward declarations for bitfield converters */
value Val_GioAppInfoCreateFlags(GAppInfoCreateFlags flags);
GAppInfoCreateFlags GioAppInfoCreateFlags_val(value list);
#if GLIB_CHECK_VERSION(2,28,0)
value Val_GioApplicationFlags(GApplicationFlags flags);
GApplicationFlags GioApplicationFlags_val(value list);
#endif
value Val_GioAskPasswordFlags(GAskPasswordFlags flags);
GAskPasswordFlags GioAskPasswordFlags_val(value list);
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioBusNameOwnerFlags(GBusNameOwnerFlags flags);
GBusNameOwnerFlags GioBusNameOwnerFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioBusNameWatcherFlags(GBusNameWatcherFlags flags);
GBusNameWatcherFlags GioBusNameWatcherFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,24,0)
value Val_GioConverterFlags(GConverterFlags flags);
GConverterFlags GioConverterFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusCallFlags(GDBusCallFlags flags);
GDBusCallFlags GioDBusCallFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusCapabilityFlags(GDBusCapabilityFlags flags);
GDBusCapabilityFlags GioDBusCapabilityFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusConnectionFlags(GDBusConnectionFlags flags);
GDBusConnectionFlags GioDBusConnectionFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,30,0)
value Val_GioDBusInterfaceSkeletonFlags(GDBusInterfaceSkeletonFlags flags);
GDBusInterfaceSkeletonFlags GioDBusInterfaceSkeletonFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusMessageFlags(GDBusMessageFlags flags);
GDBusMessageFlags GioDBusMessageFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,30,0)
value Val_GioDBusObjectManagerClientFlags(GDBusObjectManagerClientFlags flags);
GDBusObjectManagerClientFlags GioDBusObjectManagerClientFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusPropertyInfoFlags(GDBusPropertyInfoFlags flags);
GDBusPropertyInfoFlags GioDBusPropertyInfoFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusProxyFlags(GDBusProxyFlags flags);
GDBusProxyFlags GioDBusProxyFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusSendMessageFlags(GDBusSendMessageFlags flags);
GDBusSendMessageFlags GioDBusSendMessageFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusServerFlags(GDBusServerFlags flags);
GDBusServerFlags GioDBusServerFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusSignalFlags(GDBusSignalFlags flags);
GDBusSignalFlags GioDBusSignalFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,26,0)
value Val_GioDBusSubtreeFlags(GDBusSubtreeFlags flags);
GDBusSubtreeFlags GioDBusSubtreeFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,22,0)
value Val_GioDriveStartFlags(GDriveStartFlags flags);
GDriveStartFlags GioDriveStartFlags_val(value list);
#endif
value Val_GioFileAttributeInfoFlags(GFileAttributeInfoFlags flags);
GFileAttributeInfoFlags GioFileAttributeInfoFlags_val(value list);
value Val_GioFileCopyFlags(GFileCopyFlags flags);
GFileCopyFlags GioFileCopyFlags_val(value list);
value Val_GioFileCreateFlags(GFileCreateFlags flags);
GFileCreateFlags GioFileCreateFlags_val(value list);
#if GLIB_CHECK_VERSION(2,38,0)
value Val_GioFileMeasureFlags(GFileMeasureFlags flags);
GFileMeasureFlags GioFileMeasureFlags_val(value list);
#endif
value Val_GioFileMonitorFlags(GFileMonitorFlags flags);
GFileMonitorFlags GioFileMonitorFlags_val(value list);
value Val_GioFileQueryInfoFlags(GFileQueryInfoFlags flags);
GFileQueryInfoFlags GioFileQueryInfoFlags_val(value list);
#if GLIB_CHECK_VERSION(2,28,0)
value Val_GioIOStreamSpliceFlags(GIOStreamSpliceFlags flags);
GIOStreamSpliceFlags GioIOStreamSpliceFlags_val(value list);
#endif
value Val_GioMountMountFlags(GMountMountFlags flags);
GMountMountFlags GioMountMountFlags_val(value list);
value Val_GioMountUnmountFlags(GMountUnmountFlags flags);
GMountUnmountFlags GioMountUnmountFlags_val(value list);
value Val_GioOutputStreamSpliceFlags(GOutputStreamSpliceFlags flags);
GOutputStreamSpliceFlags GioOutputStreamSpliceFlags_val(value list);
#if GLIB_CHECK_VERSION(2,60,0)
value Val_GioResolverNameLookupFlags(GResolverNameLookupFlags flags);
GResolverNameLookupFlags GioResolverNameLookupFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,32,0)
value Val_GioResourceFlags(GResourceFlags flags);
GResourceFlags GioResourceFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,32,0)
value Val_GioResourceLookupFlags(GResourceLookupFlags flags);
GResourceLookupFlags GioResourceLookupFlags_val(value list);
#endif
value Val_GioSettingsBindFlags(GSettingsBindFlags flags);
GSettingsBindFlags GioSettingsBindFlags_val(value list);
#if GLIB_CHECK_VERSION(2,22,0)
value Val_GioSocketMsgFlags(GSocketMsgFlags flags);
GSocketMsgFlags GioSocketMsgFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,40,0)
value Val_GioSubprocessFlags(GSubprocessFlags flags);
GSubprocessFlags GioSubprocessFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,34,0)
value Val_GioTestDBusFlags(GTestDBusFlags flags);
GTestDBusFlags GioTestDBusFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,28,0)
value Val_GioTlsCertificateFlags(GTlsCertificateFlags flags);
GTlsCertificateFlags GioTlsCertificateFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,30,0)
value Val_GioTlsDatabaseVerifyFlags(GTlsDatabaseVerifyFlags flags);
GTlsDatabaseVerifyFlags GioTlsDatabaseVerifyFlags_val(value list);
#endif
#if GLIB_CHECK_VERSION(2,30,0)
value Val_GioTlsPasswordFlags(GTlsPasswordFlags flags);
GTlsPasswordFlags GioTlsPasswordFlags_val(value list);
#endif


#include "../core/gio_core.h"

#endif /* _gio_decls_h_ */
