import 'package:flutter_riverpod/all.dart';
import 'package:learning_appfinal/providers/options_provider.dart';
import 'package:learning_appfinal/providers/topics_provider.dart';

final topicListProvider = StateNotifierProvider((ref) => new TopicList([]));
final questionTopicState = StateProvider((ref) => new Topic());
final optionListProvider = StateNotifierProvider((ref) => new OptionList([]));
