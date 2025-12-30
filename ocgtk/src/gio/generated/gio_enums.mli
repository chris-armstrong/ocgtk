(* GENERATED CODE - DO NOT EDIT *)
(* Gio Enumeration and Bitfield Types *)

(* BusType - enumeration *)
type bustype = [
  | `STARTER
  | `NONE
  | `SYSTEM
  | `SESSION
]

(* ConverterResult - enumeration *)
type converterresult = [
  | `ERROR
  | `CONVERTED
  | `FINISHED
  | `FLUSHED
]

(* CredentialsType - enumeration *)
type credentialstype = [
  | `INVALID
  | `LINUX_UCRED
  | `FREEBSD_CMSGCRED
  | `OPENBSD_SOCKPEERCRED
  | `SOLARIS_UCRED
  | `NETBSD_UNPCBID
  | `APPLE_XUCRED
  | `WIN32_PID
]

(* DBusError - enumeration *)
type dbuserror = [
  | `FAILED
  | `NO_MEMORY
  | `SERVICE_UNKNOWN
  | `NAME_HAS_NO_OWNER
  | `NO_REPLY
  | `IO_ERROR
  | `BAD_ADDRESS
  | `NOT_SUPPORTED
  | `LIMITS_EXCEEDED
  | `ACCESS_DENIED
  | `AUTH_FAILED
  | `NO_SERVER
  | `TIMEOUT
  | `NO_NETWORK
  | `ADDRESS_IN_USE
  | `DISCONNECTED
  | `INVALID_ARGS
  | `FILE_NOT_FOUND
  | `FILE_EXISTS
  | `UNKNOWN_METHOD
  | `TIMED_OUT
  | `MATCH_RULE_NOT_FOUND
  | `MATCH_RULE_INVALID
  | `SPAWN_EXEC_FAILED
  | `SPAWN_FORK_FAILED
  | `SPAWN_CHILD_EXITED
  | `SPAWN_CHILD_SIGNALED
  | `SPAWN_FAILED
  | `SPAWN_SETUP_FAILED
  | `SPAWN_CONFIG_INVALID
  | `SPAWN_SERVICE_INVALID
  | `SPAWN_SERVICE_NOT_FOUND
  | `SPAWN_PERMISSIONS_INVALID
  | `SPAWN_FILE_INVALID
  | `SPAWN_NO_MEMORY
  | `UNIX_PROCESS_ID_UNKNOWN
  | `INVALID_SIGNATURE
  | `INVALID_FILE_CONTENT
  | `SELINUX_SECURITY_CONTEXT_UNKNOWN
  | `ADT_AUDIT_DATA_UNKNOWN
  | `OBJECT_PATH_IN_USE
  | `UNKNOWN_OBJECT
  | `UNKNOWN_INTERFACE
  | `UNKNOWN_PROPERTY
  | `PROPERTY_READ_ONLY
]

(* DBusMessageByteOrder - enumeration *)
type dbusmessagebyteorder = [
  | `BIG_ENDIAN
  | `LITTLE_ENDIAN
]

(* DBusMessageHeaderField - enumeration *)
type dbusmessageheaderfield = [
  | `INVALID
  | `PATH
  | `INTERFACE
  | `MEMBER
  | `ERROR_NAME
  | `REPLY_SERIAL
  | `DESTINATION
  | `SENDER
  | `SIGNATURE
  | `NUM_UNIX_FDS
]

(* DBusMessageType - enumeration *)
type dbusmessagetype = [
  | `INVALID
  | `METHOD_CALL
  | `METHOD_RETURN
  | `ERROR
  | `SIGNAL
]

(* DataStreamByteOrder - enumeration *)
type datastreambyteorder = [
  | `BIG_ENDIAN
  | `LITTLE_ENDIAN
  | `HOST_ENDIAN
]

(* DataStreamNewlineType - enumeration *)
type datastreamnewlinetype = [
  | `LF
  | `CR
  | `CR_LF
  | `ANY
]

(* DriveStartStopType - enumeration *)
type drivestartstoptype = [
  | `UNKNOWN
  | `SHUTDOWN
  | `NETWORK
  | `MULTIDISK
  | `PASSWORD
]

(* EmblemOrigin - enumeration *)
type emblemorigin = [
  | `UNKNOWN
  | `DEVICE
  | `LIVEMETADATA
  | `TAG
]

(* FileAttributeStatus - enumeration *)
type fileattributestatus = [
  | `UNSET
  | `SET
  | `ERROR_SETTING
]

(* FileAttributeType - enumeration *)
type fileattributetype = [
  | `INVALID
  | `STRING
  | `BYTE_STRING
  | `BOOLEAN
  | `UINT32
  | `INT32
  | `UINT64
  | `INT64
  | `OBJECT
  | `STRINGV
]

(* FileMonitorEvent - enumeration *)
type filemonitorevent = [
  | `CHANGED
  | `CHANGES_DONE_HINT
  | `DELETED
  | `CREATED
  | `ATTRIBUTE_CHANGED
  | `PRE_UNMOUNT
  | `UNMOUNTED
  | `MOVED
  | `RENAMED
  | `MOVED_IN
  | `MOVED_OUT
]

(* FileType - enumeration *)
type filetype = [
  | `UNKNOWN
  | `REGULAR
  | `DIRECTORY
  | `SYMBOLIC_LINK
  | `SPECIAL
  | `SHORTCUT
  | `MOUNTABLE
]

(* FilesystemPreviewType - enumeration *)
type filesystempreviewtype = [
  | `IF_ALWAYS
  | `IF_LOCAL
  | `NEVER
]

(* IOErrorEnum - enumeration *)
type ioerrorenum = [
  | `FAILED
  | `NOT_FOUND
  | `EXISTS
  | `IS_DIRECTORY
  | `NOT_DIRECTORY
  | `NOT_EMPTY
  | `NOT_REGULAR_FILE
  | `NOT_SYMBOLIC_LINK
  | `NOT_MOUNTABLE_FILE
  | `FILENAME_TOO_LONG
  | `INVALID_FILENAME
  | `TOO_MANY_LINKS
  | `NO_SPACE
  | `INVALID_ARGUMENT
  | `PERMISSION_DENIED
  | `NOT_SUPPORTED
  | `NOT_MOUNTED
  | `ALREADY_MOUNTED
  | `CLOSED
  | `CANCELLED
  | `PENDING
  | `READ_ONLY
  | `CANT_CREATE_BACKUP
  | `WRONG_ETAG
  | `TIMED_OUT
  | `WOULD_RECURSE
  | `BUSY
  | `WOULD_BLOCK
  | `HOST_NOT_FOUND
  | `WOULD_MERGE
  | `FAILED_HANDLED
  | `TOO_MANY_OPEN_FILES
  | `NOT_INITIALIZED
  | `ADDRESS_IN_USE
  | `PARTIAL_INPUT
  | `INVALID_DATA
  | `DBUS_ERROR
  | `HOST_UNREACHABLE
  | `NETWORK_UNREACHABLE
  | `CONNECTION_REFUSED
  | `PROXY_FAILED
  | `PROXY_AUTH_FAILED
  | `PROXY_NEED_AUTH
  | `PROXY_NOT_ALLOWED
  | `BROKEN_PIPE
  | `CONNECTION_CLOSED
  | `NOT_CONNECTED
  | `MESSAGE_TOO_LARGE
  | `NO_SUCH_DEVICE
  | `DESTINATION_UNSET
]

(* IOModuleScopeFlags - enumeration *)
type iomodulescopeflags = [
  | `NONE
  | `BLOCK_DUPLICATES
]

(* MemoryMonitorWarningLevel - enumeration *)
type memorymonitorwarninglevel = [
  | `LOW
  | `MEDIUM
  | `CRITICAL
]

(* MountOperationResult - enumeration *)
type mountoperationresult = [
  | `HANDLED
  | `ABORTED
  | `UNHANDLED
]

(* NetworkConnectivity - enumeration *)
type networkconnectivity = [
  | `LOCAL
  | `LIMITED
  | `PORTAL
  | `FULL
]

(* NotificationPriority - enumeration *)
type notificationpriority = [
  | `NORMAL
  | `LOW
  | `HIGH
  | `URGENT
]

(* PasswordSave - enumeration *)
type passwordsave = [
  | `NEVER
  | `FOR_SESSION
  | `PERMANENTLY
]

(* PollableReturn - enumeration *)
type pollablereturn = [
  | `FAILED
  | `OK
  | `WOULD_BLOCK
]

(* ResolverError - enumeration *)
type resolvererror = [
  | `NOT_FOUND
  | `TEMPORARY_FAILURE
  | `INTERNAL
]

(* ResolverRecordType - enumeration *)
type resolverrecordtype = [
  | `SRV
  | `MX
  | `TXT
  | `SOA
  | `NS
]

(* ResourceError - enumeration *)
type resourceerror = [
  | `NOT_FOUND
  | `INTERNAL
]

(* SocketClientEvent - enumeration *)
type socketclientevent = [
  | `RESOLVING
  | `RESOLVED
  | `CONNECTING
  | `CONNECTED
  | `PROXY_NEGOTIATING
  | `PROXY_NEGOTIATED
  | `TLS_HANDSHAKING
  | `TLS_HANDSHAKED
  | `COMPLETE
]

(* SocketFamily - enumeration *)
type socketfamily = [
  | `INVALID
  | `UNIX
  | `IPV4
  | `IPV6
]

(* SocketListenerEvent - enumeration *)
type socketlistenerevent = [
  | `BINDING
  | `BOUND
  | `LISTENING
  | `LISTENED
]

(* SocketProtocol - enumeration *)
type socketprotocol = [
  | `UNKNOWN
  | `DEFAULT
  | `TCP
  | `UDP
  | `SCTP
]

(* SocketType - enumeration *)
type sockettype = [
  | `INVALID
  | `STREAM
  | `DATAGRAM
  | `SEQPACKET
]

(* TlsAuthenticationMode - enumeration *)
type tlsauthenticationmode = [
  | `NONE
  | `REQUESTED
  | `REQUIRED
]

(* TlsCertificateRequestFlags - enumeration *)
type tlscertificaterequestflags = [
  | `NONE
]

(* TlsChannelBindingError - enumeration *)
type tlschannelbindingerror = [
  | `NOT_IMPLEMENTED
  | `INVALID_STATE
  | `NOT_AVAILABLE
  | `NOT_SUPPORTED
  | `GENERAL_ERROR
]

(* TlsChannelBindingType - enumeration *)
type tlschannelbindingtype = [
  | `UNIQUE
  | `SERVER_END_POINT
  | `EXPORTER
]

(* TlsDatabaseLookupFlags - enumeration *)
type tlsdatabaselookupflags = [
  | `NONE
  | `KEYPAIR
]

(* TlsError - enumeration *)
type tlserror = [
  | `UNAVAILABLE
  | `MISC
  | `BAD_CERTIFICATE
  | `NOT_TLS
  | `HANDSHAKE
  | `CERTIFICATE_REQUIRED
  | `EOF
  | `INAPPROPRIATE_FALLBACK
  | `BAD_CERTIFICATE_PASSWORD
]

(* TlsInteractionResult - enumeration *)
type tlsinteractionresult = [
  | `UNHANDLED
  | `HANDLED
  | `FAILED
]

(* TlsProtocolVersion - enumeration *)
type tlsprotocolversion = [
  | `UNKNOWN
  | `SSL_3_0
  | `TLS_1_0
  | `TLS_1_1
  | `TLS_1_2
  | `TLS_1_3
  | `DTLS_1_0
  | `DTLS_1_2
]

(* TlsRehandshakeMode - enumeration *)
type tlsrehandshakemode = [
  | `NEVER
  | `SAFELY
  | `UNSAFELY
]

(* UnixSocketAddressType - enumeration *)
type unixsocketaddresstype = [
  | `INVALID
  | `ANONYMOUS
  | `PATH
  | `ABSTRACT
  | `ABSTRACT_PADDED
]

(* ZlibCompressorFormat - enumeration *)
type zlibcompressorformat = [
  | `ZLIB
  | `GZIP
  | `RAW
]

(* AppInfoCreateFlags - bitfield/flags *)
type appinfocreateflags_flag = [
  | `NONE
  | `NEEDS_TERMINAL
  | `SUPPORTS_URIS
  | `SUPPORTS_STARTUP_NOTIFICATION
]

type appinfocreateflags = appinfocreateflags_flag list

(* ApplicationFlags - bitfield/flags *)
type applicationflags_flag = [
  | `FLAGS_NONE
  | `DEFAULT_FLAGS
  | `IS_SERVICE
  | `IS_LAUNCHER
  | `HANDLES_OPEN
  | `HANDLES_COMMAND_LINE
  | `SEND_ENVIRONMENT
  | `NON_UNIQUE
  | `CAN_OVERRIDE_APP_ID
  | `ALLOW_REPLACEMENT
  | `REPLACE
]

type applicationflags = applicationflags_flag list

(* AskPasswordFlags - bitfield/flags *)
type askpasswordflags_flag = [
  | `NEED_PASSWORD
  | `NEED_USERNAME
  | `NEED_DOMAIN
  | `SAVING_SUPPORTED
  | `ANONYMOUS_SUPPORTED
  | `TCRYPT
]

type askpasswordflags = askpasswordflags_flag list

(* BusNameOwnerFlags - bitfield/flags *)
type busnameownerflags_flag = [
  | `NONE
  | `ALLOW_REPLACEMENT
  | `REPLACE
  | `DO_NOT_QUEUE
]

type busnameownerflags = busnameownerflags_flag list

(* BusNameWatcherFlags - bitfield/flags *)
type busnamewatcherflags_flag = [
  | `NONE
  | `AUTO_START
]

type busnamewatcherflags = busnamewatcherflags_flag list

(* ConverterFlags - bitfield/flags *)
type converterflags_flag = [
  | `NONE
  | `INPUT_AT_END
  | `FLUSH
]

type converterflags = converterflags_flag list

(* DBusCallFlags - bitfield/flags *)
type dbuscallflags_flag = [
  | `NONE
  | `NO_AUTO_START
  | `ALLOW_INTERACTIVE_AUTHORIZATION
]

type dbuscallflags = dbuscallflags_flag list

(* DBusCapabilityFlags - bitfield/flags *)
type dbuscapabilityflags_flag = [
  | `NONE
  | `UNIX_FD_PASSING
]

type dbuscapabilityflags = dbuscapabilityflags_flag list

(* DBusConnectionFlags - bitfield/flags *)
type dbusconnectionflags_flag = [
  | `NONE
  | `AUTHENTICATION_CLIENT
  | `AUTHENTICATION_SERVER
  | `AUTHENTICATION_ALLOW_ANONYMOUS
  | `MESSAGE_BUS_CONNECTION
  | `DELAY_MESSAGE_PROCESSING
  | `AUTHENTICATION_REQUIRE_SAME_USER
  | `CROSS_NAMESPACE
]

type dbusconnectionflags = dbusconnectionflags_flag list

(* DBusInterfaceSkeletonFlags - bitfield/flags *)
type dbusinterfaceskeletonflags_flag = [
  | `NONE
  | `HANDLE_METHOD_INVOCATIONS_IN_THREAD
]

type dbusinterfaceskeletonflags = dbusinterfaceskeletonflags_flag list

(* DBusMessageFlags - bitfield/flags *)
type dbusmessageflags_flag = [
  | `NONE
  | `NO_REPLY_EXPECTED
  | `NO_AUTO_START
  | `ALLOW_INTERACTIVE_AUTHORIZATION
]

type dbusmessageflags = dbusmessageflags_flag list

(* DBusObjectManagerClientFlags - bitfield/flags *)
type dbusobjectmanagerclientflags_flag = [
  | `NONE
  | `DO_NOT_AUTO_START
]

type dbusobjectmanagerclientflags = dbusobjectmanagerclientflags_flag list

(* DBusPropertyInfoFlags - bitfield/flags *)
type dbuspropertyinfoflags_flag = [
  | `NONE
  | `READABLE
  | `WRITABLE
]

type dbuspropertyinfoflags = dbuspropertyinfoflags_flag list

(* DBusProxyFlags - bitfield/flags *)
type dbusproxyflags_flag = [
  | `NONE
  | `DO_NOT_LOAD_PROPERTIES
  | `DO_NOT_CONNECT_SIGNALS
  | `DO_NOT_AUTO_START
  | `GET_INVALIDATED_PROPERTIES
  | `DO_NOT_AUTO_START_AT_CONSTRUCTION
  | `NO_MATCH_RULE
]

type dbusproxyflags = dbusproxyflags_flag list

(* DBusSendMessageFlags - bitfield/flags *)
type dbussendmessageflags_flag = [
  | `NONE
  | `PRESERVE_SERIAL
]

type dbussendmessageflags = dbussendmessageflags_flag list

(* DBusServerFlags - bitfield/flags *)
type dbusserverflags_flag = [
  | `NONE
  | `RUN_IN_THREAD
  | `AUTHENTICATION_ALLOW_ANONYMOUS
  | `AUTHENTICATION_REQUIRE_SAME_USER
]

type dbusserverflags = dbusserverflags_flag list

(* DBusSignalFlags - bitfield/flags *)
type dbussignalflags_flag = [
  | `NONE
  | `NO_MATCH_RULE
  | `MATCH_ARG0_NAMESPACE
  | `MATCH_ARG0_PATH
]

type dbussignalflags = dbussignalflags_flag list

(* DBusSubtreeFlags - bitfield/flags *)
type dbussubtreeflags_flag = [
  | `NONE
  | `DISPATCH_TO_UNENUMERATED_NODES
]

type dbussubtreeflags = dbussubtreeflags_flag list

(* DriveStartFlags - bitfield/flags *)
type drivestartflags_flag = [
  | `NONE
]

type drivestartflags = drivestartflags_flag list

(* FileAttributeInfoFlags - bitfield/flags *)
type fileattributeinfoflags_flag = [
  | `NONE
  | `COPY_WITH_FILE
  | `COPY_WHEN_MOVED
]

type fileattributeinfoflags = fileattributeinfoflags_flag list

(* FileCopyFlags - bitfield/flags *)
type filecopyflags_flag = [
  | `NONE
  | `OVERWRITE
  | `BACKUP
  | `NOFOLLOW_SYMLINKS
  | `ALL_METADATA
  | `NO_FALLBACK_FOR_MOVE
  | `TARGET_DEFAULT_PERMS
  | `TARGET_DEFAULT_MODIFIED_TIME
]

type filecopyflags = filecopyflags_flag list

(* FileCreateFlags - bitfield/flags *)
type filecreateflags_flag = [
  | `NONE
  | `PRIVATE
  | `REPLACE_DESTINATION
]

type filecreateflags = filecreateflags_flag list

(* FileMeasureFlags - bitfield/flags *)
type filemeasureflags_flag = [
  | `NONE
  | `REPORT_ANY_ERROR
  | `APPARENT_SIZE
  | `NO_XDEV
]

type filemeasureflags = filemeasureflags_flag list

(* FileMonitorFlags - bitfield/flags *)
type filemonitorflags_flag = [
  | `NONE
  | `WATCH_MOUNTS
  | `SEND_MOVED
  | `WATCH_HARD_LINKS
  | `WATCH_MOVES
]

type filemonitorflags = filemonitorflags_flag list

(* FileQueryInfoFlags - bitfield/flags *)
type filequeryinfoflags_flag = [
  | `NONE
  | `NOFOLLOW_SYMLINKS
]

type filequeryinfoflags = filequeryinfoflags_flag list

(* IOStreamSpliceFlags - bitfield/flags *)
type iostreamspliceflags_flag = [
  | `NONE
  | `CLOSE_STREAM1
  | `CLOSE_STREAM2
  | `WAIT_FOR_BOTH
]

type iostreamspliceflags = iostreamspliceflags_flag list

(* MountMountFlags - bitfield/flags *)
type mountmountflags_flag = [
  | `NONE
]

type mountmountflags = mountmountflags_flag list

(* MountUnmountFlags - bitfield/flags *)
type mountunmountflags_flag = [
  | `NONE
  | `FORCE
]

type mountunmountflags = mountunmountflags_flag list

(* OutputStreamSpliceFlags - bitfield/flags *)
type outputstreamspliceflags_flag = [
  | `NONE
  | `CLOSE_SOURCE
  | `CLOSE_TARGET
]

type outputstreamspliceflags = outputstreamspliceflags_flag list

(* ResolverNameLookupFlags - bitfield/flags *)
type resolvernamelookupflags_flag = [
  | `DEFAULT
  | `IPV4_ONLY
  | `IPV6_ONLY
]

type resolvernamelookupflags = resolvernamelookupflags_flag list

(* ResourceFlags - bitfield/flags *)
type resourceflags_flag = [
  | `NONE
  | `COMPRESSED
]

type resourceflags = resourceflags_flag list

(* ResourceLookupFlags - bitfield/flags *)
type resourcelookupflags_flag = [
  | `NONE
]

type resourcelookupflags = resourcelookupflags_flag list

(* SettingsBindFlags - bitfield/flags *)
type settingsbindflags_flag = [
  | `DEFAULT
  | `GET
  | `SET
  | `NO_SENSITIVITY
  | `GET_NO_CHANGES
  | `INVERT_BOOLEAN
]

type settingsbindflags = settingsbindflags_flag list

(* SocketMsgFlags - bitfield/flags *)
type socketmsgflags_flag = [
  | `NONE
  | `OOB
  | `PEEK
  | `DONTROUTE
]

type socketmsgflags = socketmsgflags_flag list

(* SubprocessFlags - bitfield/flags *)
type subprocessflags_flag = [
  | `NONE
  | `STDIN_PIPE
  | `STDIN_INHERIT
  | `STDOUT_PIPE
  | `STDOUT_SILENCE
  | `STDERR_PIPE
  | `STDERR_SILENCE
  | `STDERR_MERGE
  | `INHERIT_FDS
  | `SEARCH_PATH_FROM_ENVP
]

type subprocessflags = subprocessflags_flag list

(* TestDBusFlags - bitfield/flags *)
type testdbusflags_flag = [
  | `NONE
]

type testdbusflags = testdbusflags_flag list

(* TlsCertificateFlags - bitfield/flags *)
type tlscertificateflags_flag = [
  | `NO_FLAGS
  | `UNKNOWN_CA
  | `BAD_IDENTITY
  | `NOT_ACTIVATED
  | `EXPIRED
  | `REVOKED
  | `INSECURE
  | `GENERIC_ERROR
  | `VALIDATE_ALL
]

type tlscertificateflags = tlscertificateflags_flag list

(* TlsDatabaseVerifyFlags - bitfield/flags *)
type tlsdatabaseverifyflags_flag = [
  | `NONE
]

type tlsdatabaseverifyflags = tlsdatabaseverifyflags_flag list

(* TlsPasswordFlags - bitfield/flags *)
type tlspasswordflags_flag = [
  | `NONE
  | `RETRY
  | `MANY_TRIES
  | `FINAL_TRY
  | `PKCS11_USER
  | `PKCS11_SECURITY_OFFICER
  | `PKCS11_CONTEXT_SPECIFIC
]

type tlspasswordflags = tlspasswordflags_flag list

