import React from "react";
import { Outlet } from "react-router";

export const DashboardLayout = () => {
	return (
		<div>
			<h1>ここはLayout</h1>
			<Outlet />
		</div>
	);
};
