library observatory_elements;

// Export elements.
export 'package:observatory/src/elements/action_link.dart';
export 'package:observatory/src/elements/class_ref_as_value.dart';
export 'package:observatory/src/elements/debugger.dart';
export 'package:observatory/src/elements/eval_link.dart';
export 'package:observatory/src/elements/isolate_reconnect.dart';
export 'package:observatory/src/elements/library_ref_as_value.dart';
export 'package:observatory/src/elements/metrics.dart';
export 'package:observatory/src/elements/observatory_element.dart';
export 'package:observatory/src/elements/service_ref.dart';
export 'package:observatory/src/elements/vm_connect.dart';

import 'dart:async';

import 'package:observatory/src/elements/allocation_profile.dart';
import 'package:observatory/src/elements/class_allocation_profile.dart';
import 'package:observatory/src/elements/class_instances.dart';
import 'package:observatory/src/elements/class_ref.dart';
import 'package:observatory/src/elements/class_ref_wrapper.dart';
import 'package:observatory/src/elements/class_tree.dart';
import 'package:observatory/src/elements/class_view.dart';
import 'package:observatory/src/elements/code_ref.dart';
import 'package:observatory/src/elements/code_ref_wrapper.dart';
import 'package:observatory/src/elements/code_view.dart';
import 'package:observatory/src/elements/context_ref.dart';
import 'package:observatory/src/elements/context_ref_wrapper.dart';
import 'package:observatory/src/elements/context_view.dart';
import 'package:observatory/src/elements/containers/virtual_collection.dart';
import 'package:observatory/src/elements/containers/virtual_tree.dart';
import 'package:observatory/src/elements/cpu_profile.dart';
import 'package:observatory/src/elements/cpu_profile/virtual_tree.dart';
import 'package:observatory/src/elements/cpu_profile_table.dart';
import 'package:observatory/src/elements/curly_block.dart';
import 'package:observatory/src/elements/curly_block_wrapper.dart';
import 'package:observatory/src/elements/error_ref.dart';
import 'package:observatory/src/elements/error_ref_wrapper.dart';
import 'package:observatory/src/elements/error_view.dart';
import 'package:observatory/src/elements/eval_box.dart';
import 'package:observatory/src/elements/eval_box_wrapper.dart';
import 'package:observatory/src/elements/field_ref.dart';
import 'package:observatory/src/elements/field_ref_wrapper.dart';
import 'package:observatory/src/elements/field_view.dart';
import 'package:observatory/src/elements/flag_list.dart';
import 'package:observatory/src/elements/function_ref.dart';
import 'package:observatory/src/elements/function_ref_wrapper.dart';
import 'package:observatory/src/elements/function_view.dart';
import 'package:observatory/src/elements/general_error.dart';
import 'package:observatory/src/elements/heap_map.dart';
import 'package:observatory/src/elements/heap_snapshot.dart';
import 'package:observatory/src/elements/icdata_ref.dart';
import 'package:observatory/src/elements/icdata_view.dart';
import 'package:observatory/src/elements/instance_ref.dart';
import 'package:observatory/src/elements/instance_ref_wrapper.dart';
import 'package:observatory/src/elements/instance_view.dart';
import 'package:observatory/src/elements/isolate_reconnect.dart';
import 'package:observatory/src/elements/isolate_ref.dart';
import 'package:observatory/src/elements/isolate_ref_wrapper.dart';
import 'package:observatory/src/elements/isolate_view.dart';
import 'package:observatory/src/elements/isolate/counter_chart.dart';
import 'package:observatory/src/elements/isolate/location.dart';
import 'package:observatory/src/elements/isolate/run_state.dart';
import 'package:observatory/src/elements/isolate/shared_summary.dart';
import 'package:observatory/src/elements/isolate/summary.dart';
import 'package:observatory/src/elements/json_view.dart';
import 'package:observatory/src/elements/library_ref.dart';
import 'package:observatory/src/elements/library_ref_wrapper.dart';
import 'package:observatory/src/elements/library_view.dart';
import 'package:observatory/src/elements/local_var_descriptors_ref.dart';
import 'package:observatory/src/elements/logging.dart';
import 'package:observatory/src/elements/megamorphiccache_ref.dart';
import 'package:observatory/src/elements/megamorphiccache_view.dart';
import 'package:observatory/src/elements/nav/bar.dart';
import 'package:observatory/src/elements/nav/class_menu.dart';
import 'package:observatory/src/elements/nav/class_menu_wrapper.dart';
import 'package:observatory/src/elements/nav/isolate_menu.dart';
import 'package:observatory/src/elements/nav/isolate_menu_wrapper.dart';
import 'package:observatory/src/elements/nav/library_menu.dart';
import 'package:observatory/src/elements/nav/library_menu_wrapper.dart';
import 'package:observatory/src/elements/nav/menu.dart';
import 'package:observatory/src/elements/nav/menu_wrapper.dart';
import 'package:observatory/src/elements/nav/menu_item.dart';
import 'package:observatory/src/elements/nav/menu_item_wrapper.dart';
import 'package:observatory/src/elements/nav/notify.dart';
import 'package:observatory/src/elements/nav/notify_wrapper.dart';
import 'package:observatory/src/elements/nav/notify_event.dart';
import 'package:observatory/src/elements/nav/notify_exception.dart';
import 'package:observatory/src/elements/nav/refresh.dart';
import 'package:observatory/src/elements/nav/refresh_wrapper.dart';
import 'package:observatory/src/elements/nav/top_menu.dart';
import 'package:observatory/src/elements/nav/top_menu_wrapper.dart';
import 'package:observatory/src/elements/nav/vm_menu.dart';
import 'package:observatory/src/elements/nav/vm_menu_wrapper.dart';
import 'package:observatory/src/elements/objectpool_ref.dart';
import 'package:observatory/src/elements/objectpool_view.dart';
import 'package:observatory/src/elements/object_common.dart';
import 'package:observatory/src/elements/object_common_wrapper.dart';
import 'package:observatory/src/elements/object_view.dart';
import 'package:observatory/src/elements/objectstore_view.dart';
import 'package:observatory/src/elements/observatory_application.dart';
import 'package:observatory/src/elements/persistent_handles.dart';
import 'package:observatory/src/elements/pc_descriptors_ref.dart';
import 'package:observatory/src/elements/ports.dart';
import 'package:observatory/src/elements/sample_buffer_control.dart';
import 'package:observatory/src/elements/script_inset.dart';
import 'package:observatory/src/elements/script_inset_wrapper.dart';
import 'package:observatory/src/elements/script_ref.dart';
import 'package:observatory/src/elements/script_ref_wrapper.dart';
import 'package:observatory/src/elements/script_view.dart';
import 'package:observatory/src/elements/sentinel_value.dart';
import 'package:observatory/src/elements/sentinel_view.dart';
import 'package:observatory/src/elements/source_inset.dart';
import 'package:observatory/src/elements/source_inset_wrapper.dart';
import 'package:observatory/src/elements/source_link.dart';
import 'package:observatory/src/elements/source_link_wrapper.dart';
import 'package:observatory/src/elements/stack_trace_tree_config.dart';
import 'package:observatory/src/elements/strongly_reachable_instances.dart';
import 'package:observatory/src/elements/timeline_page.dart';
import 'package:observatory/src/elements/type_arguments_ref.dart';
import 'package:observatory/src/elements/token_stream_ref.dart';
import 'package:observatory/src/elements/unknown_ref.dart';
import 'package:observatory/src/elements/view_footer.dart';
import 'package:observatory/src/elements/vm_connect_target.dart';
import 'package:observatory/src/elements/vm_connect.dart';
import 'package:observatory/src/elements/vm_view.dart';

export 'package:observatory/src/elements/helpers/rendering_queue.dart';

export 'package:observatory/src/elements/allocation_profile.dart';
export 'package:observatory/src/elements/class_allocation_profile.dart';
export 'package:observatory/src/elements/class_instances.dart';
export 'package:observatory/src/elements/class_ref.dart';
export 'package:observatory/src/elements/class_tree.dart';
export 'package:observatory/src/elements/class_view.dart';
export 'package:observatory/src/elements/code_ref.dart';
export 'package:observatory/src/elements/code_view.dart';
export 'package:observatory/src/elements/containers/virtual_collection.dart';
export 'package:observatory/src/elements/containers/virtual_tree.dart';
export 'package:observatory/src/elements/context_ref.dart';
export 'package:observatory/src/elements/context_view.dart';
export 'package:observatory/src/elements/cpu_profile.dart';
export 'package:observatory/src/elements/cpu_profile/virtual_tree.dart';
export 'package:observatory/src/elements/cpu_profile_table.dart';
export 'package:observatory/src/elements/curly_block.dart';
export 'package:observatory/src/elements/error_ref.dart';
export 'package:observatory/src/elements/error_view.dart';
export 'package:observatory/src/elements/eval_box.dart';
export 'package:observatory/src/elements/field_ref.dart';
export 'package:observatory/src/elements/field_view.dart';
export 'package:observatory/src/elements/function_view.dart';
export 'package:observatory/src/elements/flag_list.dart';
export 'package:observatory/src/elements/function_ref.dart';
export 'package:observatory/src/elements/general_error.dart';
export 'package:observatory/src/elements/heap_map.dart';
export 'package:observatory/src/elements/heap_snapshot.dart';
export 'package:observatory/src/elements/icdata_ref.dart';
export 'package:observatory/src/elements/icdata_view.dart';
export 'package:observatory/src/elements/instance_ref.dart';
export 'package:observatory/src/elements/instance_view.dart';
export 'package:observatory/src/elements/isolate_reconnect.dart';
export 'package:observatory/src/elements/isolate_ref.dart';
export 'package:observatory/src/elements/isolate_view.dart';
export 'package:observatory/src/elements/isolate/counter_chart.dart';
export 'package:observatory/src/elements/isolate/location.dart';
export 'package:observatory/src/elements/isolate/run_state.dart';
export 'package:observatory/src/elements/isolate/shared_summary.dart';
export 'package:observatory/src/elements/isolate/summary.dart';
export 'package:observatory/src/elements/json_view.dart';
export 'package:observatory/src/elements/library_ref.dart';
export 'package:observatory/src/elements/library_view.dart';
export 'package:observatory/src/elements/local_var_descriptors_ref.dart';
export 'package:observatory/src/elements/logging.dart';
export 'package:observatory/src/elements/megamorphiccache_ref.dart';
export 'package:observatory/src/elements/megamorphiccache_view.dart';
export 'package:observatory/src/elements/nav/bar.dart';
export 'package:observatory/src/elements/nav/class_menu.dart';
export 'package:observatory/src/elements/nav/isolate_menu.dart';
export 'package:observatory/src/elements/nav/library_menu.dart';
export 'package:observatory/src/elements/nav/menu.dart';
export 'package:observatory/src/elements/nav/menu_item.dart';
export 'package:observatory/src/elements/nav/notify.dart';
export 'package:observatory/src/elements/nav/notify_event.dart';
export 'package:observatory/src/elements/nav/notify_exception.dart';
export 'package:observatory/src/elements/nav/refresh.dart';
export 'package:observatory/src/elements/nav/top_menu.dart';
export 'package:observatory/src/elements/nav/vm_menu.dart';
export 'package:observatory/src/elements/objectpool_ref.dart';
export 'package:observatory/src/elements/objectpool_view.dart';
export 'package:observatory/src/elements/objectstore_view.dart';
export 'package:observatory/src/elements/object_common.dart';
export 'package:observatory/src/elements/object_view.dart';
export 'package:observatory/src/elements/observatory_application.dart';
export 'package:observatory/src/elements/persistent_handles.dart';
export 'package:observatory/src/elements/pc_descriptors_ref.dart';
export 'package:observatory/src/elements/ports.dart';
export 'package:observatory/src/elements/sample_buffer_control.dart';
export 'package:observatory/src/elements/script_inset.dart';
export 'package:observatory/src/elements/script_ref.dart';
export 'package:observatory/src/elements/script_view.dart';
export 'package:observatory/src/elements/sentinel_value.dart';
export 'package:observatory/src/elements/sentinel_view.dart';
export 'package:observatory/src/elements/source_inset.dart';
export 'package:observatory/src/elements/source_link.dart';
export 'package:observatory/src/elements/stack_trace_tree_config.dart';
export 'package:observatory/src/elements/strongly_reachable_instances.dart';
export 'package:observatory/src/elements/timeline_page.dart';
export 'package:observatory/src/elements/type_arguments_ref.dart';
export 'package:observatory/src/elements/token_stream_ref.dart';
export 'package:observatory/src/elements/unknown_ref.dart';
export 'package:observatory/src/elements/view_footer.dart';
export 'package:observatory/src/elements/vm_connect_target.dart';
export 'package:observatory/src/elements/vm_connect.dart';
export 'package:observatory/src/elements/vm_view.dart';

// Even though this function does not invoke any asynchronous operation
// it is marked as async to allow future backward compatible changes.
Future initElements() async {
  AllocationProfileElement.tag.ensureRegistration();
  ClassAllocationProfileElement.tag.ensureRegistration();
  ClassInstancesElement.tag.ensureRegistration();
  ClassRefElement.tag.ensureRegistration();
  ClassRefElementWrapper.tag.ensureRegistration();
  ClassTreeElement.tag.ensureRegistration();
  ClassViewElement.tag.ensureRegistration();
  CodeRefElement.tag.ensureRegistration();
  CodeRefElementWrapper.tag.ensureRegistration();
  CodeViewElement.tag.ensureRegistration();
  ContextRefElement.tag.ensureRegistration();
  ContextRefElementWrapper.tag.ensureRegistration();
  ContextViewElement.tag.ensureRegistration();
  CpuProfileElement.tag.ensureRegistration();
  CpuProfileTableElement.tag.ensureRegistration();
  CpuProfileVirtualTreeElement.tag.ensureRegistration();
  CurlyBlockElement.tag.ensureRegistration();
  CurlyBlockElementWrapper.tag.ensureRegistration();
  ErrorRefElement.tag.ensureRegistration();
  ErrorRefElementWrapper.tag.ensureRegistration();
  ErrorViewElement.tag.ensureRegistration();
  EvalBoxElement.tag.ensureRegistration();
  EvalBoxElementWrapper.tag.ensureRegistration();
  FieldRefElement.tag.ensureRegistration();
  FieldRefElementWrapper.tag.ensureRegistration();
  FieldViewElement.tag.ensureRegistration();
  FlagListElement.tag.ensureRegistration();
  FunctionRefElement.tag.ensureRegistration();
  FunctionRefElementWrapper.tag.ensureRegistration();
  FunctionViewElement.tag.ensureRegistration();
  GeneralErrorElement.tag.ensureRegistration();
  HeapMapElement.tag.ensureRegistration();
  HeapSnapshotElement.tag.ensureRegistration();
  ICDataRefElement.tag.ensureRegistration();
  ICDataViewElement.tag.ensureRegistration();
  InstanceRefElement.tag.ensureRegistration();
  InstanceRefElementWrapper.tag.ensureRegistration();
  InstanceViewElement.tag.ensureRegistration();
  IsolateCounterChartElement.tag.ensureRegistration();
  IsolateLocationElement.tag.ensureRegistration();
  IsolateReconnectElement.tag.ensureRegistration();
  IsolateRefElement.tag.ensureRegistration();
  IsolateRefElementWrapper.tag.ensureRegistration();
  IsolateRunStateElement.tag.ensureRegistration();
  IsolateSharedSummaryElement.tag.ensureRegistration();
  IsolateSummaryElement.tag.ensureRegistration();
  IsolateViewElement.tag.ensureRegistration();
  JSONViewElement.tag.ensureRegistration();
  LibraryRefElement.tag.ensureRegistration();
  LibraryRefElementWrapper.tag.ensureRegistration();
  LibraryViewElement.tag.ensureRegistration();
  LocalVarDescriptorsRefElement.tag.ensureRegistration();
  LoggingPageElement.tag.ensureRegistration();
  MegamorphicCacheRefElement.tag.ensureRegistration();
  MegamorphicCacheViewElement.tag.ensureRegistration();
  NavBarElement.tag.ensureRegistration();
  NavClassMenuElement.tag.ensureRegistration();
  NavClassMenuElementWrapper.tag.ensureRegistration();
  NavIsolateMenuElement.tag.ensureRegistration();
  NavIsolateMenuElementWrapper.tag.ensureRegistration();
  NavLibraryMenuElement.tag.ensureRegistration();
  NavLibraryMenuElementWrapper.tag.ensureRegistration();
  NavMenuElement.tag.ensureRegistration();
  NavMenuElementWrapper.tag.ensureRegistration();
  NavMenuItemElement.tag.ensureRegistration();
  NavMenuItemElementWrapper.tag.ensureRegistration();
  NavNotifyElement.tag.ensureRegistration();
  NavNotifyElementWrapper.tag.ensureRegistration();
  NavNotifyEventElement.tag.ensureRegistration();
  NavNotifyExceptionElement.tag.ensureRegistration();
  NavRefreshElement.tag.ensureRegistration();
  NavRefreshElementWrapper.tag.ensureRegistration();
  NavTopMenuElement.tag.ensureRegistration();
  NavTopMenuElementWrapper.tag.ensureRegistration();
  NavVMMenuElement.tag.ensureRegistration();
  NavVMMenuElementWrapper.tag.ensureRegistration();
  ObjectCommonElement.tag.ensureRegistration();
  ObjectCommonElementWrapper.tag.ensureRegistration();
  ObjectViewElement.tag.ensureRegistration();
  ObjectPoolRefElement.tag.ensureRegistration();
  ObjectPoolViewElement.tag.ensureRegistration();
  ObjectStoreViewElement.tag.ensureRegistration();
  ObservatoryApplicationElement.tag.ensureRegistration();
  PersistentHandlesPageElement.tag.ensureRegistration();
  PcDescriptorsRefElement.tag.ensureRegistration();
  PortsElement.tag.ensureRegistration();
  ScriptInsetElement.tag.ensureRegistration();
  ScriptInsetElementWrapper.tag.ensureRegistration();
  SampleBufferControlElement.tag.ensureRegistration();
  ScriptRefElement.tag.ensureRegistration();
  ScriptRefElementWrapper.tag.ensureRegistration();
  ScriptViewElement.tag.ensureRegistration();
  SentinelValueElement.tag.ensureRegistration();
  SentinelViewElement.tag.ensureRegistration();
  SourceInsetElement.tag.ensureRegistration();
  SourceInsetElementWrapper.tag.ensureRegistration();
  SourceLinkElement.tag.ensureRegistration();
  SourceLinkElementWrapper.tag.ensureRegistration();
  StackTraceTreeConfigElement.tag.ensureRegistration();
  StronglyReachableInstancesElement.tag.ensureRegistration();
  TimelinePageElement.tag.ensureRegistration();
  TypeArgumentsRefElement.tag.ensureRegistration();
  TokenStreamRefElement.tag.ensureRegistration();
  UnknownObjectRefElement.tag.ensureRegistration();
  ViewFooterElement.tag.ensureRegistration();
  VirtualCollectionElement.tag.ensureRegistration();
  VirtualTreeElement.tag.ensureRegistration();
  VMConnectElement.tag.ensureRegistration();
  VirtualCollectionElement.tag.ensureRegistration();
  VirtualTreeElement.tag.ensureRegistration();
  VMConnectTargetElement.tag.ensureRegistration();
  VMViewElement.tag.ensureRegistration();
}
