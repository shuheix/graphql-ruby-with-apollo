import {
	type RouteConfig,
	index,
	layout,
	route,
} from "@react-router/dev/routes";

export default [
	route("/", "./features/graphqlSample/GraphqlSampleLayout.tsx", [
		index("./features/graphqlSample/pages/SamplePage.tsx"),
		route("mutation", "./features/graphqlSample/pages/MutationSamplePage.tsx"),
		route("query", "./features/graphqlSample/pages/QuerySamplePage.tsx"),
		route(
			"subscription",
			"./features/graphqlSample/pages/SubscriptionSamplePage.tsx",
		),
	]),
] satisfies RouteConfig;
