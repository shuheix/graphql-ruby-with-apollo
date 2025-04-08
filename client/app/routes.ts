import {
	type RouteConfig,
	index,
	layout,
	route,
} from "@react-router/dev/routes";

export default [
	route("/", "./routes/home.tsx"),
	route("dashboard", "./dashboard/layout.tsx", [
		index("./dashboard/pages/DashboardPage/DashboardPage.tsx"),
		route("mutation", "./dashboard/pages/MutationPage/MutationPage.tsx"),
		route("query", "./dashboard/pages/QueryPage/QueryPage.tsx"),
		route(
			"subscription",
			"./dashboard/pages/SubscriptionPage/SubscriptionPage.tsx",
		),
	]),
] satisfies RouteConfig;
