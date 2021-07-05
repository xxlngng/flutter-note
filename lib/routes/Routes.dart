// import 'dart:js';

import '../pages/FormPage.dart';
import 'package:flutter/material.dart';

final routes = {
	'/form':(context, {arguments}) => FormPage(arguments:arguments),
};


Route onGenerateRoute  (settings) {
	print(settings);
	final String? name = settings.name;
	final Function pageContentBuilder = routes[name] as Function;

	// if(pageContentBuilder != null) {
		if(settings.arguments != null) {
			final	Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
			return route;
		} else {
			final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
			return route;
		}
	// }

}